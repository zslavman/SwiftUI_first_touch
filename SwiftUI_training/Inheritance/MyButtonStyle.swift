//
//  MyButtonStyle.swift
//  SwiftUI_training
//
//  Created by Zinko Viacheslav on 05.04.2021.
//

import SwiftUI

struct MyButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color(Palette.purple))
            .foregroundColor(Color.white)
            .font(.title)
            .cornerRadius(10)
            .shadow(color: Color(Palette.black_40), radius: 3, x: 0, y: 3)
    }
}


//MARK: - MyButtonStyle testing & using

struct Test1256: View {
    
    var body: some View {
        VStack(spacing: 20) {
            Button(action: {
                print("Button1 clicked")
            }) {
                Text("Button 1")
            }
            .modifier(MyButtonStyle())
        }
    }
}

struct Test1256_Previews: PreviewProvider {
    static var previews: some View {
        Test1256()
    }
}
