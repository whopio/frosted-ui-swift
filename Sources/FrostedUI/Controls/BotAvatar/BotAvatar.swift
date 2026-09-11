import SwiftUI

/// An animated avatar with configurable shape, expression, and status.
///
/// Supply `status` or `expression` to show a face. Without either, only the
/// silhouette is visible. Explicit shape and tint override identity defaults.
public struct BotAvatar: View {
    @Environment(\.frostedTheme) private var theme
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @Environment(\.scenePhase) private var scenePhase
    @State private var pointerGaze: CGPoint?
    @State private var lifeOffset = Double.random(in: 0..<5.2)
    @State private var statusStarted = Date()
    @State private var blinkStarted: Date?

    private let size: CGFloat
    private let shape: BotAvatarShape
    private let coordinates: BotAvatarVector
    private let tint: FrostedTint?
    private let expression: BotAvatarExpression?
    private let status: BotAvatarStatus?
    private let mouth: Bool
    private let notification: Bool
    private let highContrast: Bool
    private let animated: Bool
    private let gaze: CGPoint?
    private let followPointer: Bool
    private let blinkTrigger: Int
    private let notificationBackground: Color?

    public init(
        size: CGFloat = 40,
        identity: String? = nil,
        shape: BotAvatarShape? = nil,
        tint: FrostedTint? = nil,
        expression: BotAvatarExpression? = nil,
        status: BotAvatarStatus? = nil,
        mouth: Bool = true,
        notification: Bool = false,
        highContrast: Bool = false,
        animated: Bool = true,
        gaze: CGPoint? = nil,
        followPointer: Bool = false,
        blinkTrigger: Int = 0,
        notificationBackground: Color? = nil
    ) {
        let derived = identity.map(BotAvatarIdentity.init)
        self.size = size.isFinite ? max(0, size) : 0
        self.shape = shape ?? derived?.shape ?? .circle
        self.coordinates = self.shape.coordinates
        self.tint = tint ?? derived?.tint
        self.expression = expression
        self.status = status
        self.mouth = mouth
        self.notification = notification
        self.highContrast = highContrast
        self.animated = animated
        self.gaze = gaze
        self.followPointer = followPointer
        self.blinkTrigger = blinkTrigger
        self.notificationBackground = notificationBackground
    }

    private var resolvedExpression: BotAvatarExpression? { expression ?? status?.expression }
    private var motionEnabled: Bool { animated && !reduceMotion && scenePhase == .active }
    private var activeGaze: CGPoint? {
        (gaze ?? (followPointer && motionEnabled ? pointerGaze : nil)).map {
            CGPoint(x: Self.clampGaze($0.x), y: Self.clampGaze($0.y))
        }
    }

    static func clampGaze(_ value: CGFloat) -> CGFloat {
        value.isFinite ? min(1, max(-1, value)) : 0
    }

    public var body: some View {
        let palette = tint ?? theme.accent
        TimelineView(.animation(minimumInterval: 1.0 / 30, paused: !motionEnabled || resolvedExpression == nil)) { context in
            let motion = BotAvatarMotion(
                time: context.date.timeIntervalSinceReferenceDate + lifeOffset,
                statusTime: context.date.timeIntervalSince(statusStarted),
                blinkTime: blinkStarted.map { context.date.timeIntervalSince($0) },
                status: status,
                enabled: motionEnabled && resolvedExpression != nil,
                gazing: activeGaze != nil
            )
            ZStack {
                BotAvatarSilhouette(animatableData: coordinates)
                    .fill(highContrast ? palette.twelve : palette.nine)
                if let resolvedExpression {
                    BotAvatarFace(expression: resolvedExpression, shape: shape, mouth: mouth,
                                  color: highContrast ? palette.one : palette.contrastNine,
                                  size: size, blink: motion.blink)
                        .offset(x: size * (motion.x + (activeGaze?.x ?? 0) * 0.1),
                                y: size * (motion.y + (activeGaze?.y ?? 0) * 0.07))
                }
            }
            .scaleEffect(motion.scale)
        }
        .frame(width: size, height: size)
        .overlay(alignment: .topTrailing) {
            if notification {
                Circle()
                    .fill(theme.danger.nine)
                    .frame(width: size * 0.28, height: size * 0.28)
                    .background {
                        Circle().fill(notificationBackground ?? theme.neutral.one)
                            .padding(-max(1.5, size * 0.05))
                    }
                    .transition(.scale.combined(with: .opacity))
            }
        }
        .animation(motionEnabled ? .spring(response: 0.5, dampingFraction: 0.6) : nil, value: shape)
        .animation(motionEnabled ? .spring(response: 0.5, dampingFraction: 0.6) : nil, value: resolvedExpression)
        .animation(motionEnabled ? .spring(response: 0.5, dampingFraction: 0.6) : nil, value: mouth)
        .animation(motionEnabled ? .easeOut(duration: 0.3) : nil, value: activeGaze)
        .animation(motionEnabled ? .easeOut(duration: 0.3) : nil, value: status)
        .animation(motionEnabled ? .easeOut(duration: 0.2) : nil, value: notification)
        .animation(.easeOut(duration: 0.3), value: palette)
        .animation(.easeOut(duration: 0.3), value: highContrast)
        .onContinuousHover { phase in
            guard followPointer, motionEnabled, size > 0 else { return }
            switch phase {
            case .active(let location):
                pointerGaze = CGPoint(x: (location.x - size / 2) / max(size * 3, 160),
                                      y: (location.y - size / 2) / max(size * 3, 160))
            case .ended: pointerGaze = nil
            }
        }
        .onChange(of: status) { statusStarted = Date() }
        .onChange(of: blinkTrigger) { blinkStarted = motionEnabled ? Date() : nil }
        .onChange(of: motionEnabled) { pointerGaze = nil }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(Text("Bot", bundle: .module))
        .accessibilityValue(accessibilityStatus)
    }

    private var accessibilityStatus: Text {
        switch status {
        case .idle: Text("Idle", bundle: .module)
        case .thinking: Text("Thinking", bundle: .module)
        case .working: Text("Working", bundle: .module)
        case .waiting: Text("Waiting", bundle: .module)
        case .blocked: Text("Blocked", bundle: .module)
        case .done: Text("Done", bundle: .module)
        case nil: Text(verbatim: "")
        }
    }
}

private struct BotAvatarFace: View {
    let expression: BotAvatarExpression
    let shape: BotAvatarShape
    let mouth: Bool
    let color: Color
    let size: CGFloat
    let blink: CGFloat

    var body: some View {
        let fit = shape.faceFit(withMouth: mouth)
        ZStack {
            eye(expression.eyes.0)
            eye(expression.eyes.1)
            if mouth {
                let feature = expression.mouth
                BotAvatarMouth(curvature: feature.curvature)
                    .fill(color)
                    .frame(width: feature.width * size, height: feature.height * size)
                    .rotationEffect(.degrees(feature.tilt))
                    .position(x: feature.x * size, y: feature.y * size)
            }
        }
        .frame(width: size, height: size)
        .scaleEffect(fit.scale, anchor: UnitPoint(x: 0.5, y: 0.45))
        .offset(y: fit.dy * size)
    }

    private func eye(_ feature: BotAvatarFeature) -> some View {
        Capsule()
            .fill(color)
            .frame(width: feature.width * size, height: feature.height * size)
            .scaleEffect(x: 1, y: blink)
            .rotationEffect(.degrees(feature.tilt))
            .position(x: feature.x * size, y: feature.y * size)
    }
}
