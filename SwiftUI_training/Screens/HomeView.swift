//
//  HomeView.swift
//  SwiftUI_training
//
//  Created by Zinko Viacheslav on 04.04.2021.
//

import SwiftUI

struct HomeScreen: View {
    
    let categories: [String: [ProductEntity]]
    private let coursesCellSize = CGSize(width: 180, height: 180)
    private let webinarCellSize = CGSize(width: 150, height: 180)
    
    init() {
        let productsArr = DataService.shared.products
        self.categories = .init(grouping: productsArr, by: { $0.category.rawValue })
    }
    
    var body: some View {
        NavigationView(content: {
            List {
                UserCell(user: DataService.shared.swiftbook)
                    .listRowInsets(EdgeInsets())
                ForEach(self.categories.keys.sorted(), id: \.self) {
                    (key) in
                    let cellSize = (key == Category.webinars.rawValue) ? webinarCellSize : coursesCellSize
                    ProductsRow(cellSize: cellSize, productName: key, itemsArr: self.categories[key]!)
                        .listRowInsets(EdgeInsets()) /// align to left side
                }
                NavigationLink(
                    destination: UsersProfileView(),
                    label: {
                        Text("Крутые юзеры")
                    }).frame(height: 50)
            }
            .navigationBarTitle(Text("Homepage"))
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
