//
//  Model.swift
//  WeatherCloset
//
//  Created by Jooeun Kim on 2022/05/20.
//

import Foundation


//struct CurrentResponse: Decodable {
//    var coord: CoordinatesResponse
//    var weather: [WeatherResponse]
//    var main: MainResponse
//    var name: String
//    var wind: WindResponse
//
//    struct CoordinatesResponse: Decodable {
//        var lon: Double
//        var lat: Double
//    }
//
//    struct WeatherResponse: Decodable {
//        var id: Double
//        var main: String
//        var description: String
//        var icon: String
//    }
//
//    struct MainResponse: Decodable {
//        var temp: Double
//        var feels_like: Double
//        var temp_min: Double
//        var temp_max: Double
//        var pressure: Double
//        var humidity: Double
//    }
//    
//    struct WindResponse: Decodable {
//        var speed: Double
//        var deg: Double
//    }
//}

//extension ResponseBody.MainResponse {
//    var feelsLike: Double { return feels_like }
//    var tempMin: Double { return temp_min }
//    var tempMax: Double { return temp_max }
//}


struct FiveDaysResponse : Decodable {
    var cod : String
    var list :[ThreeHoursResponse]
    var city : CityResponse
    
    struct ThreeHoursResponse: Decodable{
        var dt: Int
        var main : ThreeHoursMain
        var weather : [ThreeHoursWeather]
        var clouds : ThreeHoursClouds
        var wind : ThreeHoursWind
        var sys : ThreeHoursSys
        var dt_txt : String
        
        struct ThreeHoursMain: Decodable {
            var temp : Double
            var feels_like :Double
            var temp_min :Double
            var temp_max :Double
            var pressure :Double
            var sea_level :Double
            var grnd_level:Double
            var humidity :Double
            var temp_kf :Double
        }
        
        struct ThreeHoursWeather: Decodable {
            var id : Double
            var main: String
            var description : String
            var icon :String
        }
        struct ThreeHoursClouds:Decodable{
            var all :Double
        }
        struct ThreeHoursWind:Decodable{
            var speed :Double
            var deg :Double
            var gust: Double
        }
        struct ThreeHoursSys:Decodable{
            var pod : String
        }
    }
    
    struct CityResponse : Decodable {
        var id : Double
        var name : String
        var coord : CityCoordinates
        var country :String
        var timezone :Double
        var sunrise:Double
        var sunset :Double
        struct CityCoordinates: Decodable {
            var lon: Double
            var lat: Double
        }
    }
    
}
