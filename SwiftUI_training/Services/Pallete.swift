//
//  Pallete.swift
//  SwiftUI_training
//
//  Created by Zinko Viacheslav on 28.03.2021.
//

import UIKit

class Palette {
    
    // strong colors
    static let ruby      = #colorLiteral(red: 0.8470588235, green: 0.1058823529, blue: 0.3764705882, alpha: 1)
    static let red       = #colorLiteral(red: 0.9568627451, green: 0.262745098, blue: 0.2117647059, alpha: 1)
    static let otherRed  = #colorLiteral(red: 0.8862745098, green: 0.3843137255, blue: 0.3215686275, alpha: 1)
    static let orange    = #colorLiteral(red: 0.9843137255, green: 0.5490196078, blue: 0, alpha: 1)
    static let yellow    = #colorLiteral(red: 0.9843137255, green: 0.7529411765, blue: 0.1764705882, alpha: 1)
    static let green     = #colorLiteral(red: 0.4117647059, green: 0.7960784314, blue: 0.2117647059, alpha: 1)
    static let mainBlue  = #colorLiteral(red: 0.1333333333, green: 0.5882352941, blue: 0.9529411765, alpha: 1)
    static let blue      = #colorLiteral(red: 0.2235294118, green: 0.6862745098, blue: 0.9882352941, alpha: 1)
    static let cyan      = #colorLiteral(red: 0.1490196078, green: 0.7764705882, blue: 0.8549019608, alpha: 1)
    static let purple    = #colorLiteral(red: 0.4549019608, green: 0.3960784314, blue: 0.937254902, alpha: 1)
    static let magenta   = #colorLiteral(red: 0.6705882353, green: 0.2784313725, blue: 0.737254902, alpha: 1)
    
    static let slate     = #colorLiteral(red: 0.3294117647, green: 0.431372549, blue: 0.4784313725, alpha: 1)
    static let gray      = #colorLiteral(red: 0.4588235294, green: 0.4588235294, blue: 0.4588235294, alpha: 1)
    static let darkGray  = #colorLiteral(red: 0.2588235294, green: 0.2588235294, blue: 0.2588235294, alpha: 1)
    
    static let black     = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    static let black_90  = #colorLiteral(red: 0.1019607843, green: 0.1019607843, blue: 0.1019607843, alpha: 1)
    static let black_80  = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
    static let black_70  = #colorLiteral(red: 0.3019607843, green: 0.3019607843, blue: 0.3019607843, alpha: 1)
    static let black_60  = #colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
    static let black_50  = #colorLiteral(red: 0.5019607843, green: 0.5019607843, blue: 0.5019607843, alpha: 1)
    static let black_40  = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
    static let black_30  = #colorLiteral(red: 0.7019607843, green: 0.7019607843, blue: 0.7019607843, alpha: 1)
    static let black_20  = #colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
    static let black_10  = #colorLiteral(red: 0.9019607843, green: 0.9019607843, blue: 0.9019607843, alpha: 1)
    static let black_05  = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
    static let black_03  = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
    
    static let black_withAlpha_70 = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.7)
    static let black_withAlpha_50 = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
    static let black_withAlpha_30 = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3)
    
    static let allColors = [ruby, red, orange, yellow, green, blue, cyan, purple, magenta, slate, gray, darkGray]
    
    static let test = #colorLiteral(red: 0.8470588235, green: 0.1058823529, blue: 0.3764705882, alpha: 1).withAlphaComponent(0.15)
         
}


extension UIColor {
    
    public var medium: UIColor {
        var alpha: CGFloat = 0.4
        if [Palette.slate, Palette.gray, Palette.darkGray].contains(self) {
            alpha = 0.3 // for 3 colors listed above
        }
        return self.convertAlphaToColor(backing: .white, alpha: alpha)
    }
    
    public var light: UIColor {
        return self.convertAlphaToColor(backing: .white, alpha: 0.1)
    }
    
}


extension UIColor {

    func convertAlphaToColor(backing: UIColor, alpha: CGFloat) -> UIColor {
        let amount: CGFloat = 1 - alpha
        let fromComponents = self.getColorComponents()
        let toComponents = backing.getColorComponents()

        let redAmount   = lerp(from: fromComponents.red, to: toComponents.red, alpha: amount)
        let greenAmount = lerp(from: fromComponents.green, to: toComponents.green, alpha: amount)
        let blueAmount  = lerp(from: fromComponents.blue, to: toComponents.blue, alpha: amount)
        
        return UIColor(red: redAmount, green: greenAmount, blue:  blueAmount, alpha: 1)
    }

    func getColorComponents() -> (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var (r, g, b, a): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
        getRed(&r, green: &g, blue: &b, alpha: &a)
        return (r, g, b, a)
    }
    
    /// combine colors by using the linear interpolation formula
    func lerp(from a: CGFloat, to b: CGFloat, alpha: CGFloat) -> CGFloat {
        return (1 - alpha) * a + alpha * b
    }
    
}
