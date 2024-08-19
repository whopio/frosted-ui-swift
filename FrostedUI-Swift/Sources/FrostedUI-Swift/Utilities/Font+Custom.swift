import SwiftUI

public enum FontFamily: String {
    case inter = "InterDisplay"
}

public enum FontStyle: String, CaseIterable {
    case bold = "-Bold"
    case light = "-Light"
    case medium = "-Medium"
    case regular = "-Regular"
}

public enum FontStep: String, CaseIterable {
    case step1, step2, step3, step4, step5, step6, step7, step8, step9

    var size: CGFloat {
        switch self {
        case .step1: return 12.0
        case .step2: return 14.0
        case .step3: return 16.0
        case .step4: return 18.0
        case .step5: return 20.0
        case .step6: return 24.0
        case .step7: return 28.0
        case .step8: return 35.0
        case .step9: return 60.0
        }
    }

    var letterSpacing: CGFloat {
        switch self {
        case .step1: return 0.0025
        case .step2, .step3: return 0.0
        case .step4: return -0.0025
        case .step5: return -0.005
        case .step6: return -0.00625
        case .step7: return -0.0075
        case .step8: return -0.01
        case .step9: return -0.025
        }
    }

    var lineHeight: CGFloat {
        switch self {
        case .step1: return 16
        case .step2: return 20
        case .step3: return 24
        case .step4: return 26
        case .step5: return 28
        case .step6: return 30
        case .step7: return 36
        case .step8: return 40
        case .step9: return 60
        }
    }
}

public extension Text {
    func applyStyle(
        _ step: FontStep,
        _ style: FontStyle,
        _ color: Color = .black,  // update to use the actual color palette
        family: FontFamily = .inter
    ) -> some View {
        let fontName = "\(family.rawValue)\(style.rawValue)"
        let uiFont = UIFont(name: fontName, size: step.size)
        return self
            .font(.custom(fontName, size: step.size))
            .kerning(step.letterSpacing)
            .lineSpacing(step.lineHeight - (uiFont?.lineHeight ?? step.size))
            .padding(.vertical, (step.lineHeight - (uiFont?.lineHeight ?? step.lineHeight)) / 2)
            .foregroundColor(color)
    }
}

public extension TextField {
    func applyStyle(
        _ step: FontStep,
        _ style: FontStyle,
        _ color: Color = .black,
        family: FontFamily = .inter
    ) -> some View {
        let fontName = "\(family.rawValue)\(style.rawValue)"
        let uiFont = UIFont(name: fontName, size: step.size)
        return self
            .font(.custom(fontName, size: step.size))
            .kerning(step.letterSpacing)
            .lineSpacing(step.lineHeight - (uiFont?.lineHeight ?? step.size))
            .padding(.vertical, (step.lineHeight - (uiFont?.lineHeight ?? step.lineHeight)) / 2)
            .foregroundStyle(color)
    }
}

public extension TextEditor {
    func applyStyle(
        _ step: FontStep,
        _ style: FontStyle,
        _ color: Color = .black,  // update to use the actual color palette
        family: FontFamily = .inter
    ) -> some View {
        let fontName = "\(family.rawValue)\(style.rawValue)"
        let uiFont = UIFont(name: fontName, size: step.size)
        return self
            .font(.custom(fontName, size: step.size))
            .kerning(step.letterSpacing)
            .lineSpacing(step.lineHeight - (uiFont?.lineHeight ?? step.size))
            .padding(.vertical, (step.lineHeight - (uiFont?.lineHeight ?? step.lineHeight)) / 2)
            .foregroundStyle(color)
    }
}

public struct FontStyleView: View {
    public var family: FontFamily = .inter
    public var style: FontStyle
    public var step: FontStep

    public init(family: FontFamily = .inter, style: FontStyle, step: FontStep) {
        self.family = family
        self.style = style
        self.step = step
    }

    public var body: some View {
        Text("\(family.rawValue)\(style.rawValue) - \(step)")
            .applyStyle(step, style)
    }
}

