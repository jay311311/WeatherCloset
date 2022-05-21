//
//  currentWeather.swift
//  WeatherCloset
//
//  Created by Jooeun Kim on 2022/05/21.
//

import SwiftUI

struct CurrentWeatherView: View {
  //  @Binding var current: FiveDaysResponse
    var current : [FiveDaysResponse]?
    var body: some View {
        if let current = current?.first {
            VStack{
                VStack{
                    
                    Text(String(current.city.name))
                    .foregroundColor(.red)
                }
                HStack{
                    
                }
            }
        }
//        }else{
//            LoadingView()
//        }
    }
    

       
}

//struct CurrentWeatherView_Previews: PreviewProvider {
//    static var previews: some View {
//        CurrentWeatherView(current: <#[FiveDaysResponse]#>)
//    }
//}
