import Foundation
import SwiftUI

public struct InterDisplayFont {
    public static func registerFonts() {
        FontStyle.allCases.forEach { style in
            registerFont(bundle: .module, fontName: "\(FontFamily.inter.rawValue)\(style.rawValue)", fontExtension: "ttf")
        }
    }

    fileprivate static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {
        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider) else {
                  fatalError("Couldn't create font from data")
        }

        var error: Unmanaged<CFError>?

        CTFontManagerRegisterGraphicsFont(font, &error)
    }
}
