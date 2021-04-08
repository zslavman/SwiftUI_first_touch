//
//  BgView.swift
//  SwiftUI_training
//
//  Created by Zinko Viacheslav on 05.04.2021.
//

import SwiftUI

struct BgView<Content>: View where Content: View {
    //private let bgImage = Image.init(systemName: "m.circle.fill")
    private let bgImage = Image(uiImage: #imageLiteral(resourceName: "12"))
    private let content: Content

    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body : some View {
        ZStack {
            bgImage
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.2)
            content
        }
    }
}

struct BgView_Previews: PreviewProvider {
    static var previews: some View {
        BgView {
            Text("Hello my bustard!")
        }
    }
}
