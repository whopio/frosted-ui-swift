import SwiftUI

public enum FrostedTextSize {
    case zero
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine

    var fontSize: CGFloat {
        switch self {
        case .zero: 10
        case .one: 12
        case .two: 14
        case .three: 16
        case .four: 18
        case .five: 20
        case .six: 22
        case .seven: 24
        case .eight: 26
        case .nine: 28
        }
    }

    var fontWeight: Font.Weight {
        switch self {
        case .light: .light
        case .regular: .regular
        case .medium: .medium
        case .semibold: .semibold
        case .bold: .bold
        }
    }
}

public enum FrostedTextWeight {
    case light
    case regular
    case medium
    case semibold
    case bold
}

public extension Text {
    func frostedText(
        size: FrostedTextSize = .one,
        weight: FrostedTextWeight = .regular,
        color: FrostedTint = .gray,
        trim: Bool = false
    ) -> some View {
        font(.system(size: size.fontSize, weight: weight.fontWeight))
            .foregroundColor(color.nine)
    }
}
