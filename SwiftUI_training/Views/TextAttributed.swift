//
//  TextAttributed.swift
//  SwiftUI_training
//
//  Created by Zinko Viacheslav on 08.04.2021.
//

import SwiftUI
import UIKit

/// NOT WORKS! (unlimited bounds)

struct TextAttributed: UIViewRepresentable {
    let str      : String
    let textWidth: CGFloat
    let fontSize : CGFloat
    
    init(str: String, textWidth: CGFloat, fontSize: CGFloat = 16) {
        self.str = str
        self.textWidth = textWidth
        self.fontSize = fontSize
    }
    
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.lineBreakMode = .byClipping
        label.numberOfLines = 0
        label.attributedText = getAtrStr(str: str, fontSize: fontSize)
        label.preferredMaxLayoutWidth = textWidth // important line!!!
        return label
    }
    
    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.attributedText = getAtrStr(str: str, fontSize: fontSize)
    }
    
    func getAtrStr(str: String, fontSize: CGFloat) -> NSAttributedString {
        let mainStyle = NSMutableParagraphStyle()
        mainStyle.alignment           = .justified
        mainStyle.hyphenationFactor   = 1
        mainStyle.firstLineHeadIndent = 25
        let mainAtr: [NSAttributedString.Key : Any] = [
            .font           : UIFont.systemFont(ofSize: fontSize),
            .paragraphStyle : mainStyle,
            //.foregroundColor: UIColor.red,
        ]
        let attrStr = NSAttributedString(string: str, attributes: mainAtr)
        return attrStr
    }
}


//MARK: - Test preview

struct TextAttributed_Previews: PreviewProvider {
    static var previews: some View {
        TextAttributed(str: testStr, textWidth: 200)
            .frame(width: UIScreen.main.bounds.width * 0.8, height: 300)
    }
    
    static let testStr = "главный юрисконсульт Apple и старший вице-президент по правовым вопросам и глобальной безопасности, подчиняющаяся генеральному директору Тиму Куку"
}
    




//struct TextAttributed: View {
//    @State private var size: CGSize = .zero
//    let attrString: NSAttributedString
//    let textWidth: CGFloat
//
//    init(attrString: NSAttributedString, textWidth: CGFloat) {
//        self.attrString = attrString
//        self.textWidth = textWidth
//    }
//
//    var body: some View {
//        TextAttributedRepresentable(attributedString: attrString, textWidth: textWidth, size: $size)
//            .frame(width: size.width, height: size.height)
//    }
//
//    struct TextAttributedRepresentable: UIViewRepresentable {
//        let attributedString: NSAttributedString
//        let textWidth: CGFloat
//        @Binding var size: CGSize
//
//        func makeUIView(context: Context) -> UILabel {
//            let label = UILabel()
//            label.lineBreakMode = .byClipping
//            label.numberOfLines = 0
//            label.attributedText = attributedString
//            label.preferredMaxLayoutWidth = textWidth
//            return label
//        }
//
//        func updateUIView(_ uiView: UILabel, context: Context) {
//            uiView.attributedText = attributedString
//            DispatchQueue.main.async {
//                let newSize = uiView.sizeThatFits(uiView.superview?.bounds.size ?? .zero)
//                size = newSize
//            }
//        }
//    }
//
//}
