//
//  ReccoemendData.swift
//  WeatherCloset
//
//  Created by Jooeun Kim on 2022/05/25.
//

import Foundation


class ClothesManager:ObservableObject {
    @Published var clothesResponse : [ClothesResponse]? = []

    
     init () {
        var filename :String = "ClothesData.json"
        guard let file =  Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        do{
            let decoder = JSONDecoder()
            let data  =  try Data(contentsOf: file)
            let result = try decoder.decode([ClothesResponse].self, from: data)
            clothesResponse = result
        } catch {
            fatalError("Couldn't parse \(filename) as \(ClothesResponse.self):\n\(error)")
        }
    }
}
