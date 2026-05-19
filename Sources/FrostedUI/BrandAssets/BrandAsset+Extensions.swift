import SwiftUI

public enum FrostedBrandAsset: String, CaseIterable, Identifiable {
    public var id: String { rawValue }

    case asset3dPrinter = "asset3dPrinter"
    case asset3dPrinterGreen = "asset3dPrinterGreen"
    case asset5g = "asset5g"
    case asset5gGreen = "asset5gGreen"
    case balloon = "balloon"
    case balloonBlue = "balloonBlue"
    case barcode = "barcode"
    case bars = "bars"
    case barsBlue = "barsBlue"
    case beaker = "beaker"
    case beakerGreen = "beakerGreen"
    case books = "books"
    case box = "box"
    case bridge = "bridge"
    case bridgeBlue = "bridgeBlue"
    case cam = "cam"
    case camBlue = "camBlue"
    case car = "car"
    case carGreen = "carGreen"
    case card = "card"
    case chat = "chat"
    case city = "city"
    case cityBlue = "cityBlue"
    case compass = "compass"
    case cone = "cone"
    case controller = "controller"
    case controllerGreen = "controllerGreen"
    case crane = "crane"
    case craneBlue = "craneBlue"
    case dish = "dish"
    case dishBlue = "dishBlue"
    case envelope = "envelope"
    case envelopeBlue = "envelopeBlue"
    case factory = "factory"
    case factoryBlue = "factoryBlue"
    case gas = "gas"
    case gradCap = "gradCap"
    case gradCapGreen = "gradCapGreen"
    case hospital = "hospital"
    case laptop = "laptop"
    case laptopGreen = "laptopGreen"
    case lighthouse = "lighthouse"
    case lock = "lock"
    case lockBlue = "lockBlue"
    case mailboxDown = "mailboxDown"
    case mailboxDownBlue = "mailboxDownBlue"
    case mailboxUp = "mailboxUp"
    case mailboxUpBlue = "mailboxUpBlue"
    case megaphone = "megaphone"
    case megaphoneBlue = "megaphoneBlue"
    case money = "money"
    case moneyBlue = "moneyBlue"
    case news = "news"
    case newsBlue = "newsBlue"
    case phone = "phone"
    case phoneBlue = "phoneBlue"
    case pieChart = "pieChart"
    case pieChartBlue = "pieChartBlue"
    case piggyBank = "piggyBank"
    case pin = "pin"
    case pinGreen = "pinGreen"
    case plane = "plane"
    case planeBlue = "planeBlue"
    case receipt = "receipt"
    case receiptBlue = "receiptBlue"
    case register = "register"
    case registerBlue = "registerBlue"
    case rocket = "rocket"
    case satellite = "satellite"
    case satelliteBlue = "satelliteBlue"
    case server = "server"
    case shield = "shield"
    case shieldGreen = "shieldGreen"
    case ship = "ship"
    case shipGreen = "shipGreen"
    case skateboard = "skateboard"
    case skateboardBlue = "skateboardBlue"
    case skyscraper = "skyscraper"
    case skyscraperBlue = "skyscraperBlue"
    case stadium = "stadium"
    case store = "store"
    case storeBlue = "storeBlue"
    case target = "target"
    case targetBlue = "targetBlue"
    case testTubes = "testTubes"
    case testTubesGreen = "testTubesGreen"
    case train = "train"
    case trainBlue = "trainBlue"
    case trophy = "trophy"
    case trophyGreen = "trophyGreen"
    case truck = "truck"
    case truckBlue = "truckBlue"
    case usb = "usb"
    case usbBlue = "usbBlue"
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
