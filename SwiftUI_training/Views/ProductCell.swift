//
//  ProductCell.swift
//  SwiftUI_training
//
//  Created by Zinko Viacheslav on 04.04.2021.
//

import SwiftUI

struct ProductCell: View {
    
    var object  : ProductEntity
    let cellSize: CGSize
    
    var body: some View {
        VStack(spacing: 4) {
            Image(object.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(5)
                .frame(width: cellSize.width, height: cellSize.height)
                .contextMenu(menuItems: {
                    Text("Menu Item 1")
                    Text("Menu Item 2")
                    Text("Menu Item 3")
                })
            
            Text(object.name)
                .font(.system(size: 14))
                .foregroundColor(Color(Palette.black_60))
        }
        .padding([.leading, .bottom], 15)
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(object  : DataService.shared.products[1],
                    cellSize: CGSize(width: 190, height: 250))
    }
}
