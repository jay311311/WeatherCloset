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
        
            VStack{
                TodayWeatherView()
                    
                 //   .zIndex(1)
                
                FiveDaysWeatherView()
                    
            }.frame( maxWidth: .infinity,  maxHeight: .infinity, alignment: .center)
            
      
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
