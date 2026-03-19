import SwiftUI

public struct AIBallView: View {
    let size: CGFloat
    let animated: Bool

    @State private var phase1 = false
    @State private var phase2 = false
    @State private var phase3 = false

    public init(size: CGFloat, animated: Bool = false) {
        self.size = size
        self.animated = animated
    }

    public var body: some View {
        ZStack {
            purpleCore

            Group {
                glowingShape1

                glowingShape3

                glowingShape4
            }
            .rotationEffect(.degrees(animated ? (phase1 ? 8 : -8) : 0))
            .scaleEffect(animated ? (phase2 ? 1.05 : 0.95) : 1)

            glowingShape2
                .rotationEffect(.degrees(animated ? (phase2 ? -10 : 10) : 0))
                .scaleEffect(animated ? (phase1 ? 0.95 : 1.05) : 1)

            topRightLight
                .offset(
                    x: (animated ? (phase2 ? 3 : 1) : 2) * size / 16,
                    y: (animated ? (phase3 ? -3 : -5) : -4) * size / 16
                )
                .scaleEffect(animated ? (phase1 ? 1.1 : 0.9) : 1)

            centerLight
                .scaleEffect(animated ? (phase3 ? 1.08 : 0.92) : 1)
                .opacity(animated ? (phase2 ? 0.9 : 0.7) : 0.8)
        }
        .onAppear {
            guard animated else { return }
            withAnimation(.easeInOut(duration: 3.0).repeatForever(autoreverses: true)) {
                phase1 = true
            }
            withAnimation(.easeInOut(duration: 3.7).repeatForever(autoreverses: true)) {
                phase2 = true
            }
            withAnimation(.easeInOut(duration: 4.3).repeatForever(autoreverses: true)) {
                phase3 = true
            }
        }
        .clipShape(.circle)
        // inner shadow
        .overlay(
            Circle()
                .stroke(Color(hex: 0xFFAE00).opacity(0.25), lineWidth: size / 16 * 0.57)
                .blur(radius: size / 16 / 2.29)
                .clipShape(.circle)
        )
        // outline stroke
        .overlay(
            Circle()
                .stroke(Color(hex: 0x0C4692).opacity(0.20), lineWidth: size / 8)
                .clipShape(.circle)
        )
        .frame(width: size, height: size)
    }

    private var purpleCore: some View {
        Circle()
            .fill(
                LinearGradient(
                    colors: [
                        Color(hex: 0xFF0080).opacity(0.01),
                        Color(hex: 0xFF6CAC).opacity(0.61),
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .overlay(
                Circle()
                    .stroke(Color(hex: 0x3DACE8).opacity(0.71), lineWidth: size / 8)
                    .blur(radius: size / 8)
                    .clipShape(.circle)
                    .blendMode(.colorBurn)
            )
    }

    private var glowingShape1: some View {
        Blob1()
            .fill(
                LinearGradient(
                    stops: [
                        Gradient.Stop(color: Color(red: 1, green: 0.55, blue: 0.94).opacity(0), location: 0.00),
                        Gradient.Stop(color: Color(red: 0.89, green: 0.46, blue: 0.46), location: 1.00),
                    ],
                    startPoint: UnitPoint(x: 0.35, y: 0.49),
                    endPoint: UnitPoint(x: 0.12, y: 0.92)
                )
            )
            .blur(radius: size * 0.35714 / 16)
            .frame(width: 17.59319 * size / 16, height: 14.85714 * size / 16)
            .offset(x: -1 * size / 16, y: 1 * size / 16)
    }

    private var glowingShape2: some View {
        Blob2()
            .fill(
                LinearGradient(
                    stops: [
                        Gradient.Stop(color: Color(red: 0, green: 0.77, blue: 1), location: 0.00),
                        Gradient.Stop(color: Color(red: 1, green: 0.97, blue: 0.43), location: 1.00),
                    ],
                    startPoint: UnitPoint(x: 0.68, y: 0.26),
                    endPoint: UnitPoint(x: 0.41, y: 1.08)
                )
            )
            .mask(
                LinearGradient(
                    stops: [
                        .init(color: .clear, location: 0.0),
                        .init(color: .white, location: 1.0),
                    ],
                    startPoint: UnitPoint(x: 0.68, y: 0.26),
                    endPoint: UnitPoint(x: 0.41, y: 1.08)
                )
            )
            .blur(radius: 0.78571 * size / 16)
            .rotationEffect(Angle(degrees: -127.16))
            .frame(width: 19.45429 * size / 16, height: 15.30907 * size / 16)
    }

    private var glowingShape3: some View {
        Blob3()
            .fill(
                EllipticalGradient(
                    stops: [
                        Gradient.Stop(color: Color(red: 0.99, green: 0.97, blue: 0.88), location: 0.00),
                        Gradient.Stop(color: Color(red: 0.99, green: 0.97, blue: 0.88).opacity(0), location: 1.00),
                    ],
                    center: UnitPoint(x: 0.47, y: 0.30)
                )
            )
            .frame(width: 17.59319 * size / 16, height: 14.85714 * size / 16)
    }

    private var glowingShape4: some View {
        Blob3()
            .fill(
                EllipticalGradient(
                    stops: [
                        Gradient.Stop(color: Color(red: 0.43, green: 0.93, blue: 0.4), location: 0.00),
                        Gradient.Stop(color: Color(red: 0.43, green: 0.48, blue: 0.84).opacity(0.8), location: 1.00),
                    ],
                    center: UnitPoint(x: 0.75, y: 0.95)
                )
            )
            .mask(
                EllipticalGradient(
                    stops: [
                        .init(color: .white, location: 0.00),
                        .init(color: .clear, location: 1.00),
                    ],
                    center: UnitPoint(x: 0.75, y: 1.05)
                )
            )
            .frame(width: 17.59319 * size / 16, height: 14.85714 * size / 16)
    }

    private var topRightLight: some View {
        Circle()
            .fill(Color(red: 1, green: 0.92, blue: 0.16))
            .frame(width: 10.28571 * size / 16, height: 10.28571 * size / 16)
            .offset(x: 2 * size / 16, y: -4 * size / 16)
            .blur(radius: 3.28571 * size / 16)
            .blendMode(.screen)
    }

    private var centerLight: some View {
        Circle()
            .fill(Color(red: 1, green: 0.96, blue: 0.55))
            .frame(width: 11.42857 * size / 16, height: 11.42857 * size / 16)
            .blur(radius: 3.28571 * size / 16)
            .opacity(0.8)
            .blendMode(.screen)
    }
}

struct Blob1: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.59097 * width, y: 0.11428 * height))
        path.addCurve(to: CGPoint(x: 0.86427 * width, y: 0.51428 * height), control1: CGPoint(x: 0.82079 * width, y: 0.28571 * height), control2: CGPoint(x: 0.86427 * width, y: 0.51428 * height))
        path.addCurve(to: CGPoint(x: 0.2121 * width, y: 0.85714 * height), control1: CGPoint(x: 0.77271 * width, y: 0.86428 * height), control2: CGPoint(x: 0.36117 * width, y: 0.62171 * height))
        path.addCurve(to: CGPoint(x: 0.12354 * width, y: 0.55 * height), control1: CGPoint(x: 0.2121 * width, y: 0.85714 * height), control2: CGPoint(x: 0.03658 * width, y: 0.82142 * height))
        path.addCurve(to: CGPoint(x: 0.59097 * width, y: 0.11428 * height), control1: CGPoint(x: 0.39842 * width, y: 0.66428 * height), control2: CGPoint(x: 0.63445 * width, y: 0.48571 * height))
        path.closeSubpath()
        return path
    }
}

