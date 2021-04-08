//
//  ManagerEntity.swift
//  SwiftUI_training
//
//  Created by Zinko Viacheslav on 04.04.2021.
//

import Foundation
import SwiftUI

struct ManagerEntity: Codable, Identifiable {
    var id          : Int
    var name        : String
    var profileImage: String
    var role        : String
    var likes       : Int
    var dislikes    : Int
    var text        : String
}
