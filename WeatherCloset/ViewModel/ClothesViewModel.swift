//
//  ClothesViewModel.swift
//  WeatherCloset
//
//  Created by Jooeun Kim on 2022/05/25.
//

import Foundation
class ClothesViewModel:ObservableObject{
    var VeryHot:[ClothesResponse] = []
     var Hot:[ClothesResponse] = []
    var LittleHot:[ClothesResponse] = []
    var Nice:[ClothesResponse] = []
    var Warm:[ClothesResponse] = []
    var LittleCold:[ClothesResponse] = []
    var Cold:[ClothesResponse] = []
    var VeryCold:[ClothesResponse] = []
    
    
    func filterClothes(_ clotehs :[ClothesResponse],_ temp: Int) -> [ClothesResponse]  {
        for item in  clotehs{
            if item.level.contains("VHot"){ VeryHot.append(item) }
            if item.level.contains("Hot"){ Hot.append(item) }
            if item.level.contains("LHot"){ LittleHot.append(item) }
            if item.level.contains("Nice"){ Nice.append(item) }
            if item.level.contains("Warm"){ Warm.append(item) }
            if item.level.contains("LCold"){ LittleCold.append(item) }
            if item.level.contains("Cold"){ Cold.append(item) }
            if item.level.contains("VCold"){ VeryCold.append(item) }
        }
        let result = tempStandard(temp)!
        print("어떻게 만들어 졌니\(result)")
        return result
        
    }
    
    func tempStandard(_ temp:Int) -> [ClothesResponse]?{
        switch temp{
        case 28... : return VeryHot
        case 23...27 : return Hot
        case 20...22 : return LittleHot
        case 17...19 : return Nice
        case 12...16 : return Warm
        case 9...11 : return LittleCold
        case 5...8 : return Cold
        case ...4 : return VeryCold
        default:
           return nil
        }
    }
}



