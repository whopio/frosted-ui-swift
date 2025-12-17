import SwiftUI

public struct FrostedIconSet {
    public let size12: FrostedIcon
    public let size16: FrostedIcon
    public let size20: FrostedIcon
    public let size24: FrostedIcon
    public let size32: FrostedIcon

    public init(
        size12: FrostedIcon,
        size16: FrostedIcon,
        size20: FrostedIcon,
        size24: FrostedIcon,
        size32: FrostedIcon
    ) {
        self.size12 = size12
        self.size16 = size16
        self.size20 = size20
        self.size24 = size24
        self.size32 = size32
    }
}