//
//  FiveDaysDetailView.swift
//  WeatherCloset
//
//  Created by Jooeun Kim on 2022/06/02.
//

import SwiftUI

struct FiveDaysDetailView: View {
    var fiveday : FiveDaysResponse.ThreeHoursResponse
    
   var fivedayViewModel =  TodayViewModel()
    var body: some View {
        VStack{
            Text("\(fivedayViewModel.getEveryThreeHour(time: fiveday.dt).date)")
            Text("\(fivedayViewModel.getEveryThreeHour(time: fiveday.dt).hour)")
            Image(systemName: fivedayViewModel.getSymbol(fiveday.weather[0].id))
        }
    }
}

//struct FiveDaysDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        FiveDaysDetailView(fiveday: .init(dt: 1654117200, main: .init(temp: 23.32), weather: [FiveDaysResponse.ThreeHoursWeather].init(_immutableCocoaArray: 802)))
//    }
//}
