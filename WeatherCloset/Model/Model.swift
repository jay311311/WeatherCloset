//
//  Model.swift
//  WeatherCloset
//
//  Created by Jooeun Kim on 2022/05/20.
//

import Foundation

struct TodayResponse: Decodable {
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse
    var dt:Double
    var sys: SystemResponse
    
    struct CoordinatesResponse: Decodable {
        var lon: Double
        var lat: Double
    }
    
    struct WeatherResponse: Decodable {
        var id: Double
      
    }
    
    struct MainResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var humidity: Double
    }
    
    struct WindResponse: Decodable {
        var speed: Double
        var deg: Double
    }
    
    struct SystemResponse :Decodable{
        var   country: String
        var      sunrise: Double
        var      sunset: Double
    }
}



struct FiveDaysResponse : Decodable, Equatable,Hashable {
    
    static func == (lhs: FiveDaysResponse, rhs: FiveDaysResponse) -> Bool {
        return    lhs.list == rhs.list
    }
    
    var list :[ThreeHoursResponse]
 //   var city : CityResponse


    struct ThreeHoursResponse: Decodable,Equatable,Hashable{
        static func == (lhs: FiveDaysResponse.ThreeHoursResponse, rhs: FiveDaysResponse.ThreeHoursResponse) -> Bool {
           return lhs.main == rhs.main && lhs.weather == rhs.weather
        }
        
        
        var dt: Double
        var main : ThreeHoursMain
        var weather : [ThreeHoursWeather]
       
    }
        struct ThreeHoursMain: Decodable,Hashable {
            var temp : Double
           
        }
        
        struct ThreeHoursWeather: Decodable,Hashable {
            var id : Double
        }
     
       
    
    
//    struct CityResponse : Decodable {
//        var id : Double
//        var name : String
//        var coord : CityCoordinates
//        var country :String
//        var timezone :Double
//        var sunrise:Double
//        var sunset :Double
//        struct CityCoordinates: Decodable {
//            var lon: Double
//            var lat: Double
//        }
//    }
    
}

struct ClothesResponse :Codable,Hashable{
    var name : String
    var icon : String
    var url : String
    var level : [String]
}
