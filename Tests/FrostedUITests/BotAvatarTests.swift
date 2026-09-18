import SwiftUI
import SnapshotTesting
import XCTest
@testable import FrostedUI

final class BotAvatarTests: XCTestCase {
    #if os(macOS)
    @MainActor
    func testFaceSnapshot() throws {
        let view = VStack(spacing: 20) {
            HStack(spacing: 20) {
                ForEach(BotAvatarExpression.allCases, id: \.self) { expression in
                    VStack(spacing: 8) {
                        BotAvatar(size: 64, tint: .orange, expression: expression, animated: false)
                        BotAvatar(size: 20, tint: .orange, expression: expression, animated: false)
                        Text(verbatim: expression.rawValue).font(.system(size: 10))
                    }
                    .frame(width: 72)
                }
            }
            ForEach([BotAvatarShape.semiCircle, .fan, .triangle, .boom, .softBoom, .pixelTriangle, .heart], id: \.self) { shape in
                HStack(spacing: 20) {
                    ForEach(BotAvatarExpression.allCases, id: \.self) { expression in
                        BotAvatar(size: 64, shape: shape, tint: .blue, expression: expression, animated: false)
                            .frame(width: 72)
                    }
                }
            }
        }
        .padding(24)
        .background(Color.white)
        .environment(\.colorScheme, .light)
        let renderer = ImageRenderer(content: view)
        renderer.scale = 2
        assertSnapshot(of: try XCTUnwrap(renderer.nsImage), as: .image, named: "macOS")
    }
    #endif

    func testIdentityRemainsStableForUnicodeIdentifiers() {
        // Fixed values catch changes to hash encoding or palette ordering.
        let fixtures: [(String, BotAvatarShape, FrostedTint)] = [
            ("", .cookie4, .magenta),
            ("bot_123", .burst, .grass),
            ("🤖", .puffy, .cyan),
            ("café", .gem, .gold),
            ("机器人", .burst, .teal),
        ]
        for (identifier, shape, tint) in fixtures {
            let identity = BotAvatarIdentity(identifier)
            XCTAssertEqual(identity.shape, shape, identifier)
            XCTAssertEqual(identity.tint, tint, identifier)
        }
    }

    func testAllShapesContainFittedFaces() {
        for shape in BotAvatarShape.allCases {
            let coordinates = shape.coordinates
            XCTAssertEqual((coordinates.count - 2) % 6, 0, shape.rawValue)
            XCTAssertTrue(coordinates.allSatisfy(\.isFinite), shape.rawValue)
            // Core Graphics flattens curves with an absolute tolerance. Test at
            // a useful drawing scale rather than a one-point unit box.
            let path = BotAvatarSilhouette(coordinates: coordinates).path(in: CGRect(x: 0, y: 0, width: 1000, height: 1000))
            // Upstream rounds SVG points to 3 decimals and face fit to 2.
            // Its soft-boom/wide eye extends ~0.00175 outside the rounded
            // outline. Preserve parity with a 0.2% tolerance (0.32pt at 160pt).
            let edge = path.strokedPath(StrokeStyle(lineWidth: 4))
            for expression in BotAvatarExpression.allCases {
                let features = [expression.eyes.0, expression.eyes.1, expression.mouth]
                for feature in features {
                    let fitted = feature.fitted(to: shape)
                    XCTAssertEqual(fitted.animatableData.values.count, 26)
                    XCTAssertEqual(fitted.animatableData + .zero, fitted.animatableData)
                    // Check the complete curved outline, not just feature centers.
                    for point in sampledOutline(fitted) {
                        let scaled = CGPoint(x: point.x * 1000, y: point.y * 1000)
                        XCTAssertTrue(path.contains(scaled) || edge.contains(scaled), "\(shape) / \(expression) at \(point)")
                    }
                }
            }
        }
    }

