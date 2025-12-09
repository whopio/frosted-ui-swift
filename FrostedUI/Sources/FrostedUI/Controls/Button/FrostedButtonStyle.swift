import SwiftUI

struct FrostedButtonStyleViewModifier: ViewModifier {
    let variant: FrostedButtonStyle.Variant
    let size: FrostedButtonStyle.Size
    let rounded: Bool
    let highContrast: Bool
    let iconOnly: Bool
    let fullWidth: Bool
    let tint: FrostedTint

    let pressed: Bool
    let disabled: Bool
    let loading: Bool

    init(variant: FrostedButtonStyle.Variant, size: FrostedButtonStyle.Size, rounded: Bool, highContrast: Bool, iconOnly: Bool, fullWidth: Bool, tint: FrostedTint, pressed: Bool, disabled: Bool, loading: Bool) {
        self.variant = variant
        self.size = size
        self.rounded = rounded
        self.highContrast = highContrast
        self.iconOnly = iconOnly
        self.fullWidth = fullWidth
        self.tint = tint

        self.pressed = pressed
        self.disabled = disabled
        self.loading = loading
    }

    var backgroundColor: Color {
        if disabled {
            return switch variant {
            case .solid: Color(FrostedColor.frostedGrayA3)
            case .soft: Color(FrostedColor.frostedGrayA3)
            case .ghost: Color.clear
            case .surface: Color(FrostedColor.frostedGrayA2)
            }
        }

        if highContrast {
            return switch (variant, pressed) {
            // solid
            case (.solid, false): tint.twelve
            case (.solid, true): tint.twelve
            // soft
            case (.soft, false): tint.A3
            case (.soft, true): tint.A5
            // ghost
            case (.ghost, false): .clear
            case (.ghost, true): tint.A4
            // surface
            case (.surface, false): Color(FrostedColor.panelSolid)
            case (.surface, true): Color(FrostedColor.frostedGrayA3)
            }
        } else {
            return switch (variant, pressed) {
            // solid
            case (.solid, false): tint.nine
            case (.solid, true): tint.ten
            // soft
            case (.soft, false): tint.A3
            case (.soft, true): tint.A5
            // ghost
            case (.ghost, false): .clear
            case (.ghost, true): tint.A4
            // surface
            case (.surface, false): Color(FrostedColor.panelSolid)
            case (.surface, true): Color(FrostedColor.frostedGrayA3)
            }
        }
    }

    var foregroundColor: Color {
        if disabled {
            return Color(FrostedColor.frostedGrayA8)
        }

        if highContrast {
            return switch variant {
            case .solid: Color(FrostedColor.frostedGray1)
            case .soft: tint.twelve
            case .ghost: tint.twelve
            case .surface: tint.twelve
            }
        } else {
            return switch variant {
            case .solid: tint.contrastNine
            case .soft: tint.A11
            case .ghost: tint.A11
            case .surface: tint.eleven
            }
        }
    }

    var fontSize: CGFloat {
        switch size {
        case .one: 12
        case .two: 14
        case .three: 16
        case .four: 18
        }
    }

    var height: CGFloat {
        switch size {
        case .one: 24
        case .two: 32
        case .three: 40
        case .four: 48
        }
    }

    var iconSize: CGFloat {
        switch size {
        case .one: 12
        case .two: 16
        case .three: 20
        case .four: 24
        }
    }

    var cornerRadius: CGFloat {
        if rounded {
            return 100
        }

        return switch size {
        case .one: 6
        case .two: 8
        case .three: 10
        case .four: 14
        }
    }

    var horizontalPadding: CGFloat {
        switch size {
        case .one: FrostedSpacing.spacing2
        case .two: FrostedSpacing.spacing3
        case .three: FrostedSpacing.spacing4
        case .four: FrostedSpacing.spacing5
        }
    }

    var spacing: CGFloat {
        switch size {
        case .one: FrostedSpacing.spacing1
        case .two: FrostedSpacing.spacing2
        case .three: FrostedSpacing.spacing3
        case .four: FrostedSpacing.spacing3
        }
    }

