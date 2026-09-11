import SwiftUI

/// A fixed-size vector keeps all 80 cubic segments aligned while morphing.
struct BotAvatarVector: VectorArithmetic {
    var values: [Double]
    static var zero: Self { Self(values: Array(repeating: 0, count: 482)) }

    static func + (lhs: Self, rhs: Self) -> Self {
        Self(values: zip(lhs.values, rhs.values).map(+))
    }

    static func - (lhs: Self, rhs: Self) -> Self {
        Self(values: zip(lhs.values, rhs.values).map(-))
    }

    mutating func scale(by rhs: Double) {
        values = values.map { $0 * rhs }
    }

    var magnitudeSquared: Double { values.reduce(0) { $0 + $1 * $1 } }
}

struct BotAvatarSilhouette: Shape {
    var animatableData: BotAvatarVector

    func path(in rect: CGRect) -> Path {
        let values = animatableData.values
        func point(_ index: Int) -> CGPoint {
            CGPoint(x: rect.minX + values[index] * rect.width,
                    y: rect.minY + values[index + 1] * rect.height)
        }
        var path = Path()
        path.move(to: point(0))
        // Each segment stores its endpoint, then its two control points.
        for index in stride(from: 2, to: values.count, by: 6) {
            path.addCurve(to: point(index), control1: point(index + 2), control2: point(index + 4))
        }
        path.closeSubpath()
        return path
    }
}

/// Interpolates elliptical corner radii from frown to smile.
struct BotAvatarMouth: Shape {
    var curvature: CGFloat
    var animatableData: CGFloat {
        get { curvature }
        set { curvature = newValue }
    }

    func path(in rect: CGRect) -> Path {
        let curve = min(1, max(-1, curvature))
        let topX = rect.width * (0.5 - 0.38 * max(0, curve))
        let bottomX = rect.width * (0.5 - 0.38 * max(0, -curve))
        let topY = rect.height * (0.5 - 0.3 * curve)
        let bottomY = rect.height * (0.5 + 0.3 * curve)
        let k: CGFloat = 0.5522847498
        let w = rect.width, h = rect.height
        var p = Path()
        p.move(to: CGPoint(x: topX, y: 0))
        p.addLine(to: CGPoint(x: w - topX, y: 0))
        p.addCurve(to: CGPoint(x: w, y: topY),
                   control1: CGPoint(x: w - topX + k * topX, y: 0),
                   control2: CGPoint(x: w, y: topY - k * topY))
        p.addLine(to: CGPoint(x: w, y: h - bottomY))
        p.addCurve(to: CGPoint(x: w - bottomX, y: h),
                   control1: CGPoint(x: w, y: h - bottomY + k * bottomY),
                   control2: CGPoint(x: w - bottomX + k * bottomX, y: h))
        p.addLine(to: CGPoint(x: bottomX, y: h))
        p.addCurve(to: CGPoint(x: 0, y: h - bottomY),
                   control1: CGPoint(x: bottomX - k * bottomX, y: h),
                   control2: CGPoint(x: 0, y: h - bottomY + k * bottomY))
        p.addLine(to: CGPoint(x: 0, y: topY))
        p.addCurve(to: CGPoint(x: topX, y: 0),
                   control1: CGPoint(x: 0, y: topY - k * topY),
                   control2: CGPoint(x: topX - k * topX, y: 0))
        p.closeSubpath()
        return p.offsetBy(dx: rect.minX, dy: rect.minY)
    }
}
