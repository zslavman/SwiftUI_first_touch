//
//  ManagerCell.swift
//  SwiftUI_training
//
//  Created by Zinko Viacheslav on 04.04.2021.
//

import SwiftUI

struct ManagerCell: View {
    
    public var manager: ManagerEntity
    
    init(manager: ManagerEntity) {
        self.manager = manager
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            HStack(alignment: .top, spacing: 30) {
                Image(manager.profileImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 110, height: 110)
                    .cornerRadius(10)
                    //.clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                VStack(alignment: .leading, spacing: 4) {
                    Text(manager.name)
                        .font(.system(size: 20))
                        .multilineTextAlignment(.leading)
                    HStack {
                        Text(manager.role)
                            .font(.footnote)
                            .lineLimit(2)
                    }
                    HStack(spacing: 30.0) {
                        RateView(count: manager.likes, isLike: true)
                        RateView(count: manager.dislikes, isLike: false)
                    }
                    .padding(.top, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                }
            }
            //Text(manager.text)
            TextAttributed(str: manager.text, textWidth: UIScreen.main.bounds.width * 0.9)
        }
    }
}

struct RateView: View {
    let count : Int
    let isLike: Bool

    var body: some View {
        HStack(spacing: 5.0) {
            let likeImage = (isLike) ? "👍" : "👎"
            Text(likeImage)
            Text(count.convertToAbbrevation())
                .font(.subheadline)
        }
    }

}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        ManagerCell(manager: DataService.shared.managment[3])
    }
}
