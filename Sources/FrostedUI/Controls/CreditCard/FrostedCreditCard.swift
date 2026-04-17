import SwiftUI
import UIKit

public enum FrostedCreditCardStyle {
    /// Vivid filled card. Uses `tint.nine` as background and
    /// `tint.contrastNine` for text.
    case solid
    /// Pale / near-white card. Uses `tint.one` as background with
    /// `tint.twelve` text — pair with `.gray` to match the default
    /// white Figma spec.
    case subtle
}

public enum FrostedCreditCardState {
    case `default`
    case locked
    case canceled
}

public struct FrostedCreditCard<Logo: View, Provider: View>: View {
    public typealias Style = FrostedCreditCardStyle
    public typealias State = FrostedCreditCardState

    private let title: String
    private let cardNumber: String
    private let expiration: String
    private let cvv: String
    private let tint: FrostedTint
    private let style: Style
    private let state: State
    private let tilt: Bool
    private let allowsFlipping: Bool
    private let logo: () -> Logo
    private let provider: () -> Provider

    @SwiftUI.State private var isFlipped = false

    public init(
        title: String,
        cardNumber: String,
        expiration: String,
        cvv: String,
        tint: FrostedTint = .gray,
        style: Style = .subtle,
        state: State = .default,
        tilt: Bool = true,
        allowsFlipping: Bool = true,
        @ViewBuilder logo: @escaping () -> Logo,
        @ViewBuilder provider: @escaping () -> Provider
    ) {
        self.title = title
        self.cardNumber = cardNumber
        self.expiration = expiration
        self.cvv = cvv
        self.tint = tint
        self.style = style
        self.state = state
        self.tilt = tilt
        self.allowsFlipping = allowsFlipping
        self.logo = logo
        self.provider = provider
    }

    private var backgroundColor: Color {
        switch style {
        case .solid: tint.nine
        case .subtle: tint.one
        }
    }

    private var primaryForeground: Color {
        switch style {
        case .solid: tint.contrastNine
        case .subtle: tint.twelve
        }
    }

    private var secondaryForeground: Color {
        switch style {
        case .solid: tint.contrastNine.opacity(0.61)
        case .subtle: tint.twelve.opacity(0.61)
        }
    }

    private var labelForeground: Color {
        switch style {
        case .solid: tint.contrastNine.opacity(0.5)
        case .subtle: tint.twelve.opacity(0.5)
        }
    }

    private var stripeGradient: LinearGradient {
        switch style {
        case .solid:
            LinearGradient(
                colors: [tint.eight, tint.seven],
                startPoint: .leading,
                endPoint: .trailing
            )
        case .subtle:
            LinearGradient(
                colors: [tint.three, tint.four],
                startPoint: .leading,
                endPoint: .trailing
            )
        }
    }

    private var borderColor: Color {
        primaryForeground.opacity(0.19)
    }

    private let cornerRadius: CGFloat = 12

    private var lastFour: String {
        let digits = cardNumber.filter(\.isNumber)
        return String(digits.suffix(4))
    }

    public var body: some View {
        ZStack {
            FrostedCreditCardFront(
                title: title,
                lastFour: lastFour,
                state: state,
                primary: primaryForeground,
                secondary: secondaryForeground,
                logo: logo,
                provider: provider
            )
            .opacity(isFlipped ? 0 : 1)
            .allowsHitTesting(!isFlipped)
            .animation(.linear(duration: 0.01).delay(0.3), value: isFlipped)

            FrostedCreditCardBack(
                cardNumber: cardNumber,
                expiration: expiration,
                cvv: cvv,
                primary: primaryForeground,
                label: labelForeground,
                stripe: stripeGradient
            )
            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            .opacity(isFlipped ? 1 : 0)
            .allowsHitTesting(isFlipped)
            .animation(.linear(duration: 0.01).delay(0.3), value: isFlipped)
        }
        .aspectRatio(361.0 / 227.0, contentMode: .fit)
        .background(backgroundColor)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .strokeBorder(borderColor, lineWidth: 1)
        )
        .clipShape(.rect(cornerRadius: cornerRadius))
        .rotation3DEffect(
            .degrees(isFlipped ? 180 : 0),
            axis: (x: 0, y: 1, z: 0),
            perspective: 0.5
        )
        .animation(.spring(duration: 0.6, bounce: 0.12), value: isFlipped)
        .contentShape(.rect(cornerRadius: cornerRadius))
        .onTapGesture {
            guard allowsFlipping, state == .default else { return }
            HapticManager.shared.fireHaptic(.impact(.soft))
            isFlipped.toggle()
        }
        .gyroscopeTilt3D(
            cornerRadius: cornerRadius,
            maxRotation: 10,
            shadowColor: style == .solid ? backgroundColor : Color(red: 0, green: 0, blue: 0.24),
            shadowIntensity: 0.5,
            isActive: tilt
        )
    }
}

public extension FrostedCreditCard where Provider == EmptyView {
    init(
        title: String,
        cardNumber: String,
        expiration: String,
        cvv: String,
        tint: FrostedTint = .gray,
        style: Style = .subtle,
        state: State = .default,
        tilt: Bool = true,
        allowsFlipping: Bool = true,
        @ViewBuilder logo: @escaping () -> Logo
    ) {
        self.init(
            title: title,
            cardNumber: cardNumber,
            expiration: expiration,
            cvv: cvv,
            tint: tint,
            style: style,
            state: state,
            tilt: tilt,
            allowsFlipping: allowsFlipping,
            logo: logo,
            provider: { EmptyView() }
        )
    }
}

