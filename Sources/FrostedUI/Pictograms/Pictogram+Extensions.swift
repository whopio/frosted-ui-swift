import SwiftUI

/// A full-color illustration from the Frosted Design System.
public enum FrostedPictogram: String, CaseIterable, Identifiable, Sendable {
    public var id: String { rawValue }

    case airplane
    case bank
    case barChart
    case barcode
    case beaker
    case books
    case boxOpen
    case bridge
    case calendar
    case cargoShip
    case cashRegister
    case chatBubbles
    case city
    case compass
    case constructionCone
    case crane
    case creditCard
    case cubePrinter
    case documentSigned
    case dollarBills
    case envelopeOpen
    case factory
    case folder
    case gameController
    case gasPump
    case gear
    case globeStand
    case graduationCap
    case hospital
    case hotAirBalloon
    case key
    case laptopOpen
    case lighthouse
    case locationPin
    case lockKeyhole
    case mailboxDown
    case mailboxUp
    case megaphone
    case newspaper
    case officeBuilding
    case phoneAppleLogo
    case phoneBlank
    case phoneWhopLogo
    case pieChart
    case piggyBank
    case radioTower
    case receipt
    case rocketSmoke
    case satellite
    case satelliteDish
    case server
    case shieldKeyhole
    case skateboard
    case skyscraper
    case sportsCarSmoke
    case stadium
    case stopwatch
    case store
    case tagVertical
    case targetBullseye
    case testTubes
    case train
    case trophy
    case truck
    case usbStick
    case videoCamera
    case wrench
}

/// Selects the surface a pictogram is drawn over.
public enum FrostedPictogramVariant: Sendable {
    /// Uses the light asset and automatically switches to its dark appearance.
    case automatic
    /// Uses the variant designed for an orange surface.
    case orange
}

private extension FrostedPictogram {
    func assetName(for variant: FrostedPictogramVariant) -> String {
        switch variant {
        case .automatic:
            rawValue
        case .orange:
            "\(rawValue)Orange"
        }
    }
}

public extension Image {
    init(_ pictogram: FrostedPictogram, variant: FrostedPictogramVariant = .automatic) {
        self.init(pictogram.assetName(for: variant), bundle: .module)
    }
}

public extension UIImage {
    convenience init?(_ pictogram: FrostedPictogram, variant: FrostedPictogramVariant = .automatic) {
        self.init(named: pictogram.assetName(for: variant), in: .module, compatibleWith: nil)
    }
}