    func testMorphTopologyPreservesEveryOriginalSilhouette() {
        let rect = CGRect(x: 0, y: 0, width: 1000, height: 1000)
        for shape in BotAvatarShape.allCases {
            let values = shape.morphCoordinates
            let vector = BotAvatarSilhouetteVector(values: values)
            XCTAssertEqual(values.count, BotAvatarSilhouetteVector.zero.values.count, shape.rawValue)
            XCTAssertEqual(vector + .zero, vector)
            XCTAssertEqual(values[0], 0.5, accuracy: 1e-8, shape.rawValue)
            XCTAssertEqual(values[0], values[values.count - 6], accuracy: 1e-8, shape.rawValue)
            XCTAssertEqual(values[1], values[values.count - 5], accuracy: 1e-8, shape.rawValue)
            let original = BotAvatarSilhouette(coordinates: shape.coordinates).path(in: rect)
            let morphed = BotAvatarSilhouette(coordinates: values).path(in: rect)
            XCTAssertEqual(original.boundingRect.minX, morphed.boundingRect.minX, accuracy: 0.001)
            XCTAssertEqual(original.boundingRect.minY, morphed.boundingRect.minY, accuracy: 0.001)
            XCTAssertEqual(original.boundingRect.maxX, morphed.boundingRect.maxX, accuracy: 0.001)
            XCTAssertEqual(original.boundingRect.maxY, morphed.boundingRect.maxY, accuracy: 0.001)
            // Independently sample both contours and compare enclosed area.
            // This catches lost lobes/corners without Core Graphics' sensitivity
            // to nearly coincident vertices in a subdivided path.
            let originalArea = silhouetteArea(shape.coordinates)
            XCTAssertEqual(silhouetteArea(values), originalArea,
                           accuracy: max(1e-7, originalArea * 0.0002), shape.rawValue)
        }
    }

    func testShapeInterpolationProducesAnIntermediateOutline() {
        let circle = BotAvatarSilhouetteVector(values: BotAvatarShape.circle.morphCoordinates)
        let heart = BotAvatarSilhouetteVector(values: BotAvatarShape.heart.morphCoordinates)
        var delta = heart - circle
        delta.scale(by: 0.5)
        let midpoint = circle + delta
        XCTAssertNotEqual(midpoint, circle)
        XCTAssertNotEqual(midpoint, heart)
        XCTAssertTrue(midpoint.values.allSatisfy(\.isFinite))
        let rect = CGRect(x: 0, y: 0, width: 1000, height: 1000)
        let point = CGPoint(x: 500, y: 90)
        XCTAssertTrue(BotAvatarSilhouette(coordinates: circle.values).path(in: rect).contains(point))
        XCTAssertFalse(BotAvatarSilhouette(coordinates: midpoint.values).path(in: rect).contains(point))
        XCTAssertFalse(BotAvatarSilhouette(coordinates: heart.values).path(in: rect).contains(point))
    }

    func testReducedMotionPreservesStaticStatusPose() {
        for status in BotAvatarStatus.allCases {
            let motion = BotAvatarMotion(time: 4.85, statusTime: 0.24, blinkTime: 0.15,
                                         status: status, enabled: false, gazing: false)
            XCTAssertEqual(motion.x, 0)
            XCTAssertEqual(motion.y, status == .thinking ? -0.05 : (status == .blocked ? 0.035 : 0))
            XCTAssertEqual(motion.blink, 1)
            XCTAssertEqual(motion.scale, 1)
        }
    }

    func testCommandedGazeStopsWanderButKeepsBlinking() {
        let motion = BotAvatarMotion(time: 1.5, statusTime: 1, blinkTime: 0.15,
                                     status: .thinking, enabled: true, gazing: true)
        XCTAssertEqual(motion.x, 0)
        XCTAssertEqual(motion.y, -0.05)
        XCTAssertEqual(motion.blink, 0.08, accuracy: 0.0001)
    }

