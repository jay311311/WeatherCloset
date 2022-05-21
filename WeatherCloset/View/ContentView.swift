//
//  ContentView.swift
//  WeatherCloset
//
//  Created by Jooeun Kim on 2022/05/03.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    @State var weather:[FiveDaysResponse]? = NetworkManager().fivedaysResponse
    
    var body: some View {
        if weather != nil{
            VStack{
                CurrentWeatherView(current: networkManager.fivedaysResponse)
                FivedaysWeatherView()
            }
        }else{
            LoadingView()
                .task {
                    NetworkManager()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
