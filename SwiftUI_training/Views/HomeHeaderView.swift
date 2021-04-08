//
//  HomeHeaderView.swift
//  SwiftUI_training
//
//  Created by Zinko Viacheslav on 08.04.2021.
//

import SwiftUI
import UIKit

struct HomeHeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            HStack(alignment: .top, spacing: 30) {
                Image(uiImage: #imageLiteral(resourceName: "apple_logo"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                VStack(alignment: .leading, spacing: 4) {
                    Text("Apple Inc.")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.leading)
                    HStack {
                        Text("Краткие ведомости о яблочном гиганте")
                            .font(.subheadline)
                            .lineLimit(2)
                    }
                }
            }
            let str = "Это приложение - тестирование возможностей фреймворка SwiftUI. В качестве DataModels взята информация с оффсайта компании Apple.\nОооочень \"сырой\" фреймворк, NSAttributedString вообще не поддерживается, только костылями ели-ели удалось запустить. После запуска этого костыля Automatic preview update само отключается. \nJump to defenition частенько кидает в то место, где метод был раньше, даже после чистки кэшей и перезагрузки."
            Text(str)
                .multilineTextAlignment(.leading)
                .font(.body)
            //TextAttributed(str: str, textWidth: UIScreen.main.bounds.width * 0.9)
        }
        .padding()
    }
}


struct HomeHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeaderView()
    }
}