    func testDonePulseSettlesAndGazeRejectsNonFiniteValues() {
        let pulse = BotAvatarMotion(time: 0, statusTime: 0.24, blinkTime: nil,
                                    status: .done, enabled: true, gazing: false)
        let settled = BotAvatarMotion(time: 0, statusTime: 0.6, blinkTime: nil,
                                      status: .done, enabled: true, gazing: false)
        XCTAssertEqual(pulse.scale, 1.04, accuracy: 0.0001)
        XCTAssertEqual(settled.scale, 1)
        XCTAssertEqual(BotAvatar.clampGaze(.nan), 0)
        XCTAssertEqual(BotAvatar.clampGaze(.infinity), 0)
        XCTAssertEqual(BotAvatar.clampGaze(-3), -1)
        XCTAssertEqual(BotAvatar.clampGaze(3), 1)
    }
    func testFaceGeometryMatchesFrontend() {
        // Generated from whopio/frosted-ui dab3f668, bot-avatar.expressions.ts.
        // Values include the frontend's 1.16 face scale, before SVG rounding.
        let fixtures: [(BotAvatarExpression, [[Double]])] = [
            (.neutral, [
                [0.2419, 0.4268, 0.2419, 0.47324843, 0.27955157, 0.5109, 0.326, 0.5109, 0.37244843, 0.5109, 0.4101, 0.47324843, 0.4101, 0.4268, 0.4101, 0.38035157, 0.37244843, 0.3427, 0.326, 0.3427, 0.27955157, 0.3427, 0.2419, 0.38035157, 0.2419, 0.4268],
                [0.5899, 0.4268, 0.5899, 0.47324843, 0.62755157, 0.5109, 0.674, 0.5109, 0.72044843, 0.5109, 0.7581, 0.47324843, 0.7581, 0.4268, 0.7581, 0.38035157, 0.72044843, 0.3427, 0.674, 0.3427, 0.62755157, 0.3427, 0.5899, 0.38035157, 0.5899, 0.4268],
                [0.3666, 0.63792, 0.3666, 0.665468724, 0.42632318, 0.6878, 0.5, 0.6878, 0.57367682, 0.6878, 0.6334, 0.665468724, 0.6334, 0.63792, 0.6334, 0.621262632, 0.57367682, 0.60776, 0.5, 0.60776, 0.42632318, 0.60776, 0.3666, 0.621262632, 0.3666, 0.63792],
            ]),
            (.happy, [
                [0.23552, 0.44188, 0.23552, 0.436754656, 0.273950568, 0.4326, 0.32136, 0.4326, 0.368769432, 0.4326, 0.4072, 0.436754656, 0.4072, 0.44188, 0.4072, 0.404080588, 0.368769432, 0.37344, 0.32136, 0.37344, 0.273950568, 0.37344, 0.23552, 0.404080588, 0.23552, 0.44188],
                [0.5928, 0.44188, 0.5928, 0.436754656, 0.631230568, 0.4326, 0.67864, 0.4326, 0.726049432, 0.4326, 0.76448, 0.436754656, 0.76448, 0.44188, 0.76448, 0.404080588, 0.726049432, 0.37344, 0.67864, 0.37344, 0.631230568, 0.37344, 0.5928, 0.404080588, 0.5928, 0.44188],
                [0.2854, 0.6124, 0.2854, 0.700171516, 0.38147642, 0.77132, 0.5, 0.77132, 0.61852358, 0.77132, 0.7146, 0.700171516, 0.7146, 0.6124, 0.7146, 0.600867976, 0.61852358, 0.59152, 0.5, 0.59152, 0.38147642, 0.59152, 0.2854, 0.600867976, 0.2854, 0.6124],
            ]),
            (.wide, [
                [0.2158, 0.40128, 0.2158, 0.45894012, 0.26253988, 0.50568, 0.3202, 0.50568, 0.37786012, 0.50568, 0.4246, 0.45894012, 0.4246, 0.40128, 0.4246, 0.34361988, 0.37786012, 0.29688, 0.3202, 0.29688, 0.26253988, 0.29688, 0.2158, 0.34361988, 0.2158, 0.40128],
                [0.5754, 0.40128, 0.5754, 0.45894012, 0.62213988, 0.50568, 0.6798, 0.50568, 0.73746012, 0.50568, 0.7842, 0.45894012, 0.7842, 0.40128, 0.7842, 0.34361988, 0.73746012, 0.29688, 0.6798, 0.29688, 0.62213988, 0.29688, 0.5754, 0.34361988, 0.5754, 0.40128],
                [0.413, 0.69012, 0.413, 0.74778012, 0.4519499, 0.79452, 0.5, 0.79452, 0.5480501, 0.79452, 0.587, 0.74778012, 0.587, 0.69012, 0.587, 0.63245988, 0.5480501, 0.58572, 0.5, 0.58572, 0.4519499, 0.58572, 0.413, 0.63245988, 0.413, 0.69012],
            ]),
            (.wink, [
                [0.2419, 0.4268, 0.2419, 0.47324843, 0.27955157, 0.5109, 0.326, 0.5109, 0.37244843, 0.5109, 0.4101, 0.47324843, 0.4101, 0.4268, 0.4101, 0.38035157, 0.37244843, 0.3427, 0.326, 0.3427, 0.27955157, 0.3427, 0.2419, 0.38035157, 0.2419, 0.4268],
                [0.595912388479, 0.460667909987, 0.595309676105, 0.454933484804, 0.63097520447, 0.446485153087, 0.675576289226, 0.441797390182, 0.720177373982, 0.437109627277, 0.756820031913, 0.43795806237, 0.757422744286, 0.443692487552, 0.753806470045, 0.409285936455, 0.7147209882, 0.385195584339, 0.670119903444, 0.389883347244, 0.625518818687, 0.394571110149, 0.592296114237, 0.426261358889, 0.595912388479, 0.460667909987],
                [0.35848, 0.65532, 0.35848, 0.705292104, 0.43118648, 0.7458, 0.52088, 0.7458, 0.602244836, 0.7458, 0.6682, 0.683999492, 0.6682, 0.60776, 0.6682, 0.60776, 0.59549352, 0.60776, 0.5058, 0.60776, 0.424435164, 0.60776, 0.35848, 0.629052612, 0.35848, 0.65532],
            ]),
            (.sleepy, [
                [0.242526868647, 0.47532921178, 0.245025357879, 0.495677773633, 0.284421579581, 0.507583952815, 0.330523790027, 0.501923313149, 0.376626000473, 0.496262673483, 0.411971620585, 0.475179350072, 0.409473131353, 0.45483078822, 0.406974642121, 0.434482226367, 0.367578420419, 0.422576047185, 0.321476209973, 0.428236686851, 0.275373999527, 0.433897326517, 0.240028379415, 0.454980649928, 0.242526868647, 0.47532921178],
                [0.590526868647, 0.45483078822, 0.588028379415, 0.475179350072, 0.623373999527, 0.496262673483, 0.669476209973, 0.501923313149, 0.715578420419, 0.507583952815, 0.754974642121, 0.495677773633, 0.757473131353, 0.47532921178, 0.759971620585, 0.454980649928, 0.724626000473, 0.433897326517, 0.678523790027, 0.428236686851, 0.632421579581, 0.422576047185, 0.593025357879, 0.434482226367, 0.590526868647, 0.45483078822],
                [0.44896, 0.69824, 0.44896, 0.731554736, 0.471810608, 0.75856, 0.5, 0.75856, 0.528189392, 0.75856, 0.55104, 0.731554736, 0.55104, 0.69824, 0.55104, 0.664925264, 0.528189392, 0.63792, 0.5, 0.63792, 0.471810608, 0.63792, 0.44896, 0.664925264, 0.44896, 0.69824],
            ]),
            (.angry, [
                [0.247871119658, 0.420102721336, 0.23937610919, 0.442232980209, 0.270064926993, 0.474595668899, 0.316418847606, 0.492389271905, 0.362772768218, 0.510182874911, 0.407233869875, 0.506667537537, 0.415728880342, 0.484537278664, 0.42422389081, 0.462407019791, 0.393535073007, 0.430044331101, 0.347181152394, 0.412250728095, 0.300827231782, 0.394457125089, 0.256366130125, 0.397972462463, 0.247871119658, 0.420102721336],
                [0.584271119658, 0.484537278664, 0.592766130125, 0.506667537537, 0.637227231782, 0.510182874911, 0.683581152394, 0.492389271905, 0.729935073007, 0.474595668899, 0.76062389081, 0.442232980209, 0.752128880342, 0.420102721336, 0.743633869875, 0.397972462463, 0.699172768218, 0.394457125089, 0.652818847606, 0.412250728095, 0.606464926993, 0.430044331101, 0.57577610919, 0.462407019791, 0.584271119658, 0.484537278664],
                [0.3202, 0.71448, 0.3202, 0.704229312, 0.40069646, 0.69592, 0.5, 0.69592, 0.59930354, 0.69592, 0.6798, 0.704229312, 0.6798, 0.71448, 0.6798, 0.667070568, 0.59930354, 0.62864, 0.5, 0.62864, 0.40069646, 0.62864, 0.3202, 0.667070568, 0.3202, 0.71448],
            ]),
            (.sad, [
                [0.256862322122, 0.493275363926, 0.264521458232, 0.529308766283, 0.303240966285, 0.551607396465, 0.343347709778, 0.543082444969, 0.38345445327, 0.534557493472, 0.409756813989, 0.49843803843, 0.402097677878, 0.462404636074, 0.394438541768, 0.426371233717, 0.355719033715, 0.404072603535, 0.315612290222, 0.412597555031, 0.27550554673, 0.421122506528, 0.249203186011, 0.45724196157, 0.256862322122, 0.493275363926],
                [0.597902322122, 0.462404636074, 0.590243186011, 0.49843803843, 0.61654554673, 0.534557493472, 0.656652290222, 0.543082444969, 0.696759033715, 0.551607396465, 0.735478541768, 0.529308766283, 0.743137677878, 0.493275363926, 0.750796813989, 0.45724196157, 0.72449445327, 0.421122506528, 0.684387709778, 0.412597555031, 0.644280966285, 0.404072603535, 0.605561458232, 0.426371233717, 0.597902322122, 0.462404636074],
                [0.36428, 0.74, 0.36428, 0.729749312, 0.425041844, 0.72144, 0.5, 0.72144, 0.574958156, 0.72144, 0.63572, 0.729749312, 0.63572, 0.74, 0.63572, 0.684902552, 0.574958156, 0.64024, 0.5, 0.64024, 0.425041844, 0.64024, 0.36428, 0.684902552, 0.36428, 0.74],
            ]),
            (.suspicious, [
                [0.2361, 0.43492, 0.2361, 0.454780708, 0.27634823, 0.47088, 0.326, 0.47088, 0.37565177, 0.47088, 0.4159, 0.454780708, 0.4159, 0.43492, 0.4159, 0.415059292, 0.37565177, 0.39896, 0.326, 0.39896, 0.27634823, 0.39896, 0.2361, 0.415059292, 0.2361, 0.43492],
                [0.5841, 0.42448, 0.5841, 0.452669392, 0.62434823, 0.47552, 0.674, 0.47552, 0.72365177, 0.47552, 0.7639, 0.452669392, 0.7639, 0.42448, 0.7639, 0.396290608, 0.72365177, 0.37344, 0.674, 0.37344, 0.62434823, 0.37344, 0.5841, 0.396290608, 0.5841, 0.42448],
                [0.413, 0.6762, 0.413, 0.688372692, 0.45973988, 0.69824, 0.5174, 0.69824, 0.57506012, 0.69824, 0.6218, 0.677986052, 0.6218, 0.653, 0.6218, 0.640827308, 0.57506012, 0.63096, 0.5174, 0.63096, 0.45973988, 0.63096, 0.413, 0.651213948, 0.413, 0.6762],
            ]),
        ]
        for (expression, expected) in fixtures {
            let features = [expression.eyes.0, expression.eyes.1, expression.mouth]
            for (feature, values) in zip(features, expected) {
                let actual = feature.fitted(to: .circle).animatableData.values
                for (a, b) in zip(actual, values) {
                    XCTAssertEqual(a, b, accuracy: 1e-10, expression.rawValue)
                }
            }
        }
    }

