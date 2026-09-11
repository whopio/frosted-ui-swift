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

    var eyes: (BotAvatarFeature, BotAvatarFeature) {
        switch self {
        case .neutral: (.init(0.36, 0.44, 0.13, 0.3, -10), .init(0.64, 0.44, 0.13, 0.3, -10))
        case .happy: (.init(0.36, 0.42, 0.14, 0.17, -10), .init(0.64, 0.42, 0.14, 0.17, -10))
        case .wide: (.init(0.36, 0.44, 0.17, 0.34, -6), .init(0.64, 0.44, 0.17, 0.34, -6))
        case .wink: (.init(0.36, 0.44, 0.13, 0.3, -10), .init(0.64, 0.46, 0.15, 0.05, -10))
        case .sleepy: (.init(0.36, 0.48, 0.14, 0.13, -10), .init(0.64, 0.48, 0.14, 0.13, -10))
        case .angry: (.init(0.36, 0.45, 0.13, 0.24, -22), .init(0.64, 0.45, 0.13, 0.24, 22))
        case .sad: (.init(0.36, 0.46, 0.13, 0.24, 18), .init(0.64, 0.46, 0.13, 0.24, -18))
        case .suspicious: (.init(0.36, 0.44, 0.15, 0.1, 0), .init(0.64, 0.44, 0.15, 0.1, 0))
        }
    }

    var mouth: BotAvatarFeature {
        switch self {
        case .neutral: .init(0.5, 0.63, 0.19, 0.06, -3, curvature: 0)
        case .happy: .init(0.5, 0.625, 0.3, 0.13, 0, curvature: 1)
        case .wide: .init(0.5, 0.66, 0.14, 0.12, 0, curvature: 0)
        case .wink: .init(0.52, 0.63, 0.21, 0.065, -8, curvature: 1)
        case .sleepy: .init(0.5, 0.65, 0.09, 0.09, 0, curvature: 0)
        case .angry: .init(0.5, 0.655, 0.23, 0.09, 0, curvature: -1)
        case .sad: .init(0.5, 0.66, 0.19, 0.075, 0, curvature: -1)
        case .suspicious: .init(0.5, 0.635, 0.14, 0.05, -6, curvature: 0)
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

struct BotAvatarFeature {
    var x, y, width, height, tilt: CGFloat
    var curvature: CGFloat

    init(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat, _ tilt: CGFloat, curvature: CGFloat = 0) {
        self.x = x
        self.y = y
        self.width = width
        self.height = height
        self.tilt = tilt
        self.curvature = curvature
    }
}
