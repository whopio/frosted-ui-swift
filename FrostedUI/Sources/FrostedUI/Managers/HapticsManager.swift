import CoreHaptics
import UIKit

@MainActor
public class HapticManager {
    public static let shared: HapticManager = .init()

    public enum HapticType {
        case buttonPress
        case dataRefresh(intensity: CGFloat)
        case notification(_ type: UINotificationFeedbackGenerator.FeedbackType)
        case impact(_ style: UIImpactFeedbackGenerator.FeedbackStyle, intensity: CGFloat? = nil, duration: TimeInterval? = nil)
        case tabSelection
        case success
        case error

        public init?(type: String, style: String) {
            switch type {
            case "impact":
                switch style {
                case "light":
                    self = .impact(.light)
                case "medium":
                    self = .impact(.medium)
                case "heavy":
                    self = .impact(.heavy)
                case "soft":
                    self = .impact(.soft)
                case "rigid":
                    self = .impact(.rigid)
                default:
                    return nil
                }
            case "notification":
                switch style {
                case "success":
                    self = .notification(.success)
                case "warning":
                    self = .notification(.warning)
                case "error":
                    self = .notification(.error)
                default:
                    return nil
                }
            case "selection":
                self = .tabSelection
            default:
                return nil
            }
        }
    }

    private let selectionGenerator = UISelectionFeedbackGenerator()
    private let notificationGenerator = UINotificationFeedbackGenerator()

    public init() {
        selectionGenerator.prepare()
    }

    @MainActor
    public func fireHaptic(_ type: HapticType) {
        guard supportsHaptics else { return }

        switch type {
        case let .impact(style, intensity, duration):
            if let duration {
                playHapticForDuration(style: style, intensity: intensity ?? 1.0, duration: duration)
            } else {
                impactOccurred(style, intensity: intensity)
            }
        case .buttonPress:
            impactOccurred(.medium)
        case let .dataRefresh(intensity):
            impactOccurred(.heavy, intensity: intensity)
        case let .notification(type):
            notificationGenerator.notificationOccurred(type)
        case .success:
            notificationOccurred(.success)
        case .error:
            notificationOccurred(.error)
        case .tabSelection:
            selectionGenerator.selectionChanged()
        }
    }

    private func impactOccurred(_ style: UIImpactFeedbackGenerator.FeedbackStyle, intensity: CGFloat? = nil) {
        let impactGenerator = UIImpactFeedbackGenerator(style: style)
        impactGenerator.prepare()
        if let intensity {
            impactGenerator.impactOccurred(intensity: intensity)
        } else {
            impactGenerator.impactOccurred()
        }
    }

    private func notificationOccurred(_ type: UINotificationFeedbackGenerator.FeedbackType) {
        notificationGenerator.notificationOccurred(type)
    }

    private func playHapticForDuration(style: UIImpactFeedbackGenerator.FeedbackStyle, intensity: CGFloat, duration: TimeInterval) {
        let startTime = Date()
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] timer in
            let elapsed = Date().timeIntervalSince(startTime)
            if elapsed >= duration {
                timer.invalidate()
            } else {
                Task { @MainActor in
                    self?.impactOccurred(style, intensity: intensity)
                }
            }
        }
    }

    public var supportsHaptics: Bool {
        CHHapticEngine.capabilitiesForHardware().supportsHaptics
    }
}
