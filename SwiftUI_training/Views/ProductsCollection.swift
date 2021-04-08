//
//  ProductsCollection.swift
//  SwiftUI_training
//
//  Created by Zinko Viacheslav on 04.04.2021.
//

import SwiftUI

struct ProductsCollection: View {
    let cellSize   : CGSize
    let productName: String
    let itemsArr   : [ProductEntity]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Text(self.productName)
                .font(.headline)
                .padding(EdgeInsets(top: 5, leading: 16, bottom: 0, trailing: 0))
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 0) {
                    ForEach(self.itemsArr) {
                        (item) in
                        NavigationLink(destination: DetailsScreen(imageSize: self.cellSize, object: item)) {
                            ProductCell(object: item, cellSize: self.cellSize)
                        }
                    }
                }
            }
            .frame(height: cellSize.height + 30)
        }
        .padding(.top)
    }
}

struct ProductsRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductsCollection(cellSize   : CGSize(width: 190, height: 190),
                           productName: "iPads",
                           itemsArr   : Array(DataService.shared.products.prefix(3)))
    }
}
