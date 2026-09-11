import SwiftUI
import XCTest
@testable import FrostedUI

final class BotAvatarTests: XCTestCase {
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

    func testAllShapesSupportMorphingAndContainFittedFaces() {
        for shape in BotAvatarShape.allCases {
            let vector = shape.coordinates
            XCTAssertEqual(vector.values.count, 482, shape.rawValue)
            XCTAssertTrue(vector.values.allSatisfy(\.isFinite), shape.rawValue)
            XCTAssertEqual(vector + .zero, vector)
            XCTAssertEqual(vector - vector, .zero)
            let path = BotAvatarSilhouette(animatableData: vector).path(in: CGRect(x: 0, y: 0, width: 1, height: 1))
            for withMouth in [false, true] {
                let fit = shape.faceFit(withMouth: withMouth)
                for expression in BotAvatarExpression.allCases {
                    let features = [expression.eyes.0, expression.eyes.1] + (withMouth ? [expression.mouth] : [])
                    for feature in features {
                        let center = CGPoint(x: 0.5 + (feature.x - 0.5) * fit.scale,
                                             y: 0.45 + (feature.y - 0.45) * fit.scale + fit.dy)
                        XCTAssertTrue(path.contains(center), "\(shape) / \(expression) / mouth: \(withMouth)")
                    }
                }
            }
        }
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
}
