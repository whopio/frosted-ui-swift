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

public enum FrostedCreditCardSize {
    /// Full 361×227 card with title, last-four, back face, and flip. Adapts to the parent width.
    case large
    /// 64×40 chip. Logo + provider only. State icon centers for locked/canceled.
    case medium
    /// 40×25 chip. Same contents as medium at a smaller scale.
    case small

    var fixedSize: CGSize? {
        switch self {
        case .large: nil
        case .medium: CGSize(width: 64, height: 40)
        case .small: CGSize(width: 40, height: 25)
        }
    }

    var aspectRatio: CGFloat {
        switch self {
        case .large: 361.0 / 227.0
        case .medium: 64.0 / 40.0
        case .small: 40.0 / 25.0
        }
    }

    var cornerRadius: CGFloat {
        switch self {
        case .large: 12
        case .medium: 4
        case .small: 3
        }
    }

    var borderWidth: CGFloat {
        switch self {
        case .large: 1
        case .medium, .small: 0.5
        }
    }

    var padding: CGFloat {
        switch self {
        case .large: 16
        case .medium: 4
        case .small: 3
        }
    }

    var logoSize: CGSize {
        switch self {
        case .large: CGSize(width: 56, height: 30)
        case .medium: CGSize(width: 13.66, height: 7)
        case .small: CGSize(width: 8.781, height: 4.5)
        }
    }

    var providerSize: CGSize {
        switch self {
        case .large: CGSize(width: 84, height: 42)
        case .medium: CGSize(width: 19.2, height: 6.184)
        case .small: CGSize(width: 12, height: 3.865)
        }
    }

    var stateIconSize: CGFloat {
        switch self {
        case .large: 16
        case .medium: 16
        case .small: 12
        }
    }

    var showsText: Bool { self == .large }

    var allowsFlip: Bool { self == .large }

    var allowsTilt: Bool { self == .large }
}

public struct FrostedCreditCard<Logo: View, Provider: View>: View {
    public typealias Style = FrostedCreditCardStyle
    public typealias State = FrostedCreditCardState
    public typealias Size = FrostedCreditCardSize

    private let title: String
    private let cardNumber: String
    private let expiration: String
    private let cvv: String
    private let tint: FrostedTint
    private let style: Style
    private let state: State
    private let size: Size
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
        size: Size = .large,
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
        self.size = size
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

    private var lastFour: String {
        let digits = cardNumber.filter(\.isNumber)
        return String(digits.suffix(4))
    }

    private var flipAngle: Double { isFlipped ? 180 : 0 }

    private var canFlip: Bool {
        allowsFlipping && size.allowsFlip && state == .default
    }

    public var body: some View {
        ZStack {
            FrostedCreditCardFront(
                title: title,
                lastFour: lastFour,
                state: state,
                size: size,
                primary: primaryForeground,
                secondary: secondaryForeground,
                logo: logo,
                provider: provider
            )
            .modifier(FlipFaceVisibility(angle: flipAngle, showWhenFacing: true))

            if size.allowsFlip {
                FrostedCreditCardBack(
                    cardNumber: cardNumber,
                    expiration: expiration,
                    cvv: cvv,
                    primary: primaryForeground,
                    label: labelForeground,
                    stripe: stripeGradient
                )
                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                .modifier(FlipFaceVisibility(angle: flipAngle, showWhenFacing: false))
            }
        }
        .applyCardSize(size)
        .background(backgroundColor)
        .overlay(
            RoundedRectangle(cornerRadius: size.cornerRadius)
                .strokeBorder(borderColor, lineWidth: size.borderWidth)
        )
        .clipShape(.rect(cornerRadius: size.cornerRadius))
        .gyroscopeTilt3D(
            cornerRadius: size.cornerRadius,
            maxRotation: 10,
            shadowColor: style == .solid ? backgroundColor : Color(red: 0, green: 0, blue: 0.24),
            shadowIntensity: size == .large ? 0.5 : 0,
            isActive: tilt && size.allowsTilt
        )
        .rotation3DEffect(
            .degrees(flipAngle),
            axis: (x: 0, y: 1, z: 0),
            perspective: 0.5
        )
        .animation(.spring(duration: 0.6, bounce: 0.12), value: isFlipped)
        .contentShape(.rect(cornerRadius: size.cornerRadius))
        .onTapGesture {
            guard canFlip else { return }
            HapticManager.shared.fireHaptic(.impact(.soft))
            isFlipped.toggle()
        }
    }
}

