import UIKit
import SwiftUI

public enum FrostedTextSize: CaseIterable {
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
        case .six: 24
        case .seven: 28
        case .eight: 35
        case .nine: 60
        }
    }

    var letterSpacing: CGFloat {
        switch self {
        case .zero: 0
        case .one: fontSize * 0.0025 // 0.0025em
        case .two: 0 // 0em
        case .three: 0 // 0em
        case .four: fontSize * -0.0025 // -0.0025em
        case .five: fontSize * -0.005 // -0.005em
        case .six: fontSize * -0.00625 // -0.00625em
        case .seven: fontSize * -0.0075 // -0.0075em
        case .eight: fontSize * -0.01 // -0.01em
        case .nine: fontSize * -0.025 // -0.025em
        }
    }

    var lineHeight: CGFloat {
        switch self {
        case .zero: 14
        case .one: 16
        case .two: 20
        case .three: 24
        case .four: 26
        case .five: 28
        case .six: 30
        case .seven: 36
        case .eight: 40
        case .nine: 60
        }
    }

    /// The font's actual intrinsic line height (ascender + descender + leading).
    var fontLineHeight: CGFloat {
        UIFont.systemFont(ofSize: fontSize).lineHeight
    }

    /// Extra spacing between lines to match the target line height.
    var lineSpacing: CGFloat {
        lineHeight - fontLineHeight
    }

    /// Vertical padding to match CSS line-height box model.
    /// CSS distributes extra space as half-leading above and below; SwiftUI does not.
    var verticalPadding: CGFloat {
        (lineHeight - fontLineHeight) / 2
    }
}

public enum FrostedHeadingSize: CaseIterable {
    case one
    case two
    case three
    case four
    case five

    var fontSize: CGFloat {
        switch self {
        case .one: 24
        case .two: 32
        case .three: 40
        case .four: 48
        case .five: 64
        }
    }

    var letterSpacing: CGFloat {
        switch self {
        case .one: fontSize * -0.00625
        case .two: fontSize * -0.01
        case .three: fontSize * -0.025
        case .four: fontSize * -0.03
        case .five: fontSize * -0.035
        }
    }

    var lineHeight: CGFloat {
        switch self {
        case .one: 30
        case .two: 40
        case .three: 48
        case .four: 56
        case .five: 72
        }
    }

    var fontLineHeight: CGFloat {
        UIFont.systemFont(ofSize: fontSize).lineHeight
    }

    var lineSpacing: CGFloat {
        lineHeight - fontLineHeight
    }

    var verticalPadding: CGFloat {
        (lineHeight - fontLineHeight) / 2
    }
}

public enum FrostedTextWeight: CaseIterable {
    case light
    case regular
    case medium
    case semibold
    case bold
}

extension FrostedTextWeight {
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

public extension Text {
    func frostedText(
        size: FrostedTextSize = .two,
        weight: FrostedTextWeight = .regular,
        rawColor: Color,
        trim: Bool = false
    ) -> some View {
        font(.system(size: size.fontSize, weight: weight.fontWeight))
            .tracking(size.letterSpacing)
            .lineSpacing(trim ? 0 : size.lineSpacing)
            .padding(.vertical, trim ? 0 : size.verticalPadding)
            .foregroundColor(rawColor)
    }

    func frostedText(
        size: FrostedTextSize = .two,
        weight: FrostedTextWeight = .regular,
        color: FrostedColor,
        trim: Bool = false
    ) -> some View {
        frostedText(
            size: size,
            weight: weight,
            rawColor: Color(color),
            trim: trim
        )
    }

    // I'll leave this here for now, but not sure if we need it. It introduces the name of tint which may
    // be confusing with the color name.
    // func frostedText(
    //     size: FrostedTextSize = .two,
    //     weight: FrostedTextWeight = .regular,
    //     tint: FrostedTint,
    //     trim: Bool = false
    // ) -> some View {
    //     frostedText(
    //         size: size,
    //         weight: weight,
    //         color: tint.nine,
    //         trim: trim
    //     )
    // }

    func frostedText(
        size: FrostedTextSize = .two,
        weight: FrostedTextWeight = .regular,
        trim: Bool = false
    ) -> some View {
        ThemeProvider { theme in
            frostedText(
                size: size,
                weight: weight,
                rawColor: theme.neutral.twelve,
                trim: trim
            )
        }
    }

    func frostedText(
        size: FrostedTextSize = .two,
        weight: FrostedTextWeight = .regular,
        semantic: FrostedSemantic,
        trim: Bool = false
    ) -> some View {
        ThemeProvider { theme in
            frostedText(
                size: size,
                weight: weight,
                rawColor: theme.tint(for: semantic).nine,
                trim: trim
            )
        }
    }
}

public extension Text {
    func frostedHeading(
        size: FrostedHeadingSize = .one,
        weight: FrostedTextWeight = .bold,
        rawColor: Color,
        trim: Bool = false
    ) -> some View {
        font(.system(size: size.fontSize, weight: weight.fontWeight))
            .tracking(size.letterSpacing)
            .lineSpacing(trim ? 0 : size.lineSpacing)
            .padding(.vertical, trim ? 0 : size.verticalPadding)
            .foregroundColor(rawColor)
    }

    func frostedHeading(
        size: FrostedHeadingSize = .one,
        weight: FrostedTextWeight = .bold,
        color: FrostedColor,
        trim: Bool = false
    ) -> some View {
        frostedHeading(
            size: size,
            weight: weight,
            rawColor: Color(color),
            trim: trim
        )
    }

    func frostedHeading(
        size: FrostedHeadingSize = .one,
        weight: FrostedTextWeight = .bold,
        trim: Bool = false
    ) -> some View {
        ThemeProvider { theme in
            frostedHeading(
                size: size,
                weight: weight,
                rawColor: theme.neutral.twelve,
                trim: trim
            )
        }
    }

    func frostedHeading(
        size: FrostedHeadingSize = .one,
        weight: FrostedTextWeight = .bold,
        semantic: FrostedSemantic,
        trim: Bool = false
    ) -> some View {
        ThemeProvider { theme in
            frostedHeading(
                size: size,
                weight: weight,
                rawColor: theme.tint(for: semantic).nine,
                trim: trim
            )
        }
    }
}

#Preview("Heading") {
    ForEach(FrostedHeadingSize.allCases, id: \.self) { size in
        Text("Heading")
            .frostedHeading(size: size)
    }
}

#Preview("Size") {
    VStack(spacing: 12) {
        ForEach(FrostedTextSize.allCases, id: \.self) { size in
            Text("The quick brown fox jumps over the lazy dog.")
                .frostedText(size: size)
                .frame(width: 200, alignment: .leading)
                .border(.red)
        }
    }
}

#Preview("Weight") {
    ForEach(FrostedTextWeight.allCases, id: \.self) { weight in
        Text("The quick brown fox jumps over the lazy dog.")
            .frostedText(weight: weight)
    }
}

#Preview("Color") {
    Text("The quick brown fox jumps over the lazy dog.")
        .frostedText(color: .frostedGreen9)

    Text("The quick brown fox jumps over the lazy dog.")
        .frostedText(color: .frostedRed9)

    Text("The quick brown fox jumps over the lazy dog.")
        .frostedText(color: .frostedBlue9)

    Text("The quick brown fox jumps over the lazy dog.")
        .frostedText(semantic: .danger)
}
