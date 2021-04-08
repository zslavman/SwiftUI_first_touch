//
//  DataSourceService.swift
//  SwiftUI_training
//
//  Created by Zinko Viacheslav on 04.04.2021.
//

import Foundation

class DataService {
    
    static let shared    = DataService()
    public var managment = [ManagerEntity]()
    public var products  = [ProductEntity]()

    
    private init() {
        loadAllData()
    }
    
    private func loadAllData() {
        managment = load(filename: "managersModelData")
        products = load(filename: "productsModelData")
    }
    
    private func load<T: Decodable>(filename: String, type: T.Type = T.self) -> T {
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: "json", subdirectory: nil) else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
        }
        catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        }
        catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
    
}
