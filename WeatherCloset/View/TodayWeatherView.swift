//
//  currentWeather.swift
//  WeatherCloset
//
//  Created by Jooeun Kim on 2022/05/21.
//

import SwiftUI

struct TodayWeatherView: View {
    @ObservedObject var clothesManager = ClothesManager()
    @ObservedObject var networkManager = NetworkManager()
    var todayViewModel = TodayViewModel()
    var clothesViewModel = ClothesViewModel()
    
    var body: some View {
        if let today = networkManager.todaysResponse?.first, let clothes = clothesManager.clothesResponse{
           var temp  = todayViewModel.getTemp(temp: today.main.temp)
            VStack(spacing:40){
                VStack{
                    HStack( spacing: 20){
                        Image(systemName: "location")
                        Text("\(today.name),")
                            .font(.title)
                        Text("\(today.sys.country)")
                    }.padding(.top,15)
                    Text("\(todayViewModel.getCurrentTime(time:today.dt))기준")
                        .font(.caption)
                }
                HStack(alignment: .top,spacing: 140){
                    VStack(alignment: .leading){
                        Image(systemName: todayViewModel.getSymbol(weather: today.weather))
                            .font(.system(size:35,weight: .regular))
                            .font(Font.title.weight(.light))
                        Text("\(today.weather[0].description)")
                            .font(.caption)
                        
                    }
                    Text("\(temp)°")
                        .font(.system(size: 80))
                        .frame(height:70,alignment: .trailing)
                }
                HStack{
                    ClothesBtnView(temp: temp, items: clothesViewModel.filterClothes(clothes, temp))
                }
                VStack{
                    Text("바람:\(todayViewModel.toInt(today.wind.speed))km/h")
                    Text("습도:\(todayViewModel.toInt(today.main.humidity))%")
                    Text("체감기온:\(todayViewModel.getTemp(temp: today.main.feels_like))")
                    Text(" 일출:\(todayViewModel.getSunRiseSet(time: today.sys.sunrise))")
                    Text(" 일몰:\(todayViewModel.getSunRiseSet(time: today.sys.sunset))")
                }
               
            }
            .frame(maxWidth: .infinity, maxHeight: 550
                , alignment: .top)
            .background(LinearGradient(gradient:Gradient(colors: [Color("custmBlue"),Color("custmMPurple"),Color("custmPurple")]) , startPoint: .topLeading, endPoint: .bottomTrailing))
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
