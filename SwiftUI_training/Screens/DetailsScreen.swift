//
//  DetailsScreen.swift
//  SwiftUI_training
//
//  Created by Zinko Viacheslav on 05.04.2021.
//

import SwiftUI

struct DetailsScreen: View {
    let imageSize: CGSize
    let object   : ProductEntity
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 30.0) {
                let imageRatio = imageSize.height / imageSize.width
                Image(object.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 220, height: 250 * imageRatio)
                    .cornerRadius(20)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 20)
//                            .stroke(Color.purple, lineWidth: 1)
//                    )
//                    .shadow(color: Color(Palette.black_60), radius: 5, x: 0, y: 5)
                Text(object.name)
                    .font(.system(size: 22, weight: .medium))
                    .multilineTextAlignment(.center)
                HStack(spacing: 40) {
                    CountAndDescriptView(value: object.screenSize, descr: "Диагональ")
                    CountAndDescriptView(value: object.issueYear, descr: "Дата выпуска")
                    let boolVal = (object.isItCool) ? "✅" : "❌"
                    CountAndDescriptView(value: boolVal, descr: "Крут?")
                }
                TitleAndDescrView(descr: object.description)
                Spacer()
            }
            .padding()
        }
        .navigationBarTitle(object.category.rawValue)
    }
}

struct CountAndDescriptView: View {
    let value: String
    let descr: String
    var body: some View {
        VStack {
            Text(self.value)
                .font(.title)
            Text(self.descr)
        }
    }
}

struct TitleAndDescrView: View {
    let descr: String
    var body: some View {
        VStack(alignment: .leading, spacing: 12.0) {
            Text("Описание")
                .font(.title)
                .padding(.leading)
            Text(self.descr)
                .multilineTextAlignment(.leading)
        }
    }
}

struct DetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailsScreen(imageSize: CGSize(width: 120, height: 80),
                      object   : DataService.shared.products[2])
    }
}
