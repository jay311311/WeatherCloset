//
//  ViewModel.swift
//  WeatherCloset
//
//  Created by Jooeun Kim on 2022/05/21.
//
import Foundation

class TodayViewModel{

        
    func toInt ( _ numbers :Double) -> Int {
        return Int(numbers)
    }
    
    func getTemp (temp :Double) -> Int {
        let tempRound = lround(temp)
        return tempRound
        
    }
   
    func getCurrentTime(time :Double) -> String{
        let current = Date(timeIntervalSince1970: time).toStringKST(dateFormat: "yyyy.MM.dd HH:mm")
        
        return current
        
    }

    
   
    func getSymbol(weather :[TodayResponse.WeatherResponse]) -> String{
        switch weather[0].id {
        case 200...299:
            return "cloud.bolt"
        case 300...399:
            return "cloud.drizzle"
        case 500...504:
            return "cloud.rain"
        case 511 :
            return "cloud.sleet.fill"
        case 520...531 :
            return "cloud.heavyrain"
        case 600...699 :
            return "snowflake"
        case 701...771:
            return "cloud.fog"
        case 781 :
            return "tornado"
        case 800:
            return "sun.max"
        case 801...803:
            return "cloud.sun"
        case 804:
            return "smoke"
        default:
            return "questionmark"
        }
    }
    
    
}


extension Date{
    func toStringKST( dateFormat format: String ) -> String {
        let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = format
                dateFormatter.timeZone = TimeZone.autoupdatingCurrent
                dateFormatter.locale = Locale.current
                return dateFormatter.string(from: self)
    }
          
        }



