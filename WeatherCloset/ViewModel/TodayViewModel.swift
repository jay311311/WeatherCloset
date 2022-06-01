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
        let current = Date(timeIntervalSince1970: time).toStringKST(dateFormat: "yyyy.MM.dd  HH:mm")
        return current
    }
    
    func getEveryThreeHour(time :Double) -> (date : String, hour:String){
        let date = Date(timeIntervalSince1970: time).toStringKST(dateFormat: "MM/dd  HH:mm")
        
        let time  = date.split(separator: " ")
        //print("date : \(time[0]), dn : \(time[1]), hour:\(time[2])")
        let day:String = String(time[0])
        let hour :String = String(time[1])
        return (date : day, hour:hour)
    }
    
    func getSunRiseSet(time :Double) -> String{
        let current = Date(timeIntervalSince1970: time).toStringKST(dateFormat: "a  HH:mm")
        return current
    }
    
    func getSymbol(_ todayWeather :Double) -> String{
        switch todayWeather {
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
    func switchId(){
       
    }
}


extension Date{
    func toStringKST( dateFormat format: String ) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        dateFormatter.locale = Locale.current
        dateFormatter.amSymbol = "am"
        dateFormatter.pmSymbol = "pm"
        return dateFormatter.string(from: self)
    }
    
}



