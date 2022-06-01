//
//  currentWeather.swift
//  WeatherCloset
//
//  Created by Jooeun Kim on 2022/05/21.
//

import SwiftUI

struct TodayWeatherView: View {
    @ObservedObject var clothesManager = ClothesManager()
    @ObservedObject var weatherManager = WeatherManager()
    
    var todayViewModel = TodayViewModel()
    var clothesViewModel = ClothesViewModel()
    
    var body: some View {
        if let today = weatherManager.todaysResponse?.first,
           let clothes = clothesManager.clothesResponse{
            let temp  = todayViewModel.getTemp(temp: today.main.temp)
            
            VStack(spacing:40){
                VStack{
                    HStack( spacing: 20){
                        Image(systemName: "location")
                        Text("\(today.name),")
                            .font(.title)
                        Text("\(today.sys.country)")
                    }
                    .padding(.top,15)
                    Text("\(todayViewModel.getCurrentTime(time:today.dt))기준")
                        .font(.caption)
                }
                HStack(alignment: .top,spacing: 140){
                    VStack(alignment: .leading){
                        Image(systemName: todayViewModel.getSymbol(today.weather[0].id))
                            .font(.system(size:55,weight: .regular))
                            .font(Font.title.weight(.light))
                    }
                    Text("\(temp)°")
                        .font(.system(size: 80))
                        .frame(height:70,alignment: .trailing)
                }.padding(.vertical,20)
                HStack{
                    ClothesBtnView(temp: temp, items: clothesViewModel.filterClothes(clothes, temp))
                }
                VStack{
                    TodayDetailWeatherView(wind: todayViewModel.toInt(today.wind.speed), humidity: todayViewModel.toInt(today.main.humidity), feelLike: todayViewModel.getTemp(temp: today.main.feels_like), sunRise: todayViewModel.getSunRiseSet(time: today.sys.sunrise), sunSet: todayViewModel.getSunRiseSet(time: today.sys.sunset))
                }.padding(.bottom,30)
                
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: 600, alignment: .top)
            .background(LinearGradient(gradient:Gradient(colors: [Color("custmBlue"),Color("custmMPurple"),Color("custmPurple")]) , startPoint: .topLeading, endPoint: .bottomTrailing))
        }else{
            LoadingView().task {
                weatherManager.loadToday()
            }
        }
    }
    
}


struct TodayWeatherView_Previews: PreviewProvider {
    
    static var previews: some View {
        TodayWeatherView()
    }
}