    var loadingScale: CGFloat {
        switch size {
        case .one: 0.8
        case .two: 0.9
        case .three: 1
        case .four: 1.1
        }
    }

    var hasShadow: Bool {
        variant == .surface
    }

    var hasBorder: Bool {
        variant == .surface
    }

    func body(content: Content) -> some View {
        HStack(spacing: spacing) {
            content
        }
        .frame(maxWidth: fullWidth ? .infinity : nil)
        .frame(height: iconOnly ? iconSize : nil)
        .frame(width: iconOnly ? iconSize : nil)
        .opacity(loading ? 0 : 1) // reserved the size, but show the loading
        .overlay {
            if loading {
                ProgressView()
                    .progressViewStyle(.circular)
                    .tint(foregroundColor)
                    .scaleEffect(loadingScale)
            }
        }
        .font(.system(size: fontSize, weight: .medium))
        .padding(.horizontal, iconOnly ? 0 : horizontalPadding)
        .frame(height: height)
        .frame(width: iconOnly ? height : nil)
        .background(backgroundColor)
        .foregroundStyle(foregroundColor)
        .clipShape(.rect(cornerRadius: cornerRadius))
        .shadow(color: hasShadow ? .black.opacity(0.06) : .clear, radius: 1, x: 0, y: 1)
        // css: brightness(.92) saturate(1.1)
        .brightness(!highContrast && pressed ? 0.08 : 0)
        .saturation(!highContrast && pressed ? 1.1 : 1)
        // css: contrast(.82) saturate(1.2) brightness(1.16)
        .contrast(highContrast && pressed ? 0.82 : 1)
        .brightness(highContrast && pressed ? 0.08 : 0) // it should be 0.18, but it looks too different to web
        .saturation(highContrast && pressed ? 1.2 : 1)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .strokeBorder(Color(FrostedColor.frostedGray5), lineWidth: 1)
                .opacity(hasBorder ? 1 : 0)
        )
        .allowsHitTesting(!loading && !disabled)
    }
}

public struct FrostedButtonStyle: ButtonStyle {
    public enum Variant: CaseIterable {
        case solid
        case soft
        case ghost
        case surface
    }

    public enum Size: CaseIterable {
        case one
        case two
        case three
        case four
    }

    let variant: Variant
    let size: Size
    let rounded: Bool
    let highContrast: Bool
    let iconOnly: Bool
    let fullWidth: Bool
    let tint: FrostedTint

    let loading: Bool

    @Environment(\.isEnabled) private var isEnabled

    public func makeBody(configuration: Configuration) -> some View {
        ButtonAnimationContainer(configuration: configuration, animationDuration: 0.15, fireHaptic: true) {
            configuration.label
                .modifier(FrostedButtonStyleViewModifier(
                    variant: variant,
                    size: size,
                    rounded: rounded,
                    highContrast: highContrast,
                    iconOnly: iconOnly,
                    fullWidth: fullWidth,
                    tint: tint,

                    pressed: configuration.isPressed,
                    disabled: !isEnabled,
                    loading: loading
                ))
        }
    }
}

public struct SemanticFrostedButtonStyle: ButtonStyle {
    let variant: FrostedButtonStyle.Variant
    let size: FrostedButtonStyle.Size
    let rounded: Bool
    let highContrast: Bool
    let iconOnly: Bool
    let fullWidth: Bool
    let semantic: FrostedSemantic

    let loading: Bool

    @Environment(\.frostedTheme) private var theme
    @Environment(\.isEnabled) private var isEnabled

    public func makeBody(configuration: Configuration) -> some View {
        ButtonAnimationContainer(configuration: configuration, animationDuration: 0.15, fireHaptic: true) {
            configuration.label
                .modifier(FrostedButtonStyleViewModifier(
                    variant: variant,
                    size: size,
                    rounded: rounded,
                    highContrast: highContrast,
                    iconOnly: iconOnly,
                    fullWidth: fullWidth,
                    tint: theme.tint(for: semantic),
                    pressed: configuration.isPressed,
                    disabled: !isEnabled,
                    loading: loading
                ))
        }
    }
}

