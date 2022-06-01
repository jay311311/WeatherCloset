//
//  FivedaysWeather.swift
//  WeatherCloset
//
//  Created by Jooeun Kim on 2022/05/21.
//

import SwiftUI

struct FiveDaysWeatherView: View {
    @ObservedObject var fivedayManager = WeatherManager()
    var body: some View {
        if let fiveday = fivedayManager.fivedaysResponse?.first?.list{
            VStack{
                HStack(alignment: .lastTextBaseline, spacing: 200){
                    Text("5일 날씨")
                    Text("* 3시간 기준")
                }
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(alignment: .top){
                        ForEach(fiveday, id: \.self){ fiveday in
                            FiveDaysDetailView(fiveday: fiveday)
                            
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, 20)
            
        }else{
            LoadingView().task {
                fivedayManager.loadFiveDays()
            }
        }
    }
}

struct FiveDaysWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        FiveDaysWeatherView()
    }
}
