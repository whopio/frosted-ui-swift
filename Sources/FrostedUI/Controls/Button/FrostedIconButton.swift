import SwiftUI

public struct FrostedIconButton: View {
    let variant: FrostedButtonStyle.Variant
    let size: FrostedButtonStyle.Size
    let rounded: Bool
    let highContrast: Bool
    let fullWidth: Bool
    let color: FrostedTint
    let icon: FrostedIconSet
    let loading: Bool

    let action: () -> Void

    public init(
        variant: FrostedButtonStyle.Variant = .solid,
        size: FrostedButtonStyle.Size,
        rounded: Bool = true,
        highContrast: Bool = false,
        fullWidth: Bool = false,
        color: FrostedTint,
        icon: FrostedIconSet,
        loading: Bool = false,
        action: @escaping () -> Void
    ) {
        self.variant = variant
        self.size = size
        self.rounded = rounded
        self.highContrast = highContrast
        self.fullWidth = fullWidth
        self.color = color
        self.icon = icon
        self.loading = loading
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            EmptyView()
        }
        .buttonStyle(
            FrostedButtonStyle(
                variant: variant,
                size: size,
                rounded: rounded,
                highContrast: highContrast,
                iconOnly: true,
                fullWidth: fullWidth,
                tint: color,
                leading: icon,
                trailing: nil,
                loading: loading
            )
        )
    }
}

#Preview("Icon only") {
    ForEach(FrostedButtonStyle.Size.allCases, id: \.self) { size in
        FrostedIconButton(variant: .solid, size: size, color: .pink, icon: .sparkles) {}
        FrostedIconButton(variant: .solid, size: size, color: .pink, icon: .sparkles, loading: true) {}
    }
}
