//
//  TodayDetailWeatherView.swift
//  WeatherCloset
//
//  Created by Jooeun Kim on 2022/06/02.
//

import SwiftUI

struct TodayDetailWeatherView: View {
    var wind : Int
    var humidity : Int
    var feelLike :Int
    var sunRise: String
    var sunSet :String
    
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 25){
            VStack(spacing:10){
            Text("바람")
                    .fontWeight(.light)
                    .font(.headline)
                    .opacity(0.8)
                Text("\(wind) km/h")
                    .font(.headline)
                    .fontWeight(.semibold)
            }
        VStack(spacing:10){
            Text("체감온도")
                .fontWeight(.light)
            Text("\(feelLike)°")
        }
        VStack(spacing:10){
            Text("습도")
                .fontWeight(.light)
            Text("\(humidity)%")
        }
        VStack(spacing:10){
            Text("일출&일몰")
                .fontWeight(.light)
            VStack{
            Text("\(sunRise)")
            Text("\(sunSet)")
            }
        }
        }
    }
}

struct TodayDetailWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        TodayDetailWeatherView(wind: 5, humidity: 5, feelLike: 5, sunRise: "7:00", sunSet: "8:00")
    }
}