    func testNarrowShapesUseFrontendFit() {
        let triangle = BotAvatarExpression.neutral.eyes.0.fitted(to: .pixelTriangle).bounds
        XCTAssertEqual(triangle.midX, 0.22992, accuracy: 0.00001)
        XCTAssertEqual(triangle.midY, 0.388656, accuracy: 0.00001)
        let heart = BotAvatarExpression.neutral.eyes.0.fitted(to: .heart).bounds
        XCTAssertEqual(heart.midX, 0.3521, accuracy: 0.00001)
        XCTAssertEqual(heart.midY, 0.40028, accuracy: 0.00001)
    }

    func testPointerGazeTracksOutsideAvatarAndClampsAtWindowRange() throws {
        let bounds = CGRect(x: 0, y: 0, width: 40, height: 40)
        let gaze = try XCTUnwrap(BotAvatarPointerGaze.resolve(location: CGPoint(x: 180, y: -140), bounds: bounds))
        XCTAssertEqual(gaze, CGPoint(x: 1, y: -1))
        XCTAssertEqual(BotAvatarPointerGaze.resolve(location: CGPoint(x: 20, y: 20), bounds: bounds), .zero)
        XCTAssertEqual(BotAvatarPointerGaze.resolve(location: CGPoint(x: CGFloat.infinity, y: CGFloat.nan), bounds: bounds), .zero)
        XCTAssertNil(BotAvatarPointerGaze.resolve(location: .zero, bounds: .zero))
    }

