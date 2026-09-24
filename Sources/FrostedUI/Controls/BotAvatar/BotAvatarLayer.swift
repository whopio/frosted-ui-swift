import QuartzCore
import SwiftUI

/// Everything the layer renderer needs. Motion runs as Core Animation loops on the
/// render server, so an animating avatar does no per-frame work in the app.
struct BotAvatarLayerState: Equatable {
    var size: CGFloat
    var coordinates: [Double]
    var eyes: [BotAvatarFeature]
    var mouth: BotAvatarFeature?
    var bodyColor: Color
    var faceColor: Color
    var colorScheme: ColorScheme
    var status: BotAvatarStatus?
    var statusStarted: Date
    var lifeOffset: Double
    var gaze: CGPoint?
    var blinkStarted: Date?

    var loopIdentity: LoopIdentity {
        LoopIdentity(size: size, status: status, statusStarted: statusStarted, lifeOffset: lifeOffset, gazing: gaze != nil)
    }

    struct LoopIdentity: Equatable {
        var size: CGFloat
        var status: BotAvatarStatus?
        var statusStarted: Date
        var lifeOffset: Double
        var gazing: Bool
    }
}

#if os(macOS)
    typealias BotAvatarPlatformView = NSView

    struct BotAvatarLayer: NSViewRepresentable {
        let state: BotAvatarLayerState

        func makeNSView(context _: Context) -> BotAvatarLayerView {
            BotAvatarLayerView()
        }

        func updateNSView(_ view: BotAvatarLayerView, context: Context) {
            view.apply(state, environment: context.environment)
        }
    }
#else
    typealias BotAvatarPlatformView = UIView

    struct BotAvatarLayer: UIViewRepresentable {
        let state: BotAvatarLayerState

        func makeUIView(context _: Context) -> BotAvatarLayerView {
            BotAvatarLayerView()
        }

        func updateUIView(_ view: BotAvatarLayerView, context: Context) {
            view.apply(state, environment: context.environment)
        }
    }
#endif

final class BotAvatarLayerView: BotAvatarPlatformView {
    private static let sine = CAMediaTimingFunction(controlPoints: 0.37, 0, 0.63, 1)
    private static let stillActions: [String: CAAction] = [
        "position": NSNull(), "bounds": NSNull(), "path": NSNull(), "fillColor": NSNull(),
        "transform": NSNull(), "anchorPoint": NSNull(), "hidden": NSNull(), "contentsScale": NSNull(),
    ]

    private let figure = CALayer()
    private let silhouette = CAShapeLayer()
    private let face = CALayer()
    private let eyes = [CAShapeLayer(), CAShapeLayer()]
    private let mouth = CAShapeLayer()
    private var state: BotAvatarLayerState?
    private var colors: (CGColor, CGColor)?