private extension View {
    @ViewBuilder
    func applyCardSize(_ size: FrostedCreditCardSize) -> some View {
        if let fixed = size.fixedSize {
            frame(width: fixed.width, height: fixed.height)
        } else {
            aspectRatio(size.aspectRatio, contentMode: .fit)
        }
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
        size: Size = .large,
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
            size: size,
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
        size: Size = .large,
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
            size: size,
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
                        .resizable()
                        .scaledToFit()
                },
                provider: {
                    Text("VISA")
                        .font(.system(size: 40, weight: .heavy))
                        .italic()
                        .minimumScaleFactor(0.1)
                        .lineLimit(1)
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
                        .resizable()
                        .scaledToFit()
                },
                provider: {
                    Text("VISA")
                        .font(.system(size: 40, weight: .heavy))
                        .italic()
                        .minimumScaleFactor(0.1)
                        .lineLimit(1)
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
                        .resizable()
                        .scaledToFit()
                },
                provider: {
                    Text("VISA")
                        .font(.system(size: 40, weight: .heavy))
                        .italic()
                        .minimumScaleFactor(0.1)
                        .lineLimit(1)
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
                        .resizable()
                        .scaledToFit()
                },
                provider: {
                    Text("VISA")
                        .font(.system(size: 40, weight: .heavy))
                        .italic()
                        .minimumScaleFactor(0.1)
                        .lineLimit(1)
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
                        .resizable()
                        .scaledToFit()
                },
                provider: {
                    Text("VISA")
                        .font(.system(size: 40, weight: .heavy))
                        .italic()
                        .minimumScaleFactor(0.1)
                        .lineLimit(1)
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
                .resizable()
                .scaledToFit()
        },
        provider: {
            Text("VISA")
                .font(.system(size: 40, weight: .heavy))
                .italic()
                .minimumScaleFactor(0.1)
                .lineLimit(1)
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
                            .resizable()
                            .scaledToFit()
                    },
                    provider: {
                        Text("VISA")
                            .font(.system(size: 40, weight: .heavy))
                            .italic()
                            .minimumScaleFactor(0.1)
                            .lineLimit(1)
                    }
                )
            }
        }
        .padding(20)
    }
    .background(Color(FrostedColor.frostedGray2))
}

#Preview("Sizes (Figma)") {
    let states: [FrostedCreditCardState] = [.default, .locked, .canceled]
    let logo: some View = Image(FrostedIcon.whopLogo12)
        .renderingMode(.template)
        .resizable()
        .aspectRatio(contentMode: .fill)
    let provider: some View = Text("VISA")
        .font(.system(size: 20, weight: .black))
        .italic()
        .minimumScaleFactor(0.1)
        .lineLimit(1)

    return VStack(spacing: 40) {
        VStack(alignment: .leading, spacing: 12) {
            Text("Medium (64×40)").font(.caption).foregroundStyle(.secondary)
            HStack(spacing: 12) {
                ForEach(Array(states.enumerated()), id: \.offset) { _, state in
                    FrostedCreditCard(
                        title: "Claude credits",
                        cardNumber: "1838 0008 7261 2332",
                        expiration: "11/27",
                        cvv: "8177",
                        state: state,
                        size: .medium,
                        logo: { logo },
                        provider: { provider }
                    )
                }
            }
        }

        VStack(alignment: .leading, spacing: 12) {
            Text("Small (40×25)").font(.caption).foregroundStyle(.secondary)
            HStack(spacing: 12) {
                ForEach(Array(states.enumerated()), id: \.offset) { _, state in
                    FrostedCreditCard(
                        title: "Claude credits",
                        cardNumber: "1838 0008 7261 2332",
                        expiration: "11/27",
                        cvv: "8177",
                        state: state,
                        size: .small,
                        logo: { logo },
                        provider: { provider }
                    )
                }
            }
        }
    }
    .padding(32)
    .background(Color(FrostedColor.frostedGray2))
}
