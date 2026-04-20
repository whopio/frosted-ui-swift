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

public struct FrostedCreditCard<Logo: View, Provider: View, Background: View>: View {
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

    private let logo: () -> Logo
    private let provider: () -> Provider
    private let background: () -> Background

    @Binding private var isFlipped: Bool

    public init(
        title: String,
        cardNumber: String,
        expiration: String,
        cvv: String,
        tint: FrostedTint = .gray,
        style: Style = .subtle,
        state: State = .default,
        size: Size = .large,
        tilt: Bool = false,
        flipped: Binding<Bool> = .constant(false),
        @ViewBuilder logo: @escaping () -> Logo,
        @ViewBuilder provider: @escaping () -> Provider,
        @ViewBuilder background: @escaping () -> Background
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
        self._isFlipped = flipped
        self.logo = logo
        self.provider = provider
        self.background = background
    }

    private var isActuallyFlipped: Bool {
        size.allowsFlip && isFlipped
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

    /// Muted text color — matches web CSS `--credit-card-muted`.
    /// On white/subtle cards: `gray-a10`. On colored/solid cards: 70% of contrast.
    private var mutedForeground: Color {
        switch style {
        case .solid: tint.contrastNine.opacity(0.70)
        case .subtle: Color(FrostedColor.frostedGrayA10)
        }
    }

    /// Subtle 1pt outline — matches the first layer of Figma shadow-4
    /// (`#00003D` @ 5% spread 1), which renders as a visible hairline on
    /// the web. A true stroke is cleaner than approximating the spread shadow.
    private var borderColor: Color {
        Color(red: 0, green: 0, blue: 0.24).opacity(0.08)
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

    private var lastFour: String {
        let digits = cardNumber.filter(\.isNumber)
        return String(digits.suffix(4))
    }

    private var flipAngle: Double { isActuallyFlipped ? 180 : 0 }

    public var body: some View {
        ZStack {
            FrostedCreditCardFront(
                title: title,
                lastFour: lastFour,
                state: state,
                size: size,
                primary: primaryForeground,
                muted: mutedForeground,
                logo: logo,
                provider: provider
            )
            .background {
                // Custom background only applies to the front face.
                background()
            }
            .modifier(FlipFaceVisibility(angle: flipAngle, showWhenFacing: true))

            if size.allowsFlip {
                FrostedCreditCardBack(
                    cardNumber: cardNumber,
                    expiration: expiration,
                    cvv: cvv,
                    primary: primaryForeground,
                    label: mutedForeground,
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
                .strokeBorder(borderColor, lineWidth: 1)
        )
        .clipShape(.rect(cornerRadius: size.cornerRadius))
        .gyroscopeTilt3D(
            cornerRadius: size.cornerRadius,
            maxRotation: 10,
            shadowColor: .clear,
            shadowIntensity: 0,
            isActive: tilt && size.allowsTilt
        )
        .modifier(CardFlip3D(angle: flipAngle, perspective: 0.5))
        // Figma shadow-4: a very soft navy haze + a small cast beneath.
        // Kept intentionally subtle to match the web's barely-there shadow.
        .shadow(color: Color(red: 0, green: 0, blue: 0.24).opacity(0.04), radius: 8, x: 0, y: 3)
        .shadow(color: .black.opacity(0.04), radius: 4, x: 0, y: 6)
        .animation(.smooth(duration: 0.6), value: isActuallyFlipped)
        .sensoryFeedback(.selection, trigger: isActuallyFlipped)
        .contentShape(.rect(cornerRadius: size.cornerRadius))
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

public extension FrostedCreditCard where Background == EmptyView {
    init(
        title: String,
        cardNumber: String,
        expiration: String,
        cvv: String,
        tint: FrostedTint = .gray,
        style: Style = .subtle,
        state: State = .default,
        size: Size = .large,
        tilt: Bool = false,
        flipped: Binding<Bool> = .constant(false),
        @ViewBuilder logo: @escaping () -> Logo,
        @ViewBuilder provider: @escaping () -> Provider
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
            flipped: flipped,
            logo: logo,
            provider: provider,
            background: { EmptyView() }
        )
    }
}

public extension FrostedCreditCard where Provider == EmptyView, Background == EmptyView {
    init(
        title: String,
        cardNumber: String,
        expiration: String,
        cvv: String,
        tint: FrostedTint = .gray,
        style: Style = .subtle,
        state: State = .default,
        size: Size = .large,
        tilt: Bool = false,
        flipped: Binding<Bool> = .constant(false),
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
            flipped: flipped,
            logo: logo,
            provider: { EmptyView() },
            background: { EmptyView() }
        )
    }
}

public extension FrostedCreditCard where Logo == EmptyView, Provider == EmptyView, Background == EmptyView {
    init(
        title: String,
        cardNumber: String,
        expiration: String,
        cvv: String,
        tint: FrostedTint = .gray,
        style: Style = .subtle,
        state: State = .default,
        size: Size = .large,
        tilt: Bool = false,
        flipped: Binding<Bool> = .constant(false),
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
            flipped: flipped,
            logo: { EmptyView() },
            provider: { EmptyView() },
            background: { EmptyView() }
        )
    }
}

#Preview("All tints") {
    @Previewable @State var flipped: Bool = false

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
                    flipped: $flipped,
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
                .onTapGesture {
                    flipped.toggle()
                }
            }
        }
        .padding(20)
    }
    .background(Color(FrostedColor.frostedGray2))
}

