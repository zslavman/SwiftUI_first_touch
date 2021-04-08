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
        VStack {
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
        }
        .padding(.leading, 15)
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(object  : DataService.shared.products[1],
                    cellSize: CGSize(width: 190, height: 250))
    }
}
