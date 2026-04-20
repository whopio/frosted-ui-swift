import SwiftUI
import UIKit

/// Applies the flip's 3D Y-axis rotation together with a subtle scale-dip that
/// peaks when the card is edge-on (90° / 270°).
struct CardFlip3D: ViewModifier, Animatable {
    var angle: Double
    let perspective: Double

    // Clamps the rendered rotation so it doesnt have perpendicular keyframes.
    // Those keyframes made it look really buggy.
    private let maxTilt: Double = 80

    var animatableData: Double {
        get { angle }
        set { angle = newValue }
    }

    private var display: Double {
        let p = max(0, min(1, angle / 180))
        return p < 0.5
            ? p * 2 * maxTilt
            : (180 - maxTilt) + (p - 0.5) * 2 * maxTilt
    }

    func body(content: Content) -> some View {
        content
            .rotation3DEffect(
                .degrees(display),
                axis: (x: 0, y: 1, z: 0),
                perspective: perspective
            )
    }
}

/// Resolves face opacity from the interpolated rotation angle so that each face
/// snaps in/out exactly when not visible
struct FlipFaceVisibility: ViewModifier, Animatable {
    var angle: Double
    let showWhenFacing: Bool

    var animatableData: Double {
        get { angle }
        set { angle = newValue }
    }

    func body(content: Content) -> some View {
        let normalized = (angle.truncatingRemainder(dividingBy: 360) + 360)
            .truncatingRemainder(dividingBy: 360)
        let facing = normalized < 90 || normalized > 270
        let visible = facing == showWhenFacing
        return content
            .opacity(visible ? 1 : 0)
            .allowsHitTesting(visible)
    }
}

struct FrostedCreditCardFront<Logo: View, Provider: View>: View {
    let title: String
    let lastFour: String
    let state: FrostedCreditCardState
    let size: FrostedCreditCardSize
    let primary: Color
    let muted: Color
    let logo: () -> Logo
    let provider: () -> Provider

    private var contentOpacity: Double {
        state == .default ? 1 : 0.35
    }

    private var lastFourOpacity: Double {
        state == .default ? 1 : 0.3
    }

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HStack(alignment: .top) {
                    logo()
                        .frame(maxWidth: size.logoSize.width, maxHeight: size.logoSize.height, alignment: .topLeading)
                        .foregroundStyle(primary)
                        .opacity(contentOpacity)

                    Spacer(minLength: 0)

                    if size == .large {
                        provider()
                            .frame(maxWidth: size.providerSize.width, maxHeight: size.providerSize.height, alignment: .topTrailing)
                            .foregroundStyle(primary)
                            .opacity(contentOpacity)
                    }
                }

                Spacer(minLength: 0)

                if size.showsText {
                    HStack(alignment: .firstTextBaseline) {
                        Text(title)
                            .font(.system(size: 16, weight: .medium))
                            .tracking(-0.18)
                            .foregroundStyle(primary)

                        Spacer(minLength: 8)

                        Text("•••• \(lastFour)")
                            .font(.system(size: 14, weight: .regular))
                            .tracking(-0.09)
                            .foregroundStyle(muted)
                            .opacity(lastFourOpacity)
                    }
                } else {
                    HStack {
                        Spacer(minLength: 0)
                        provider()
                            .frame(maxWidth: size.providerSize.width, maxHeight: size.providerSize.height, alignment: .bottomTrailing)
                            .foregroundStyle(primary)
                            .opacity(contentOpacity)
                    }
                }
            }
            .padding(size.padding)

            if state != .default {
                StateBadge(state: state, primary: primary, iconSize: size.stateIconSize, showsLabel: size == .large)
            }
        }
    }
}

private struct StateBadge: View {
    let state: FrostedCreditCardState
    let primary: Color
    let iconSize: CGFloat
    let showsLabel: Bool

    private var iconSet: FrostedIconSet {
        switch state {
        case .locked: .lockFilled
        case .canceled: .ban
        case .default: .lockFilled
        }
    }

    private var iconName: FrostedIcon {
        if iconSize <= 12 { return iconSet.size12 }
        if iconSize <= 16 { return iconSet.size16 }
        return iconSet.size20
    }

    private var label: String {
        switch state {
        case .locked: "Locked"
        case .canceled: "Canceled"
        case .default: ""
        }
    }

    private var color: Color {
        switch state {
        case .locked: primary
        case .canceled: Color(FrostedColor.frostedRed10)
        case .default: primary
        }
    }

    var body: some View {
        HStack(spacing: 4) {
            Image(iconName)
                .renderingMode(.template)
                .foregroundStyle(color)
                .frame(width: iconSize, height: iconSize)

            if showsLabel {
                Text(label)
                    .font(.system(size: 14, weight: .medium))
                    .tracking(-0.09)
                    .foregroundStyle(color)
            }
        }
    }
}

struct FrostedCreditCardBack: View {
    let cardNumber: String
    let expiration: String
    let cvv: String
    let primary: Color
    let label: Color
    let stripe: LinearGradient

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            stripe
                .frame(height: 48)
                .padding(.top, 24)

            Spacer(minLength: 0)

            VStack(alignment: .leading, spacing: 8) {
                CopyableField(
                    label: "Card number",
                    value: cardNumber,
                    primary: primary,
                    labelColor: label
                )

                HStack(alignment: .top, spacing: 32) {
                    CopyableField(
                        label: "Exp",
                        value: expiration,
                        primary: primary,
                        labelColor: label
                    )

                    CopyableField(
                        label: "CVV",
                        value: cvv,
                        primary: primary,
                        labelColor: label
                    )
                }
            }
            .padding(.leading, 8)
            .padding(.bottom, 10)
        }
    }
}

private struct CopyableField: View {
    let label: String
    let value: String
    let primary: Color
    let labelColor: Color

    @SwiftUI.State private var didCopy = false

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(label)
                .font(.system(size: 14, weight: .regular))
                .foregroundStyle(labelColor)
                .padding(.horizontal, 8)

            Button(action: copy) {
                HStack(spacing: 8) {
                    Text(value)
                        .font(.system(size: 16, weight: .medium, design: .monospaced))
                        .foregroundStyle(primary)
                        .lineLimit(1)
                        .fixedSize(horizontal: true, vertical: false)

                    Image(didCopy ? FrostedIcon.checkmark16 : FrostedIcon.copy16)
                        .renderingMode(.template)
                        .foregroundStyle(primary)
                        .id(didCopy)
                        .transition(.scale(0.6).combined(with: .blurReplace))
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                // .frame(height: 32)
                .contentShape(.rect(cornerRadius: 8))
            }
            .buttonStyle(.plain)
        }
    }

    private func copy() {
        UIPasteboard.general.string = value
        HapticManager.shared.fireHaptic(.impact(.light))
        withAnimation(.snappy(duration: 0.25)) { didCopy = true }
        Task {
            try? await Task.sleep(for: .seconds(1.2))
            withAnimation(.smooth(duration: 0.3)) { didCopy = false }
        }
    }
}