    private func silhouetteArea(_ values: [Double]) -> Double {
        func point(_ i: Int) -> CGPoint { CGPoint(x: values[i], y: values[i + 1]) }
        var start = point(0), previous = start
        var area = 0.0
        for i in stride(from: 2, to: values.count, by: 6) {
            let end = point(i), c1 = point(i + 2), c2 = point(i + 4)
            for step in 1...128 {
                let t = Double(step) / 128, u = 1 - t
                let current = CGPoint(
                    x: u * u * u * start.x + 3 * u * u * t * c1.x + 3 * u * t * t * c2.x + t * t * t * end.x,
                    y: u * u * u * start.y + 3 * u * u * t * c1.y + 3 * u * t * t * c2.y + t * t * t * end.y)
                area += previous.x * current.y - current.x * previous.y
                previous = current
            }
            start = end
        }
        return abs(area) / 2
    }

    private func sampledOutline(_ feature: BotAvatarFeature) -> [CGPoint] {
        let values = feature.animatableData.values
        func point(_ index: Int) -> CGPoint { CGPoint(x: values[index], y: values[index + 1]) }
        var start = point(0)
        var result: [CGPoint] = []
        for index in stride(from: 2, to: values.count, by: 6) {
            let c1 = point(index), c2 = point(index + 2), end = point(index + 4)
            for step in 0...20 {
                let t = Double(step) / 20, u = 1 - t
                result.append(CGPoint(x: u * u * u * start.x + 3 * u * u * t * c1.x + 3 * u * t * t * c2.x + t * t * t * end.x,
                                      y: u * u * u * start.y + 3 * u * u * t * c1.y + 3 * u * t * t * c2.y + t * t * t * end.y))
            }
            start = end
        }
        return result
    }

}
