//
//  ContentView.swift
//  WeatherCloset
//
//  Created by Jooeun Kim on 2022/05/03.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        if networkManager.todaysResponse != nil || networkManager.fivedaysResponse != nil{
            VStack{
                TodayWeatherView()
                FivedaysWeatherView()
            }
        }else{
            LoadingView()
                .task {
                    networkManager.loadToday()
                    networkManager.loadFiveDays()
                }
        }
// }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