struct Blob2: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.62055 * width, y: -0.01015 * height))
        path.addCurve(to: CGPoint(x: 1.06258 * width, y: 0.43938 * height), control1: CGPoint(x: 0.95092 * width, y: 0.20414 * height), control2: CGPoint(x: 1.06258 * width, y: 0.43938 * height))
        path.addCurve(to: CGPoint(x: 0.19784 * width, y: 0.94667 * height), control1: CGPoint(x: 0.82891 * width, y: 0.80878 * height), control2: CGPoint(x: 0.54436 * width, y: 0.22341 * height))
        path.addCurve(to: CGPoint(x: -0.13156 * width, y: 0.4057 * height), control1: CGPoint(x: 0.19784 * width, y: 0.94667 * height), control2: CGPoint(x: -0.25656 * width, y: 0.74499 * height))
        path.addCurve(to: CGPoint(x: 0.62055 * width, y: -0.01015 * height), control1: CGPoint(x: 0.25599 * width, y: 0.39695 * height), control2: CGPoint(x: 0.48959 * width, y: 0.21849 * height))
        path.closeSubpath()
        return path
    }
}

struct Blob3: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.63394 * width, y: -0.07143 * height))
        path.addCurve(to: CGPoint(x: 1.02682 * width, y: 0.5 * height), control1: CGPoint(x: 0.96431 * width, y: 0.17347 * height), control2: CGPoint(x: 1.02682 * width, y: 0.5 * height))
        path.addCurve(to: CGPoint(x: 0.08932 * width, y: 0.98979 * height), control1: CGPoint(x: 0.8952 * width, y: height), control2: CGPoint(x: 0.30361 * width, y: 0.65347 * height))
        path.addCurve(to: CGPoint(x: -0.03799 * width, y: 0.55102 * height), control1: CGPoint(x: 0.08932 * width, y: 0.98979 * height), control2: CGPoint(x: -0.16299 * width, y: 0.93878 * height))
        path.addCurve(to: CGPoint(x: 0.63394 * width, y: -0.07143 * height), control1: CGPoint(x: 0.35716 * width, y: 0.71429 * height), control2: CGPoint(x: 0.69644 * width, y: 0.45918 * height))
        path.closeSubpath()
        return path
    }
}

#Preview("Static") {
    HStack(spacing: 0) {
        VStack(spacing: 40) {
            AIBallView(size: 100)

            AIBallView(size: 50)

            AIBallView(size: 16)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)

        VStack(spacing: 40) {
            AIBallView(size: 100)

            AIBallView(size: 50)

            AIBallView(size: 16)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}

#Preview("Animated") {
    HStack(spacing: 0) {
        VStack(spacing: 40) {
            AIBallView(size: 100, animated: true)

            AIBallView(size: 50, animated: true)

            AIBallView(size: 16, animated: true)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)

        VStack(spacing: 40) {
            AIBallView(size: 100, animated: true)

            AIBallView(size: 50, animated: true)

            AIBallView(size: 16, animated: true)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}
