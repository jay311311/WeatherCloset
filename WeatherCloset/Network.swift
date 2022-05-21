//
//  Network.swift
//  WeatherCloset
//
//  Created by Jooeun Kim on 2022/05/21.
//

import Foundation
import CoreLocation

class NetworkManager: ObservableObject  {
    @Published var fivedaysResponse:[FiveDaysResponse] = []
    init() {
      //  print("시작했나?")
           guard  let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?lat=35.046329&lon=129.108063&appid=e71e68187e6da07eb17db48a8cf2dc1b&units=metric&cnt=24") else {
               return
           }
       // print(url)
           URLSession.shared.dataTask(with: url) { data, _, _ in
               guard let data = data else {
                   return
               }
               
               do {
                   let result = try JSONDecoder().decode(FiveDaysResponse.self, from: data)
                   DispatchQueue.main.async {
                       self.fivedaysResponse = [result]
                      // print(self.fivedaysResponse)
                   }
               } catch {
                   print("하하하\(error.localizedDescription)\n\(error)")
               }
               
              
           }.resume()
        
       }
    
    
}


