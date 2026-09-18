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
    private let coordinates: [Double]
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
        self.coordinates = self.shape.morphCoordinates
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
                BotAvatarSilhouette(coordinates: coordinates)
                    .fill(highContrast ? palette.twelve : palette.nine)
                    .animation(motionEnabled ? .spring(response: 0.5, dampingFraction: 0.6) : nil, value: shape)
                if let resolvedExpression {
                    BotAvatarFace(expression: resolvedExpression, shape: shape, mouth: mouth,
                                  color: highContrast ? palette.one : palette.contrastNine,
                                  size: size, blink: motion.blink, animated: motionEnabled)
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
        .animation(motionEnabled ? .spring(response: 0.5, dampingFraction: 0.6) : nil, value: mouth)
        .animation(motionEnabled ? .easeOut(duration: 0.3) : nil, value: activeGaze)
        .animation(motionEnabled ? .easeOut(duration: 0.3) : nil, value: status)
        .animation(motionEnabled ? .easeOut(duration: 0.2) : nil, value: notification)
        .animation(.easeOut(duration: 0.3), value: palette)
        .animation(.easeOut(duration: 0.3), value: highContrast)
        .background {
            if followPointer && motionEnabled && resolvedExpression != nil {
                BotAvatarPointerTracking(enabled: true) { pointerGaze = $0 }
            }
        }
        .onChange(of: status) { statusStarted = Date() }
        .onChange(of: blinkTrigger) { blinkStarted = motionEnabled ? Date() : nil }
        .onChange(of: motionEnabled) { pointerGaze = nil }
        .onChange(of: followPointer) { pointerGaze = nil }
        .onChange(of: resolvedExpression) {
            if resolvedExpression == nil { pointerGaze = nil }
        }
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
    let animated: Bool

    private var morph: Animation? {
        animated ? .spring(response: 0.5, dampingFraction: 0.6) : nil
    }

    var body: some View {
        ZStack {
            eye(expression.eyes.0.fitted(to: shape))
            eye(expression.eyes.1.fitted(to: shape))
            if mouth {
                let feature = expression.mouth.fitted(to: shape)
                feature.fill(color)
                    // The eyes react first; the mouth follows 70ms later.
                    .animation(morph?.delay(0.07), value: feature)
            }
        }
        .frame(width: size, height: size)
    }

    private func eye(_ feature: BotAvatarFeature) -> some View {
        feature.fill(color)
            // Tilt is already in the path. Blink vertically around its bounds,
            // matching the frontend's transform-box: fill-box behavior.
            .scaleEffect(x: 1, y: blink, anchor: UnitPoint(x: 0.5, y: feature.bounds.midY))
            .animation(morph, value: feature)
    }
}
