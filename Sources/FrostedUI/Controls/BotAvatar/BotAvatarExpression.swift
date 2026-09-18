import SwiftUI

public enum BotAvatarExpression: String, CaseIterable, Sendable {
    case neutral
    case happy
    case wide
    case wink
    case sleepy
    case angry
    case sad
    case suspicious

    // Keep this vocabulary in sync with frosted-ui's bot-avatar.expressions.ts.
    // Every feature has four cubic segments, so any expression can morph into any other.
    var eyes: (BotAvatarFeature, BotAvatarFeature) {
        switch self {
        case .neutral:
            (.oval(0.35, 0.43, 0.0725, 0.0725), .oval(0.65, 0.43, 0.0725, 0.0725))
        case .happy:
            (.crescentEye(0.346, 0.416), .crescentEye(0.654, 0.416))
        case .wide:
            (.oval(0.345, 0.408, 0.09, 0.09), .oval(0.655, 0.408, 0.09, 0.09))
        case .wink:
            (.oval(0.35, 0.43, 0.0725, 0.0725),
             .blob((0.58, 0.452), (0.65, 0.443), (0.72, 0.452), (0.65, 0.398))
                .rotated(around: CGPoint(x: 0.65, y: 0.43), degrees: -6))
        case .sleepy:
            (.tiltedOval(0.35, 0.463, 0.0725, 0.032, -7), .tiltedOval(0.65, 0.463, 0.0725, 0.032, 7))
        case .angry:
            (.tiltedOval(0.355, 0.452, 0.0775, 0.037, 21), .tiltedOval(0.645, 0.452, 0.0775, 0.037, -21))
        case .sad:
            (.tiltedOval(0.353, 0.474, 0.064, 0.0575, -12), .tiltedOval(0.647, 0.474, 0.064, 0.0575, 12))
        case .suspicious:
            (.oval(0.35, 0.437, 0.0775, 0.031), .oval(0.65, 0.428, 0.0775, 0.044))
        }
    }

    var mouth: BotAvatarFeature {
        switch self {
        case .neutral: .blob((0.385, 0.612), (0.5, 0.655), (0.615, 0.612), (0.5, 0.586))
        case .happy: .blob((0.315, 0.59), (0.5, 0.727), (0.685, 0.59), (0.5, 0.572))
        case .wide: .oval(0.5, 0.657, 0.075, 0.09)
        case .wink: .blob((0.378, 0.627), (0.518, 0.705), (0.645, 0.586), (0.505, 0.586))
        case .sleepy: .oval(0.5, 0.664, 0.044, 0.052)
        case .angry: .blob((0.345, 0.678), (0.5, 0.662), (0.655, 0.678), (0.5, 0.604))
        case .sad: .blob((0.383, 0.7), (0.5, 0.684), (0.617, 0.7), (0.5, 0.614))
        case .suspicious: .blob((0.425, 0.645), (0.515, 0.664), (0.605, 0.625), (0.515, 0.606))
        }
    }
}

public enum BotAvatarStatus: String, CaseIterable, Sendable {
    case idle, thinking, working, waiting, blocked, done

    var expression: BotAvatarExpression {
        switch self {
        case .idle, .thinking: .neutral
        case .working: .suspicious
        case .waiting: .wide
        case .blocked: .sad
        case .done: .happy
        }
    }
}