public extension FrostedCreditCard where Logo == EmptyView, Provider == EmptyView {
    init(
        title: String,
        cardNumber: String,
        expiration: String,
        cvv: String,
        tint: FrostedTint = .gray,
        style: Style = .subtle,
        state: State = .default,
        tilt: Bool = true,
        allowsFlipping: Bool = true
    ) {
        self.init(
            title: title,
            cardNumber: cardNumber,
            expiration: expiration,
            cvv: cvv,
            tint: tint,
            style: style,
            state: state,
            tilt: tilt,
            allowsFlipping: allowsFlipping,
            logo: { EmptyView() },
            provider: { EmptyView() }
        )
    }
}

#Preview("Default (Figma spec)") {
    ScrollView {
        VStack(spacing: 24) {
            FrostedCreditCard(
                title: "Claude credits",
                cardNumber: "1838 0008 7261 2332",
                expiration: "11/27",
                cvv: "8177",
                tint: .gray,
                style: .subtle,
                state: .default,
                tilt: false,
                logo: {
                    Image(FrostedIcon.whopLogo24)
                        .renderingMode(.template)
                },
                provider: {
                    Text("VISA")
                        .font(.system(size: 18, weight: .heavy))
                        .italic()
                }
            )

            FrostedCreditCard(
                title: "Claude credits",
                cardNumber: "1838 0008 7261 2332",
                expiration: "11/27",
                cvv: "8177",
                tint: .gray,
                style: .subtle,
                state: .locked,
                tilt: false,
                logo: {
                    Image(FrostedIcon.whopLogo24)
                        .renderingMode(.template)
                },
                provider: {
                    Text("VISA")
                        .font(.system(size: 18, weight: .heavy))
                        .italic()
                }
            )

            FrostedCreditCard(
                title: "Claude credits",
                cardNumber: "1838 0008 7261 2332",
                expiration: "11/27",
                cvv: "8177",
                tint: .gray,
                style: .subtle,
                state: .canceled,
                tilt: false,
                logo: {
                    Image(FrostedIcon.whopLogo24)
                        .renderingMode(.template)
                },
                provider: {
                    Text("VISA")
                        .font(.system(size: 18, weight: .heavy))
                        .italic()
                }
            )
        }
        .padding(24)
    }
    .background(Color(FrostedColor.frostedGray2))
}

#Preview("Tinted solid") {
    ScrollView {
        VStack(spacing: 24) {
            FrostedCreditCard(
                title: "Claude credits",
                cardNumber: "1838 0008 7261 2332",
                expiration: "11/27",
                cvv: "8177",
                tint: .lime,
                style: .solid,
                tilt: false,
                logo: {
                    Image(FrostedIcon.whopLogo24)
                        .renderingMode(.template)
                },
                provider: {
                    Text("VISA")
                        .font(.system(size: 18, weight: .heavy))
                        .italic()
                }
            )

            FrostedCreditCard(
                title: "Claude credits",
                cardNumber: "1838 0008 7261 2332",
                expiration: "11/27",
                cvv: "8177",
                tint: .blue,
                style: .solid,
                tilt: false,
                logo: {
                    Image(FrostedIcon.whopLogo24)
                        .renderingMode(.template)
                },
                provider: {
                    Text("VISA")
                        .font(.system(size: 18, weight: .heavy))
                        .italic()
                }
            )
        }
        .padding(24)
    }
    .background(Color(FrostedColor.frostedGray2))
}

#Preview("Tilt + flip (live)") {
    FrostedCreditCard(
        title: "Claude credits",
        cardNumber: "1838 0008 7261 2332",
        expiration: "11/27",
        cvv: "8177",
        tint: .gray,
        style: .subtle,
        logo: {
            Image(FrostedIcon.whopLogo24)
                .renderingMode(.template)
        },
        provider: {
            Text("VISA")
                .font(.system(size: 18, weight: .heavy))
                .italic()
        }
    )
    .padding(32)
}

#Preview("All tints") {
    let tints: [(String, FrostedTint)] = [
        ("amber", .amber), ("blue", .blue), ("bronze", .bronze),
        ("brown", .brown), ("crimson", .crimson), ("cyan", .cyan),
        ("gold", .gold), ("grass", .grass), ("gray", .gray),
        ("green", .green), ("indigo", .indigo), ("iris", .iris),
        ("jade", .jade), ("lemon", .lemon), ("lime", .lime),
        ("magenta", .magenta), ("mint", .mint), ("orange", .orange),
        ("pink", .pink), ("plum", .plum), ("purple", .purple),
        ("red", .red), ("ruby", .ruby), ("sky", .sky),
        ("teal", .teal), ("tomato", .tomato), ("violet", .violet),
        ("yellow", .yellow),
    ]

    ScrollView {
        LazyVStack(spacing: 20) {
            ForEach(tints, id: \.0) { name, tint in
                FrostedCreditCard(
                    title: name.capitalized + " credits",
                    cardNumber: "1838 0008 7261 2332",
                    expiration: "11/27",
                    cvv: "8177",
                    tint: tint,
                    style: .solid,
                    tilt: false,
                    logo: {
                        Image(FrostedIcon.whopLogo24)
                            .renderingMode(.template)
                    },
                    provider: {
                        Text("VISA")
                            .font(.system(size: 18, weight: .heavy))
                            .italic()
                    }
                )
            }
        }
        .padding(20)
    }
    .background(Color(FrostedColor.frostedGray2))
}
