//
//  HomeView.swift
//  SwiftUI_training
//
//  Created by Zinko Viacheslav on 04.04.2021.
//

import SwiftUI

struct HomeScreen: View {
    
    let categories: [String: [ProductEntity]]
    private let iPadCellSize = CGSize(width: 180, height: 180)
    private let iPhoneCellSize = CGSize(width: 150, height: 180)
    
    init() {
        let productsArr = DataService.shared.products
        self.categories = .init(grouping: productsArr, by: { $0.category.rawValue })
    }
    
    var body: some View {
        NavigationView {
            List {
                HomeHeaderView()
                    .listRowInsets(EdgeInsets())

                NavigationLink(
                    destination: UsersProfileScreen(),
                    label: {
                        Text("Руководство Apple")
                    }).frame(height: 50)

                ForEach(self.categories.keys.sorted(), id: \.self) {
                    (key) in
                    let cellSize = (key == Category.iPhone.rawValue) ? iPhoneCellSize : iPadCellSize
                    ProductsCollection(cellSize: cellSize, productName: key, itemsArr: self.categories[key]!)
                        .listRowInsets(EdgeInsets()) /// align to left side
                }
            }
            .navigationBarTitle("SwiftUI", displayMode: .inline) /// this line give crashed constraints into console if target < iOS14
            
//            .navigationBarTitleDisplayMode(.inline)
//            .toolbar(content: {
//                ToolbarItem(placement: .principal, content: {
//                    Text("SwiftUI")
//                })
//            })
        }
    }
    
}

@available(iOS 14.0, *)
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
