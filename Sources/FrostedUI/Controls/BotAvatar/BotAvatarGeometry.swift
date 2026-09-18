import SwiftUI

struct BotAvatarSilhouette: Shape {
    var animatableData: BotAvatarSilhouetteVector

    init(coordinates: [Double]) {
        animatableData = BotAvatarSilhouetteVector(values: coordinates)
    }

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

/// Four cubic segments (13 points) shared by every eye and mouth.
struct BotAvatarFaceVector: VectorArithmetic {
    var values: [Double]
    static let zero = Self(values: Array(repeating: 0, count: 26))

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

struct BotAvatarFeature: Shape, Equatable {
    var animatableData: BotAvatarFaceVector

    private init(_ points: [(Double, Double)]) {
        animatableData = BotAvatarFaceVector(values: points.flatMap { [$0.0, $0.1] })
    }

    static func blob(_ left: (Double, Double), _ bottom: (Double, Double),
                     _ right: (Double, Double), _ top: (Double, Double)) -> Self {
        let (lx, ly) = left, (bx, by) = bottom, (rx, ry) = right, (tx, ty) = top
        let k = 0.5523
        return Self([
            left, (lx, ly + k * (by - ly)), (bx - k * (bx - lx), by), bottom,
            (bx + k * (rx - bx), by), (rx, ry + k * (by - ry)), right,
            (rx, ry - k * (ry - ty)), (tx + k * (rx - tx), ty), top,
            (tx - k * (tx - lx), ty), (lx, ly - k * (ly - ty)), left,
        ])
    }

    static func oval(_ cx: Double, _ cy: Double, _ rx: Double, _ ry: Double) -> Self {
        blob((cx - rx, cy), (cx, cy + ry), (cx + rx, cy), (cx, cy - ry))
    }

    static func tiltedOval(_ cx: Double, _ cy: Double, _ rx: Double, _ ry: Double, _ degrees: Double) -> Self {
        oval(cx, cy, rx, ry).rotated(around: CGPoint(x: cx, y: cy), degrees: degrees)
    }

    static func crescentEye(_ cx: Double, _ cy: Double) -> Self {
        blob((cx - 0.074, cy + 0.027), (cx, cy + 0.019), (cx + 0.074, cy + 0.027), (cx, cy - 0.032))
    }

    func rotated(around center: CGPoint, degrees: Double) -> Self {
        let radians = degrees * .pi / 180
        return mapPoints { x, y in
            (center.x + (x - center.x) * cos(radians) - (y - center.y) * sin(radians),
             center.y + (x - center.x) * sin(radians) + (y - center.y) * cos(radians))
        }
    }

    func fitted(to shape: BotAvatarShape) -> Self {
        let fit = shape.faceFit
        return mapPoints { x, y in
            (0.5 + (x - 0.5) * fit.scale * 1.16 + fit.dx,
             0.45 + (y - 0.45) * fit.scale * 1.16 + fit.dy)
        }
    }

    private func mapPoints(_ transform: (Double, Double) -> (Double, Double)) -> Self {
        let values = animatableData.values
        return Self(stride(from: 0, to: values.count, by: 2).map { transform(values[$0], values[$0 + 1]) })
    }

    var bounds: CGRect { path(in: CGRect(x: 0, y: 0, width: 1, height: 1)).boundingRect }

    func path(in rect: CGRect) -> Path {
        let values = animatableData.values
        func point(_ index: Int) -> CGPoint {
            CGPoint(x: rect.minX + values[index] * rect.width,
                    y: rect.minY + values[index + 1] * rect.height)
        }
        var path = Path()
        path.move(to: point(0))
        for index in stride(from: 2, to: values.count, by: 6) {
            path.addCurve(to: point(index + 4), control1: point(index), control2: point(index + 2))
        }
        path.closeSubpath()
        return path
    }
}
