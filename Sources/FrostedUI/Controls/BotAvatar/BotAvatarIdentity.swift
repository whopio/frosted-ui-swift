import SwiftUI

/// Derives a consistent shape and tint from an identifier.
public struct BotAvatarIdentity: Equatable {
    public let shape: BotAvatarShape
    public let tint: FrostedTint

    // The palette and shape case ordering determine the identity mapping.
    // Reordering either changes the appearance of existing identifiers.
    private static let tints: [FrostedTint] = [
        .tomato, .red, .ruby, .crimson, .pink, .plum, .purple, .violet, .iris,
        .cyan, .teal, .jade, .green, .grass, .brown, .blue, .orange, .indigo,
        .sky, .mint, .yellow, .amber, .lime, .lemon, .magenta, .gold, .bronze,
    ]

    public init(_ identifier: String) {
        shape = BotAvatarShape.allCases[Int(Self.hash(identifier, seed: 0)) % BotAvatarShape.allCases.count]
        tint = Self.tints[Int(Self.hash(identifier, seed: 1)) % Self.tints.count]
    }

    // Hash UTF-16 code units so Unicode identifiers map consistently across platforms.
    private static func hash(_ input: String, seed: UInt32) -> UInt32 {
        input.utf16.reduce(0x811c9dc5 ^ seed) { ($0 ^ UInt32($1)) &* 0x01000193 }
    }
}
