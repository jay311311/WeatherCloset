//
//  currentWeather.swift
//  WeatherCloset
//
//  Created by Jooeun Kim on 2022/05/21.
//

import SwiftUI

struct TodayWeatherView: View {
//    @Binding var current: FiveDaysResponse
    @ObservedObject var networkManager = NetworkManager()
    var todayViewModel = TodayViewModel()
    
    var body: some View {
        if let today = networkManager.todaysResponse?.first {
            VStack{
                HStack{
                    Image(systemName: "location")
                    Text("\(today.name),")
                    Text("\(today.sys.country)")
                    .foregroundColor(.red)
                }
                Text("\(todayViewModel.getCurrentTime(time:today.dt))기준")
                Text("\(todayViewModel.getTemp(temp: today.main.temp))°")
                Image(systemName: todayViewModel.getSymbol(weather: today.weather))
                    .font(Font.title.weight(.light))
                Text("\(today.weather[0].description)")
                HStack{
                    Text("바람:\(todayViewModel.toInt(today.wind.speed))km/h")
                    Text("습도:\(todayViewModel.toInt(today.main.humidity))%")
                    Text("체감기온:\(todayViewModel.getTemp(temp: today.main.feels_like))")
//                    Text("체감온도:\()")
                }
            }
        
        }else{
            LoadingView().task {
                networkManager.loadToday()
            }
        }
    }
    
}


struct TodayWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        TodayWeatherView()
    }
}
