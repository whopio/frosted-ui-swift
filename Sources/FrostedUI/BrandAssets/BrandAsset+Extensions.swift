import SwiftUI

public enum FrostedBrandAsset: String, CaseIterable, Identifiable {
    public var id: String { rawValue }

    case asset3dPrinterGreen = "asset3dPrinterGreen"
    case asset3dPrinterRed = "asset3dPrinterRed"
    case asset5gBlue = "asset5gBlue"
    case asset5gRed = "asset5gRed"
    case balloon = "balloon"
    case balloonOverOrange = "balloonOverOrange"
    case barcode = "barcode"
    case barcodeOverOrange = "barcodeOverOrange"
    case bars = "bars"
    case beakerGreen = "beakerGreen"
    case beakerRed = "beakerRed"
    case book = "book"
    case bookOverOrange = "bookOverOrange"
    case box = "box"
    case bridgeBlue = "bridgeBlue"
    case bridgeBlueOverOrange = "bridgeBlueOverOrange"
    case bridgeRed = "bridgeRed"
    case carGreen = "carGreen"
    case carGreenOverOrange = "carGreenOverOrange"
    case carRed = "carRed"
    case card = "card"
    case cardOverOrange = "cardOverOrange"
    case chat = "chat"
    case cityBlue = "cityBlue"
    case cityRed = "cityRed"
    case compass = "compass"
    case compassOverOrange = "compassOverOrange"
    case cone = "cone"
    case coneOverOrange = "coneOverOrange"
    case controller = "controller"
    case crane = "crane"
    case dish = "dish"
    case dishOverOrange = "dishOverOrange"
    case drone = "drone"
    case droneOverOrange = "droneOverOrange"
    case factory = "factory"
    case factoryOverOrange = "factoryOverOrange"
    case gas = "gas"
    case grad = "grad"
    case gradOverOrange = "gradOverOrange"
    case hospital = "hospital"
    case laptop = "laptop"
    case laptopOverOrange = "laptopOverOrange"
    case lighthouse = "lighthouse"
    case lock = "lock"
    case lockOverOrange = "lockOverOrange"
    case moneyphone = "moneyphone"
    case moneyphoneOverOrange = "moneyphoneOverOrange"
    case news = "news"
    case newsOverOrange = "newsOverOrange"
    case phoneRed = "phoneRed"
    case pie = "pie"
    case piggybank = "piggybank"
    case piggybankOverOrange = "piggybankOverOrange"
    case pinBlue = "pinBlue"
    case pinRed = "pinRed"
    case plane = "plane"
    case receipt = "receipt"
    case registerBlue = "registerBlue"
    case registerRed = "registerRed"
    case rocket = "rocket"
    case rocketOverOrange = "rocketOverOrange"
    case satellite = "satellite"
    case server = "server"
    case shieldGreen = "shieldGreen"
    case shieldRed = "shieldRed"
    case ship = "ship"
    case shipOverOrange = "shipOverOrange"
    case shopBlue = "shopBlue"
    case shopBlue1 = "shopBlue1"
    case skateboard = "skateboard"
    case skateboardOverOrange = "skateboardOverOrange"
    case skyscraper = "skyscraper"
    case skyscraperOverOrange = "skyscraperOverOrange"
    case solar = "solar"
    case stadiumGreen = "stadiumGreen"
    case stadiumGreenOverOrange = "stadiumGreenOverOrange"
    case stadiumRed = "stadiumRed"
    case targetBlue = "targetBlue"
    case targetRed = "targetRed"
    case trainBlue = "trainBlue"
    case trainRed = "trainRed"
    case truckBlue = "truckBlue"
    case truckRed = "truckRed"
    case tubes = "tubes"
    case turbine = "turbine"
    case turbineOverOrange = "turbineOverOrange"
    case usbBlue = "usbBlue"
    case usbRed = "usbRed"
    case wrench = "wrench"
    case wrenchOverOrange = "wrenchOverOrange"
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
