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

    /// Extra spacing to reach the desired line height (lineHeight - fontSize).
    var lineSpacing: CGFloat {
        max(0, lineHeight - fontSize)
    }
}

public enum FrostedTextWeight: CaseIterable {
    case light
    case regular
    case medium
    case semibold
    case bold
}

private extension FrostedTextWeight {
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
    private func frostedText(
        size: FrostedTextSize = .two,
        weight: FrostedTextWeight = .regular,
        rawColor: Color,
        trim: Bool = false
    ) -> some View {
        font(.system(size: size.fontSize, weight: weight.fontWeight))
            .tracking(size.letterSpacing)
            .lineSpacing(trim ? 0 : size.lineSpacing)
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

#Preview("Size") {
    ForEach(FrostedTextSize.allCases, id: \.self) { size in
        Text("The quick brown fox jumps over the lazy dog.")
            .frostedText(size: size)
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