#Preview("Tilt + flip (live)") {
    @Previewable @State var flipped: Bool = false

    FrostedCreditCard(
        title: "Claude credits",
        cardNumber: "1838 0008 7261 2332",
        expiration: "11/27",
        cvv: "8177",
        tint: .gray,
        style: .subtle,
        tilt: true,
        flipped: $flipped,
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
    .onTapGesture {
        flipped.toggle()
    }
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

#Preview("Whop Card preset") {
    @Previewable @State var flipped: Bool = false

    let states: [(String, FrostedCreditCardState)] = [
        ("Default", .default), ("Locked", .locked), ("Canceled", .canceled),
    ]

    @ViewBuilder func whopCard(size: FrostedCreditCardSize, state: FrostedCreditCardState) -> some View {
        FrostedCreditCard(
            title: "Claude credits",
            cardNumber: "1838 0008 7261 2332",
            expiration: "11/27",
            cvv: "8177",
            tint: .gray,
            style: .subtle,
            state: state,
            size: size,
            flipped: $flipped,
            logo: {
                Image("whopLogoEtch", bundle: .module)
                    .resizable()
                    .scaledToFit()
            },
            provider: {
                Image("visaPlatinumEtch", bundle: .module)
                    .resizable()
                    .scaledToFit()
            }
        )
        .onTapGesture {
            flipped.toggle()
        }
    }

    return ScrollView {
        VStack(spacing: 32) {
            VStack(alignment: .leading, spacing: 12) {
                Text("Large").font(.caption).foregroundStyle(.secondary)
                VStack(spacing: 16) {
                    ForEach(states, id: \.0) { _, state in
                        whopCard(size: .large, state: state)
                    }
                }
            }

            VStack(alignment: .leading, spacing: 12) {
                Text("Medium (64×40)").font(.caption).foregroundStyle(.secondary)
                HStack(spacing: 12) {
                    ForEach(states, id: \.0) { _, state in
                        whopCard(size: .medium, state: state)
                    }
                }
            }

            VStack(alignment: .leading, spacing: 12) {
                Text("Small (40×25)").font(.caption).foregroundStyle(.secondary)
                HStack(spacing: 12) {
                    ForEach(states, id: \.0) { _, state in
                        whopCard(size: .small, state: state)
                    }
                }
            }
        }
        .padding(32)
    }
    .background(Color(FrostedColor.frostedGray2))
}

#Preview("Custom Design (waves)") {
    @Previewable @State var flipped: Bool = false

    let states: [(String, FrostedCreditCardState)] = [
        ("Default", .default), ("Locked", .locked), ("Canceled", .canceled),
    ]

    @ViewBuilder func wavesCard(size: FrostedCreditCardSize, state: FrostedCreditCardState) -> some View {
        FrostedCreditCard(
            title: "Claude credits",
            cardNumber: "1838 0008 7261 2332",
            expiration: "11/27",
            cvv: "8177",
            tint: .gray,
            style: .subtle,
            state: state,
            size: size,
            flipped: $flipped,
            logo: {
                Image(size == .large ? FrostedIcon.whopLogo24 : FrostedIcon.whopLogo12)
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
            },
            provider: {
                Text("VISA")
                    .font(.system(size: size == .large ? 40 : 20, weight: size == .large ? .heavy : .black))
                    .italic()
                    .minimumScaleFactor(0.1)
                    .lineLimit(1)
            },
            background: {
                Image("cardWavesBackground", bundle: .module)
                    .resizable()
                    .scaledToFill()
                    .allowsHitTesting(false)
            }
        )
        .onTapGesture {
            flipped.toggle()
        }
    }

    return ScrollView {
        VStack(spacing: 32) {
            VStack(alignment: .leading, spacing: 12) {
                Text("Large").font(.caption).foregroundStyle(.secondary)
                VStack(spacing: 16) {
                    ForEach(states, id: \.0) { _, state in
                        wavesCard(size: .large, state: state)
                    }
                }
            }

            VStack(alignment: .leading, spacing: 12) {
                Text("Medium (64×40)").font(.caption).foregroundStyle(.secondary)
                HStack(spacing: 12) {
                    ForEach(states, id: \.0) { _, state in
                        wavesCard(size: .medium, state: state)
                    }
                }
            }

            VStack(alignment: .leading, spacing: 12) {
                Text("Small (40×25)").font(.caption).foregroundStyle(.secondary)
                HStack(spacing: 12) {
                    ForEach(states, id: \.0) { _, state in
                        wavesCard(size: .small, state: state)
                    }
                }
            }
        }
        .padding(32)
    }
    .background(Color(FrostedColor.frostedGray2))
}
