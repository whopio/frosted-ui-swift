import CoreMotion
import QuartzCore
import SwiftUI

private struct GyroscopeTilt3DModifier: ViewModifier {
    let cornerRadius: CGFloat
    let maxRotation: Double
    let shadowColor: Color
    let shadowIntensity: Double
    let isActive: Bool

    @State private var animator = GyroscopeTiltAnimator()

    private var tiltIntensity: Double {
        min(sqrt(animator.pitch * animator.pitch + animator.roll * animator.roll) * 2, 1.0)
    }

    private var specularCenter: UnitPoint {
        UnitPoint(
            x: 0.5 - animator.roll * 0.6,
            y: 0.3 - animator.pitch * 0.5
        )
    }

    private var edgeLightTop: Double {
        max(0.0, animator.pitch * 2.0)
    }

    func body(content: Content) -> some View {
        content
            .overlay {
                ZStack {
                    RadialGradient(
                        colors: [
                            .white.opacity(0.2 * tiltIntensity),
                            .white.opacity(0.06 * tiltIntensity),
                            .clear,
                        ],
                        center: specularCenter,
                        startRadius: 0,
                        endRadius: 180
                    )
                    .blendMode(.plusLighter)

                    LinearGradient(
                        stops: [
                            .init(color: .white.opacity(edgeLightTop * 0.3), location: 0),
                            .init(color: .clear, location: 0.15),
                            .init(color: .clear, location: 1.0),
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .blendMode(.plusLighter)

                    LinearGradient(
                        stops: [
                            .init(color: .white.opacity(max(0, -animator.roll) * 0.2), location: 0),
                            .init(color: .clear, location: 0.1),
                            .init(color: .clear, location: 0.9),
                            .init(color: .white.opacity(max(0, animator.roll) * 0.2), location: 1.0),
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .blendMode(.plusLighter)

                    RoundedRectangle(cornerRadius: cornerRadius)
                        .strokeBorder(
                            LinearGradient(
                                stops: [
                                    .init(color: .white.opacity(0.25 + edgeLightTop * 0.3), location: 0),
                                    .init(color: .white.opacity(0.08), location: 0.4),
                                    .init(color: .white.opacity(0.04), location: 1.0),
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            ),
                            lineWidth: 1
                        )

                    LinearGradient(
                        stops: [
                            .init(color: .clear, location: 0.6),
                            .init(color: .black.opacity(max(0, -animator.pitch) * 0.3), location: 1.0),
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .blendMode(.multiply)
                }
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                .allowsHitTesting(false)
            }
            .rotation3DEffect(
                .degrees(animator.pitch * maxRotation),
                axis: (x: -1, y: 0, z: 0),
                perspective: 0.5
            )
            .rotation3DEffect(
                .degrees(animator.roll * maxRotation),
                axis: (x: 0, y: 1, z: 0),
                perspective: 0.5
            )
            .shadow(color: shadowColor.opacity((0.3 + tiltIntensity * 0.4) * shadowIntensity), radius: 28 * shadowIntensity, y: 12 * shadowIntensity)
            .shadow(color: .black.opacity(0.25 * shadowIntensity), radius: 40 * shadowIntensity, y: 20 * shadowIntensity)
            .onAppear { if isActive { animator.start() } }
            .onDisappear { animator.stop() }
            .onChange(of: isActive) { _, active in
                if active { animator.start() } else { animator.stop() }
            }
    }
}

public extension View {
    /// Adds a live 3D tilt that follows device orientation via CoreMotion,
    /// plus specular highlights and rim lighting to give the view a glossy
    /// physical feel. Falls back to an ambient procedural animation when the
    /// gyroscope is unavailable (e.g. simulator).
    func gyroscopeTilt3D(
        cornerRadius: CGFloat = 12,
        maxRotation: Double = 16,
        shadowColor: Color = .white,
        shadowIntensity: Double = 1.0,
        isActive: Bool = true
    ) -> some View {
        modifier(GyroscopeTilt3DModifier(
            cornerRadius: cornerRadius,
            maxRotation: maxRotation,
            shadowColor: shadowColor,
            shadowIntensity: shadowIntensity,
            isActive: isActive
        ))
    }
}

@Observable
private final class GyroscopeTiltAnimator {
    private(set) var pitch: Double = 0
    private(set) var roll: Double = 0

    private let motionManager = CMMotionManager()
    private var displayLink: CADisplayLink?
    private var phase: Double = 0
    private var isUsingGyroscope = false
    private var hasInitialReading = false

    private var baselinePitch: Double = 0
    private var baselineRoll: Double = 0

    private let responsiveness: Double = 0.15
    private let baselineDrift: Double = 0.03

    func start() {
        stop()
        hasInitialReading = false
        if motionManager.isDeviceMotionAvailable {
            startGyroscope()
        } else {
            startFallbackAnimation()
        }
    }

    private func startGyroscope() {
        isUsingGyroscope = true
        motionManager.deviceMotionUpdateInterval = 1.0 / 60.0
        motionManager.startDeviceMotionUpdates(to: .main) { [weak self] motion, _ in
            guard let self, let attitude = motion?.attitude else { return }

            let rawPitch = attitude.pitch
            let rawRoll = attitude.roll

            if !hasInitialReading {
                baselinePitch = rawPitch
                baselineRoll = rawRoll
                hasInitialReading = true
                return
            }

            baselinePitch += (rawPitch - baselinePitch) * baselineDrift
            baselineRoll += (rawRoll - baselineRoll) * baselineDrift

            let deltaPitch = max(-0.5, min(0.5, rawPitch - baselinePitch))
            let deltaRoll = max(-0.5, min(0.5, rawRoll - baselineRoll))
            pitch += (deltaPitch - pitch) * responsiveness
            roll += (deltaRoll - roll) * responsiveness
        }
    }

    private func startFallbackAnimation() {
        isUsingGyroscope = false
        let target = DisplayLinkProxy { [weak self] in
            self?.updateFallback()
        }
        displayLink = CADisplayLink(target: target, selector: #selector(DisplayLinkProxy.handleDisplayLink))
        displayLink?.add(to: .main, forMode: .common)
    }

    private func updateFallback() {
        phase += 0.014
        pitch = sin(phase * 0.7) * 0.4 + cos(phase * 0.3) * 0.25
        roll = cos(phase * 0.5) * 0.45 + sin(phase * 0.4) * 0.25
    }

    func stop() {
        if isUsingGyroscope {
            motionManager.stopDeviceMotionUpdates()
        }
        displayLink?.invalidate()
        displayLink = nil
        pitch = 0
        roll = 0
    }

    deinit {
        displayLink?.invalidate()
    }
}

private final class DisplayLinkProxy: NSObject {
    let callback: () -> Void

    init(callback: @escaping () -> Void) {
        self.callback = callback
    }

    @objc func handleDisplayLink() {
        callback()
    }
}
