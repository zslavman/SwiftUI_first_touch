//
//  ContentView.swift
//  SwiftUI_training
//
//  Created by Zinko Viacheslav on 28.03.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    
    var body: some View {
        showSmth()
        //letMeKnow()
    }
    
    func showSmth() -> some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 25, content: {
            ZStack(alignment: /*@START_MENU_TOKEN@*/Alignment(horizontal: .center, vertical: .center)/*@END_MENU_TOKEN@*/, content: {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(Palette.slate))
                    .padding()
                Text("Placeholder text")
            })
            Text("Hello, world!")
                .padding()
                .foregroundColor(.green)
                .font(.system(size: 35, weight: .bold, design: .default))
            Text("Placeholder")
                .bold()
                .foregroundColor(.blue)
                .font(.title)
            Button("Run".uppercased()) {
                showingAlert = true
            }.actionSheet(isPresented: $showingAlert, content: {
                ActionSheet(title: Text("Айн цвай драй!"),
                            buttons: [.cancel(),
                                      .default(Text("1) First")),
                                      .default(Text("2) Second"))
                            ])
            })
            .padding()
            .font(.title)
            .foregroundColor(.orange)
            .background(Color.red)
        })
    }
    
    func letMeKnow() -> some View {
        Text("Placeholder")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
