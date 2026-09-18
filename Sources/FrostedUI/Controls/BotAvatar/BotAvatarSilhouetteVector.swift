import SwiftUI

/// A shared topology lets SwiftUI interpolate every point, including when a
/// running spring is retargeted. Subdivision preserves the original curves.
struct BotAvatarSilhouetteVector: VectorArithmetic {
    static let segmentCount = 256
    var values: [Double]
    static let zero = Self(values: Array(repeating: 0, count: 2 + segmentCount * 6))

    static func + (lhs: Self, rhs: Self) -> Self {
        Self(values: zip(lhs.values, rhs.values).map(+))
    }

    static func - (lhs: Self, rhs: Self) -> Self {
        Self(values: zip(lhs.values, rhs.values).map(-))
    }

    mutating func scale(by rhs: Double) { values = values.map { $0 * rhs } }
    var magnitudeSquared: Double { values.reduce(0) { $0 + $1 * $1 } }
}

extension BotAvatarShape {
    var morphCoordinates: [Double] { Self.morphPaths[self]! }

    // Normalize once, rather than on every animation frame or view update.
    private static let morphPaths = Dictionary(uniqueKeysWithValues: allCases.map {
        ($0, BotAvatarContour.normalized($0.coordinates))
    })
}

private struct BotAvatarContour {
    let start: CGPoint
    let c1: CGPoint
    let c2: CGPoint
    let end: CGPoint

    func split(at t: Double) -> (Self, Self) {
        func mix(_ a: CGPoint, _ b: CGPoint) -> CGPoint {
            CGPoint(x: a.x + (b.x - a.x) * t, y: a.y + (b.y - a.y) * t)
        }
        let a = mix(start, c1), b = mix(c1, c2), c = mix(c2, end)
        let d = mix(a, b), e = mix(b, c), point = mix(d, e)
        return (Self(start: start, c1: a, c2: d, end: point),
                Self(start: point, c1: e, c2: c, end: end))
    }

    var length: Double {
        var previous = start
        return (1...16).reduce(0) { length, step in
            let point = split(at: Double(step) / 16).0.end
            defer { previous = point }
            return length + hypot(point.x - previous.x, point.y - previous.y)
        }
    }

    static func normalized(_ values: [Double]) -> [Double] {
        func point(_ i: Int) -> CGPoint { CGPoint(x: values[i], y: values[i + 1]) }
        var start = point(0)
        var curves = stride(from: 2, to: values.count, by: 6).map { i in
            defer { start = point(i) }
            return Self(start: start, c1: point(i + 2), c2: point(i + 4), end: point(i))
        }
        // All contours travel clockwise and start on the upward center ray.
        // Matching orientation and origin prevents rotation during a morph.
        let area = curves.reduce(0) { $0 + $1.start.x * $1.end.y - $1.end.x * $1.start.y }
        if area < 0 {
            curves = curves.reversed().map { Self(start: $0.end, c1: $0.c2, c2: $0.c1, end: $0.start) }
        }
        var origin: (index: Int, t: Double, y: Double)?
        for (index, curve) in curves.enumerated() {
            for step in 0..<32 {
                var lo = Double(step) / 32, hi = Double(step + 1) / 32
                let left = curve.split(at: lo).0.end.x - 0.5
                let right = curve.split(at: hi).0.end.x - 0.5
                guard left * right <= 0 else { continue }
                for _ in 0..<30 {
                    let mid = (lo + hi) / 2
                    if (curve.split(at: mid).0.end.x - 0.5) * left > 0 { lo = mid } else { hi = mid }
                }
                let t = (lo + hi) / 2, y = curve.split(at: t).0.end.y
                if origin == nil || y < origin!.y { origin = (index, t, y) }
            }
        }
        if let origin {
            let (before, after) = curves[origin.index].split(at: origin.t)
            curves = [after] + Array(curves.dropFirst(origin.index + 1))
                + Array(curves.prefix(origin.index)) + [before]
        }
        // Allocate segments by curve length. De Casteljau splits keep corners
        // and narrow concavities intact, unlike sampling a replacement outline.
        precondition(curves.count <= BotAvatarSilhouetteVector.segmentCount)
        let lengths = curves.map(\.length)
        var divisions = Array(repeating: 1, count: curves.count)
        for _ in curves.count..<BotAvatarSilhouetteVector.segmentCount {
            let index = curves.indices.max { lengths[$0] / Double(divisions[$0]) < lengths[$1] / Double(divisions[$1]) }!
            divisions[index] += 1
        }
        var result: [Double] = [curves[0].start.x, curves[0].start.y]
        for (curve, count) in zip(curves, divisions) {
            var remainder = curve
            for remaining in stride(from: count, through: 1, by: -1) {
                let (segment, rest) = remainder.split(at: 1 / Double(remaining))
                result += [segment.end.x, segment.end.y, segment.c1.x, segment.c1.y, segment.c2.x, segment.c2.y]
                remainder = rest
            }
        }
        return result
    }
}
