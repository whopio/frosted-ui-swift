import SwiftUI

public enum FrostedBrandAsset: String, CaseIterable, Identifiable {
    public var id: String { rawValue }

    case airplane = "airplane"
    case airplaneBlue = "airplaneBlue"
    case bank = "bank"
    case bankGreen = "bankGreen"
    case barChart = "barChart"
    case barChartBlue = "barChartBlue"
    case barcode = "barcode"
    case beaker = "beaker"
    case beakerGreen = "beakerGreen"
    case books = "books"
    case boxOpen = "boxOpen"
    case bridge = "bridge"
    case bridgeBlue = "bridgeBlue"
    case calendar = "calendar"
    case calendarBlue = "calendarBlue"
    case cargoShip = "cargoShip"
    case cargoShipGreen = "cargoShipGreen"
    case cashRegister = "cashRegister"
    case cashRegisterBlue = "cashRegisterBlue"
    case chatBubbles = "chatBubbles"
    case city = "city"
    case cityBlue = "cityBlue"
    case compass = "compass"
    case constructionCone = "constructionCone"
    case crane = "crane"
    case craneBlue = "craneBlue"
    case creditCard = "creditCard"
    case cubePrinter = "cubePrinter"
    case cubePrinterGreen = "cubePrinterGreen"
    case documentSigned = "documentSigned"
    case documentSignedBlue = "documentSignedBlue"
    case dollarBills = "dollarBills"
    case dollarBillsBlue = "dollarBillsBlue"
    case envelopeOpen = "envelopeOpen"
    case envelopeOpenBlue = "envelopeOpenBlue"
    case factory = "factory"
    case factoryBlue = "factoryBlue"
    case folder = "folder"
    case folderGreen = "folderGreen"
    case gameController = "gameController"
    case gameControllerGreen = "gameControllerGreen"
    case gasPump = "gasPump"
    case gear = "gear"
    case gearBlue = "gearBlue"
    case globeStand = "globeStand"
    case graduationCap = "graduationCap"
    case graduationCapGreen = "graduationCapGreen"
    case hospital = "hospital"
    case hotAirBalloon = "hotAirBalloon"
    case hotAirBalloonBlue = "hotAirBalloonBlue"
    case key = "key"
    case keyBlue = "keyBlue"
    case laptopOpen = "laptopOpen"
    case laptopOpenGreen = "laptopOpenGreen"
    case lighthouse = "lighthouse"
    case locationPin = "locationPin"
    case locationPinGreen = "locationPinGreen"
    case lockKeyhole = "lockKeyhole"
    case lockKeyholeBlue = "lockKeyholeBlue"
    case mailboxDown = "mailboxDown"
    case mailboxDownBlue = "mailboxDownBlue"
    case mailboxUp = "mailboxUp"
    case mailboxUpBlue = "mailboxUpBlue"
    case megaphone = "megaphone"
    case megaphoneBlue = "megaphoneBlue"
    case newspaper = "newspaper"
    case newspaperBlue = "newspaperBlue"
    case officeBuilding = "officeBuilding"
    case officeBuildingBlue = "officeBuildingBlue"
    case phoneAppleLogo = "phoneAppleLogo"
    case phoneAppleLogoBlue = "phoneAppleLogoBlue"
    case phoneBlank = "phoneBlank"
    case phoneBlankBlue = "phoneBlankBlue"
    case phoneWhopLogo = "phoneWhopLogo"
    case phoneWhopLogoBlue = "phoneWhopLogoBlue"
    case pieChart = "pieChart"
    case pieChartBlue = "pieChartBlue"
    case piggyBank = "piggyBank"
    case radioTower = "radioTower"
    case radioTowerGreen = "radioTowerGreen"
    case receipt = "receipt"
    case receiptBlue = "receiptBlue"
    case rocketSmoke = "rocketSmoke"
    case satellite = "satellite"
    case satelliteBlue = "satelliteBlue"
    case satelliteDish = "satelliteDish"
    case satelliteDishBlue = "satelliteDishBlue"
    case server = "server"
    case shieldKeyhole = "shieldKeyhole"
    case shieldKeyholeGreen = "shieldKeyholeGreen"
    case skateboard = "skateboard"
    case skateboardBlue = "skateboardBlue"
    case skyscraper = "skyscraper"
    case skyscraperBlue = "skyscraperBlue"
    case sportsCarSmoke = "sportsCarSmoke"
    case sportsCarSmokeGreen = "sportsCarSmokeGreen"
    case stadium = "stadium"
    case stopwatch = "stopwatch"
    case stopwatchBlue = "stopwatchBlue"
    case store = "store"
    case storeBlue = "storeBlue"
    case tagVertical = "tagVertical"
    case tagVerticalBlue = "tagVerticalBlue"
    case targetBullseye = "targetBullseye"
    case targetBullseyeBlue = "targetBullseyeBlue"
    case testTubes = "testTubes"
    case testTubesGreen = "testTubesGreen"
    case train = "train"
    case trainBlue = "trainBlue"
    case trophy = "trophy"
    case trophyGreen = "trophyGreen"
    case truck = "truck"
    case truckBlue = "truckBlue"
    case usbStick = "usbStick"
    case usbStickGreen = "usbStickGreen"
    case videoCamera = "videoCamera"
    case videoCameraBlue = "videoCameraBlue"
    case wrench = "wrench"
    case wrenchBlue = "wrenchBlue"
}

public extension Image {
    init(_ asset: FrostedBrandAsset) {
        self.init(asset.rawValue, bundle: .module)
    }
}

public extension UIImage {
    convenience init?(_ asset: FrostedBrandAsset) {
        self.init(named: asset.rawValue, in: .module, compatibleWith: nil)
    }
}

#Preview {
    ScrollView {
        LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 3)) {
            ForEach(FrostedBrandAsset.allCases) { asset in
                Image(asset)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .padding()
    }
}
