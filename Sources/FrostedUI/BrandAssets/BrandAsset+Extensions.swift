import SwiftUI

public enum FrostedBrandAsset: String, CaseIterable, Identifiable {
    public var id: String { rawValue }

    case balloon = "balloon"
    case cam = "cam"
    case card = "card"
    case chat = "chat"
    case cityBlue = "cityBlue"
    case compass = "compass"
    case cone = "cone"
    case dish = "dish"
    case envelope = "envelope"
    case laptop = "laptop"
    case mailboxDown = "mailboxDown"
    case megaphone = "megaphone"
    case money = "money"
    case news = "news"
    case phone = "phone"
    case phoneBlue = "phoneBlue"
    case piggyBank = "piggyBank"
    case pin = "pin"
    case receipt = "receipt"
    case rocket = "rocket"
    case satellite = "satellite"
    case shield = "shield"
    case shieldGreen = "shieldGreen"
    case stadium = "stadium"
    case storeBlue = "storeBlue"
    case testTubes = "testTubes"
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
