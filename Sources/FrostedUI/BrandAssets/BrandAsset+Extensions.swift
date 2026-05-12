import SwiftUI

public enum FrostedBrandAsset: String, CaseIterable, Identifiable {
    public var id: String { rawValue }

    case asset3dPrinterGreen = "asset3dPrinterGreen"
    case asset3dPrinterRed = "asset3dPrinterRed"
    case asset5gBlue = "asset5gBlue"
    case asset5gRed = "asset5gRed"
    case balloon = "balloon"
    case barcode = "barcode"
    case bars = "bars"
    case beakerGreen = "beakerGreen"
    case beakerRed = "beakerRed"
    case book = "book"
    case box = "box"
    case bridgeBlue = "bridgeBlue"
    case bridgeRed = "bridgeRed"
    case carGreen = "carGreen"
    case carRed = "carRed"
    case card = "card"
    case chat = "chat"
    case cityBlue = "cityBlue"
    case cityRed = "cityRed"
    case compass = "compass"
    case cone = "cone"
    case controller = "controller"
    case crane = "crane"
    case dish = "dish"
    case drone = "drone"
    case factory = "factory"
    case gas = "gas"
    case grad = "grad"
    case hospital = "hospital"
    case laptop = "laptop"
    case lighthouse = "lighthouse"
    case lock = "lock"
    case moneyphone = "moneyphone"
    case news = "news"
    case phoneRed = "phoneRed"
    case pie = "pie"
    case piggybank = "piggybank"
    case pinBlue = "pinBlue"
    case pinRed = "pinRed"
    case plane = "plane"
    case receipt = "receipt"
    case registerBlue = "registerBlue"
    case registerRed = "registerRed"
    case rocket = "rocket"
    case satellite = "satellite"
    case server = "server"
    case shieldGreen = "shieldGreen"
    case shieldRed = "shieldRed"
    case ship = "ship"
    case shopBlue = "shopBlue"
    case shopBlue1 = "shopBlue1"
    case skateboard = "skateboard"
    case skyscraper = "skyscraper"
    case solar = "solar"
    case stadiumGreen = "stadiumGreen"
    case stadiumRed = "stadiumRed"
    case targetBlue = "targetBlue"
    case targetRed = "targetRed"
    case trainBlue = "trainBlue"
    case trainRed = "trainRed"
    case truckBlue = "truckBlue"
    case truckRed = "truckRed"
    case tubes = "tubes"
    case turbine = "turbine"
    case usbBlue = "usbBlue"
    case usbRed = "usbRed"
    case wrench = "wrench"
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