public extension ButtonStyle where Self == FrostedButtonStyle {
    static func frosted(
        variant: FrostedButtonStyle.Variant = .solid,
        size: FrostedButtonStyle.Size,
        rounded: Bool = false,
        highContrast: Bool = false,
        fullWidth: Bool = false,
        color: FrostedTint,
        loading: Bool = false
    ) -> Self {
        FrostedButtonStyle(
            variant: variant,
            size: size,
            rounded: rounded,
            highContrast: highContrast,
            iconOnly: false,
            fullWidth: fullWidth,
            tint: color,
            loading: loading
        )
    }

    static func frostedIcon(
        variant: FrostedButtonStyle.Variant = .solid,
        size: FrostedButtonStyle.Size,
        rounded: Bool = false,
        highContrast: Bool = false,
        color: FrostedTint,
        loading: Bool = false
    ) -> Self {
        FrostedButtonStyle(
            variant: variant,
            size: size,
            rounded: rounded,
            highContrast: highContrast,
            iconOnly: true,
            fullWidth: false,
            tint: color,
            loading: loading
        )
    }
}

public extension ButtonStyle where Self == SemanticFrostedButtonStyle {
    static func frosted(
        variant: FrostedButtonStyle.Variant = .solid,
        size: FrostedButtonStyle.Size,
        rounded: Bool = false,
        highContrast: Bool = false,
        fullWidth: Bool = false,
        semanticColor: FrostedSemantic = .accent,
        loading: Bool = false
    ) -> Self {
        SemanticFrostedButtonStyle(
            variant: variant,
            size: size,
            rounded: rounded,
            highContrast: highContrast,
            iconOnly: false,
            fullWidth: fullWidth,
            semantic: semanticColor,
            loading: loading
        )
    }

    static func frostedIcon(
        variant: FrostedButtonStyle.Variant = .solid,
        size: FrostedButtonStyle.Size,
        rounded: Bool = false,
        highContrast: Bool = false,
        semanticColor: FrostedSemantic = .accent,
        loading: Bool = false
    ) -> Self {
        SemanticFrostedButtonStyle(
            variant: variant,
            size: size,
            rounded: rounded,
            highContrast: highContrast,
            iconOnly: true,
            fullWidth: false,
            semantic: semanticColor,
            loading: loading
        )
    }
}

#Preview("Semantic") {
    @Previewable @State var semantic: FrostedSemantic = .accent

    ScrollView([.vertical, .horizontal], showsIndicators: false) {
        ForEach(FrostedButtonStyle.Variant.allCases, id: \.self) { variant in
            // Normal
            HStack(spacing: 8) {
                ForEach(FrostedButtonStyle.Size.allCases, id: \.self) { size in
                    Button("Hello, World") {}
                        .buttonStyle(.frosted(variant: variant, size: size, semanticColor: semantic))
                }
            }
            .padding(.horizontal)

            // High contrast
            HStack(spacing: 8) {
                ForEach(FrostedButtonStyle.Size.allCases, id: \.self) { size in
                    Button("Hello, World") {}
                        .buttonStyle(.frosted(variant: variant, size: size, highContrast: true, semanticColor: semantic))
                }
            }
            .padding(.horizontal)

            // Normal Disabled
            HStack(spacing: 8) {
                ForEach(FrostedButtonStyle.Size.allCases, id: \.self) { size in
                    Button("Hello, World") {}
                        .buttonStyle(.frosted(variant: variant, size: size, semanticColor: semantic))
                }
            }
            .padding(.horizontal)
            .disabled(true)

            // Rounded
            HStack(spacing: 8) {
                ForEach(FrostedButtonStyle.Size.allCases, id: \.self) { size in
                    Button("Hello, World") {}
                        .buttonStyle(.frosted(variant: variant, size: size, rounded: true, semanticColor: semantic))
                }
            }
            .padding(.horizontal)

            // Rounded high contrast
            HStack(spacing: 8) {
                ForEach(FrostedButtonStyle.Size.allCases, id: \.self) { size in
                    Button("Hello, World") {}
                        .buttonStyle(.frosted(variant: variant, size: size, rounded: true, highContrast: true, semanticColor: semantic))
                }
            }
            .padding(.horizontal)

            // Rounded Disabled
            HStack(spacing: 8) {
                ForEach(FrostedButtonStyle.Size.allCases, id: \.self) { size in
                    Button("Hello, World") {}
                        .buttonStyle(.frosted(variant: variant, size: size, rounded: true, semanticColor: semantic))
                }
            }
            .padding(.horizontal)
            .disabled(true)
        }
    }
}