    init() {
        super.init(frame: .zero)
        #if os(macOS)
            wantsLayer = true
        #else
            isUserInteractionEnabled = false
            backgroundColor = .clear
        #endif
        let layers: [CALayer] = [figure, silhouette, face, mouth] + eyes
        layers.forEach { $0.actions = Self.stillActions }
        rootLayer.addSublayer(figure)
        figure.addSublayer(silhouette)
        figure.addSublayer(face)
        eyes.forEach(face.addSublayer)
        face.addSublayer(mouth)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) is not supported")
    }

    #if os(macOS)
        override var isFlipped: Bool {
            true
        }

        override func hitTest(_: NSPoint) -> NSView? {
            nil
        }

        override func viewDidChangeBackingProperties() {
            super.viewDidChangeBackingProperties()
            updateContentsScale(window?.backingScaleFactor ?? 2)
        }

        private var rootLayer: CALayer {
            layer!
        }
    #else
        override func didMoveToWindow() {
            super.didMoveToWindow()
            updateContentsScale(window?.screen.scale ?? 2)
        }

        private var rootLayer: CALayer {
            layer
        }
    #endif

    private func updateContentsScale(_ scale: CGFloat) {
        ([figure, silhouette, face, mouth] + eyes).forEach { $0.contentsScale = scale }
    }

    func apply(_ next: BotAvatarLayerState, environment: EnvironmentValues) {
        let nextColors = (next.bodyColor.resolve(in: environment).cgColor, next.faceColor.resolve(in: environment).cgColor)
        let previous = state
        guard previous != next || colors.map({ $0.0 != nextColors.0 || $0.1 != nextColors.1 }) ?? true else { return }
        state = next
        let rect = CGRect(x: 0, y: 0, width: next.size, height: next.size)
        let resized = previous?.size != next.size

        CATransaction.begin()
        CATransaction.setDisableActions(true)
        for layer in [figure, face] {
            layer.bounds = rect
            layer.position = CGPoint(x: rect.midX, y: rect.midY)
        }
        silhouette.frame = rect
        mouth.frame = rect
        morph(silhouette, to: BotAvatarSilhouette(coordinates: next.coordinates).path(in: rect).cgPath,
              animated: !resized && previous?.coordinates != next.coordinates)
        for (layer, feature) in zip(eyes, next.eyes) {
            let anchor = CGPoint(x: 0.5, y: feature.bounds.midY)
            layer.bounds = rect
            layer.anchorPoint = anchor
            layer.position = CGPoint(x: rect.width * anchor.x, y: rect.height * anchor.y)
            morph(layer, to: feature.path(in: rect).cgPath, animated: !resized && previous?.eyes != next.eyes)
        }
        mouth.isHidden = next.mouth == nil
        if let feature = next.mouth {
            morph(mouth, to: feature.path(in: rect).cgPath, animated: !resized && previous?.mouth != next.mouth, delay: 0.07)
        }
        fill(silhouette, nextColors.0, animated: colors != nil)
        (eyes + [mouth]).forEach { fill($0, nextColors.1, animated: colors != nil) }
        colors = nextColors

        let base = BotAvatarMotion(time: 0, statusTime: 0, blinkTime: nil, status: next.status, enabled: false, gazing: false)
        let gaze = next.gaze ?? .zero
        let offset = CGPoint(x: rect.midX + next.size * gaze.x * 0.1, y: rect.midY + next.size * (base.y + gaze.y * 0.07))
        if previous != nil, !resized, face.position != offset {
            let move = CABasicAnimation(keyPath: "position")
            move.fromValue = Self.value(face.presentation()?.position ?? face.position)
            move.toValue = Self.value(offset)
            move.duration = 0.3
            move.timingFunction = CAMediaTimingFunction(name: .easeOut)
            face.add(move, forKey: "offset")
        }
        face.position = offset
        CATransaction.commit()

        if previous?.loopIdentity != next.loopIdentity { startLoops(next) }
        if let started = next.blinkStarted, started != previous?.blinkStarted {
            play(eyes, "transform.scale.y", duration: 0.34, frames: [(0, 1), (0.35, 0.08), (0.55, 0.08), (1, 1)],
                 elapsed: Date().timeIntervalSince(started), key: "manualBlink")
        }
        if next.status == .done, previous?.statusStarted != next.statusStarted || previous?.status != .done {
            play([figure], "transform.scale", duration: 0.6, frames: [(0, 1), (0.4, 1.04), (1, 1)],
                 elapsed: Date().timeIntervalSince(next.statusStarted), key: "donePulse")
        }
    }

    private func startLoops(_ state: BotAvatarLayerState) {
        let now = Date().timeIntervalSinceReferenceDate
        let time = now + state.lifeOffset
        figure.add(loop("transform.scale", duration: 5.6, frames: [(0, 1), (0.5, 1.005), (1, 1)], time: time), forKey: "breath")
        for eye in eyes {
            eye.add(loop("transform.scale.y", duration: 5.2, frames: [(0, 1), (0.91, 1), (0.933, 0.08), (0.972, 1), (1, 1)], time: time), forKey: "blink")
        }
        face.removeAnimation(forKey: "driftX")
        face.removeAnimation(forKey: "driftY")
        guard state.gaze == nil, let drift = Self.drift(for: state.status) else { return }
        let clock = drift.statusClock ? now - state.statusStarted.timeIntervalSinceReferenceDate : time
        face.add(loop("transform.translation.x", duration: drift.duration, frames: drift.x.map { ($0.0, $0.1 * state.size) }, time: clock), forKey: "driftX")
        face.add(loop("transform.translation.y", duration: drift.duration, frames: drift.y.map { ($0.0, $0.1 * state.size) }, time: clock), forKey: "driftY")
    }

    private static func drift(for status: BotAvatarStatus?) -> (duration: Double, statusClock: Bool, x: [(Double, Double)], y: [(Double, Double)])? {
        switch status {
        case .thinking:
            (4.4, false, [(0, 0), (0.25, -0.025), (0.6, 0.025), (0.85, 0.01), (1, 0)],
             [(0, 0), (0.25, -0.003), (0.6, -0.005), (0.85, 0.002), (1, 0)])
        case .working:
            (1.8, true, [(0, 0), (0.12, -0.03), (0.42, 0.03), (0.52, -0.03), (0.88, 0.03), (1, 0)],
             [(0, 0), (0.12, -0.01), (0.42, -0.01), (0.52, 0.01), (0.88, 0.01), (1, 0)])
        case .waiting:
            (5.2, false, [(0, 0), (0.12, -0.065), (0.3, -0.065), (0.42, 0.065), (0.6, 0.065), (0.72, 0), (1, 0)],
             [(0, 0), (0.12, 0.005), (0.6, 0.005), (0.72, 0), (1, 0)])
        case .blocked:
            nil
        default:
            (9, false, [(0, 0), (0.18, 0.009), (0.42, -0.008), (0.58, 0.003), (0.8, -0.006), (1, 0)],
             [(0, 0), (0.18, -0.006), (0.42, 0.005), (0.58, 0.009), (0.8, -0.005), (1, 0)])
        }
    }

    private func loop(_ keyPath: String, duration: Double, frames: [(Double, Double)], time: Double) -> CAKeyframeAnimation {
        let animation = keyframes(keyPath, duration: duration, frames: frames)
        let remainder = time.truncatingRemainder(dividingBy: duration)
        animation.timeOffset = remainder < 0 ? remainder + duration : remainder
        animation.repeatCount = .infinity
        return animation
    }

    private func play(_ layers: [CALayer], _ keyPath: String, duration: Double, frames: [(Double, Double)], elapsed: Double, key: String) {
        guard elapsed >= 0, elapsed < duration else { return }
        let progress = elapsed / duration
        let remaining = [(progress, Self.sample(frames, at: progress))] + frames.filter { $0.0 > progress }
        let animation = keyframes(keyPath, duration: duration - elapsed, frames: remaining.map { (($0.0 - progress) / (1 - progress), $0.1) })
        layers.forEach { $0.add(animation, forKey: key) }
    }

    private static func value(_ point: CGPoint) -> NSValue {
        #if os(macOS)
            NSValue(point: point)
        #else
            NSValue(cgPoint: point)
        #endif
    }

    private func keyframes(_ keyPath: String, duration: Double, frames: [(Double, Double)]) -> CAKeyframeAnimation {
        let animation = CAKeyframeAnimation(keyPath: keyPath)
        animation.keyTimes = frames.map { NSNumber(value: $0.0) }
        animation.values = frames.map(\.1)
        animation.timingFunctions = Array(repeating: Self.sine, count: frames.count - 1)
        animation.duration = duration
        animation.isRemovedOnCompletion = true
        return animation
    }

    private static func sample(_ frames: [(Double, Double)], at phase: Double) -> Double {
        for index in 1..<frames.count where phase <= frames[index].0 {
            let (start, a) = frames[index - 1]
            let (end, b) = frames[index]
            let progress = min(1, max(0, (phase - start) / (end - start)))
            return a + (b - a) * (1 - cos(progress * .pi)) / 2
        }
        return frames.last?.1 ?? 0
    }

    private func morph(_ layer: CAShapeLayer, to path: CGPath, animated: Bool, delay: Double = 0) {
        if animated, let from = layer.presentation()?.path ?? layer.path {
            let spring = CASpringAnimation(keyPath: "path")
            spring.fromValue = from
            spring.toValue = path
            spring.mass = 1
            spring.stiffness = 157.91
            spring.damping = 15.08
            spring.duration = spring.settlingDuration
            if delay > 0 {
                spring.beginTime = layer.convertTime(CACurrentMediaTime(), from: nil) + delay
                spring.fillMode = .backwards
            }
            layer.add(spring, forKey: "morph")
        }
        layer.path = path
    }

    private func fill(_ layer: CAShapeLayer, _ color: CGColor, animated: Bool) {
        guard layer.fillColor != color else { return }
        if animated, let from = layer.presentation()?.fillColor ?? layer.fillColor {
            let fade = CABasicAnimation(keyPath: "fillColor")
            fade.fromValue = from
            fade.toValue = color
            fade.duration = 0.3
            fade.timingFunction = CAMediaTimingFunction(name: .easeOut)
            layer.add(fade, forKey: "fill")
        }
        layer.fillColor = color
    }
}
