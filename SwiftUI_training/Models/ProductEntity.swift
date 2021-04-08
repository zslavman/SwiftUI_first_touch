//
//  TopicEntity.swift
//  SwiftUI_training
//
//  Created by Zinko Viacheslav on 04.04.2021.
//

import Foundation

struct ProductEntity: Codable, Identifiable {
    var id         : Int
    var name       : String
    var image      : String
    var category   : Category
    var issueYear  : String
    var screenSize : String
    var isItCool   : Bool
    var description: String
}

enum Category: String, CaseIterable, Codable {
    case iPad
    case iPhone
}
