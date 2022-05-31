//
//  ContentView.swift
//  WeatherCloset
//
//  Created by Jooeun Kim on 2022/05/03.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var weatherManager = WeatherManager()
    
    var body: some View {
       
            
            ZStack(alignment: .top){
                TodayWeatherView()
                    .zIndex(1)
                
                FivedaysWeatherView()
            }.frame( maxWidth: .infinity,  maxHeight: .infinity, alignment: .top)
      
    }
    
}
    // }
    





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
