//
//  UsersProfileView.swift
//  SwiftUI_training
//
//  Created by Zinko Viacheslav on 03.04.2021.
//

import SwiftUI

struct UsersProfileScreen: View {
    var body: some View {
        VStack {
            List(DataService.shared.managment) { (user) in
                ManagerCell(manager: user)
                    .padding([.top, .bottom], 20)
            }
            .navigationBarTitle("Руководители")
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        UsersProfileScreen()
    }
}