#Preview("Tint") {
    @Previewable @State var color: FrostedTint = .jade

    ScrollView([.vertical, .horizontal], showsIndicators: false) {
        ForEach(FrostedButtonStyle.Variant.allCases, id: \.self) { variant in
            // Normal
            HStack(spacing: 8) {
                ForEach(FrostedButtonStyle.Size.allCases, id: \.self) { size in
                    Button("Hello, World") {}
                        .buttonStyle(.frosted(variant: variant, size: size, color: color))
                }
            }
            .padding(.horizontal)

            // Normal high contrast
            HStack(spacing: 8) {
                ForEach(FrostedButtonStyle.Size.allCases, id: \.self) { size in
                    Button("Hello, World") {}
                        .buttonStyle(.frosted(variant: variant, size: size, highContrast: true, color: color))
                }
            }
            .padding(.horizontal)

            // Normal Disabled
            HStack(spacing: 8) {
                ForEach(FrostedButtonStyle.Size.allCases, id: \.self) { size in
                    Button("Hello, World") {}
                        .buttonStyle(.frosted(variant: variant, size: size, color: color))
                }
            }
            .padding(.horizontal)
            .disabled(true)

            // Rounded
            HStack(spacing: 8) {
                ForEach(FrostedButtonStyle.Size.allCases, id: \.self) { size in
                    Button("Hello, World") {}
                        .buttonStyle(.frosted(variant: variant, size: size, rounded: true, color: color))
                }
            }
            .padding(.horizontal)

            // Rounded high contrast
            HStack(spacing: 8) {
                ForEach(FrostedButtonStyle.Size.allCases, id: \.self) { size in
                    Button("Hello, World") {}
                        .buttonStyle(.frosted(variant: variant, size: size, rounded: true, highContrast: true, color: color))
                }
            }
            .padding(.horizontal)

            // Rounded Disabled
            HStack(spacing: 8) {
                ForEach(FrostedButtonStyle.Size.allCases, id: \.self) { size in
                    Button("Hello, World") {}
                        .buttonStyle(.frosted(variant: variant, size: size, rounded: true, color: color))
                }
            }
            .padding(.horizontal)
            .disabled(true)
        }
    }
}

#Preview("Loading") {
    ForEach(FrostedButtonStyle.Size.allCases, id: \.self) { size in
        HStack {
            Button("Hello, World") {}
                .buttonStyle(.frosted(variant: .solid, size: size, color: .pink, loading: false))

            Button("Hello, World") {}
                .buttonStyle(.frosted(variant: .solid, size: size, color: .pink, loading: true))
        }
    }
}

#Preview("Icon only") {
    Button(action: {}) {
        Image(FrostedIcon.sparkles20)
    }
    .buttonStyle(.frostedIcon(variant: .solid, size: .three, color: .pink))
}

#Preview("Icon with text") {
    Button(action: {}) {
        Image(FrostedIcon.sparkles20)
        Text("Test")
    }
    .buttonStyle(.frosted(variant: .solid, size: .one, color: .pink))
}
