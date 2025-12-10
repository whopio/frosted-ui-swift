import SwiftUI

public enum FrostedSemantic: CaseIterable {
    case accent
    case neutral
    case danger
    case info
    case success
    case warning
}

public struct FrostedTheme {
    public let accent: FrostedTint
    public let neutral: FrostedTint
    public let danger: FrostedTint
    public let info: FrostedTint
    public let success: FrostedTint
    public let warning: FrostedTint

    public static let `default` = FrostedTheme(
        accent: .blue,
        neutral: .gray,
        danger: .red,
        info: .sky,
        success: .green,
        warning: .amber
    )

    public func tint(for semantic: FrostedSemantic) -> FrostedTint {
        switch semantic {
        case .accent: accent
        case .neutral: neutral
        case .danger: danger
        case .info: info
        case .success: success
        case .warning: warning
        }
    }
}

public extension EnvironmentValues {
    @Entry var frostedTheme: FrostedTheme = .default
}
