//
//  Network.swift
//  WeatherCloset
//
//  Created by Jooeun Kim on 2022/05/21.
//
import Alamofire
import Foundation
import CoreLocation

@available(iOS 13.0, *)
class WeatherManager:ObservableObject {
    @Published var fivedaysResponse:[FiveDaysResponse]? = []
    @Published var todaysResponse:[TodayResponse]? = []
    
    let lat = LocationManager().latitude
    let long  = LocationManager().longitude
    
    func loadFiveDays() {
        guard let latitude = lat , let longitude = long else { return }
        loadData(url:"https://api.openweathermap.org/data/2.5/forecast?lat=\(latitude)&lon=\(longitude)&appid=e71e68187e6da07eb17db48a8cf2dc1b&units=metric&cnt=24")
        
    }
    
    func loadToday(){
        guard let latitude = lat , let longitude = long else { return }
        loadData(url:"https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=e71e68187e6da07eb17db48a8cf2dc1b&units=metric")
    }
    
    func loadData(url:String ){
        guard  let url = URL(string: url) else { return }
        //  Alamofire
        AF.request(url, method: .get)
            .validate(statusCode: 200..<500)
            .responseJSON{ response  in
                switch response.result{
                case  .success(let data):
                    do  {   // guard let reponseValue = response.value  else { return }
                        
                        let dataJson  =  try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
                        
                        if url.pathComponents.contains("weather"){
                            print("여기까지 되니?0")
                            let result  =  try JSONDecoder().decode(TodayResponse.self, from: dataJson)
                            
                            self.todaysResponse = [result]
                        }else if url.pathComponents.contains("forecast") {
                            print("여기까지 되니?1")
                            let result = try JSONDecoder().decode(FiveDaysResponse.self, from: dataJson)
                            self.fivedaysResponse = [result]
                        }
                        
                    }catch {
                        print(response.error)
                    }
                    
                    
                case .failure(_): break
                    
                }
                
            }
        //  Alamofire
        
        
        //        URLSession.shared.dataTask(with: url) { data, _, _ in
        //            guard let data = data else { return }
        //
        //            do {
        //                if url.pathComponents.contains("weather"){
        //                    let result = try JSONDecoder().decode(TodayResponse.self, from: data)
        //                    DispatchQueue.main.async { [weak self] in
        //                        self?.todaysResponse = [result]
        //                    }
        //                }
        //                if url.pathComponents.contains("forecast"){
        //                    let result = try JSONDecoder().decode(FiveDaysResponse.self, from: data)
        //                    DispatchQueue.main.async { [weak self] in
        //                        self?.fivedaysResponse = [result]
        //                       // print(self?.fivedaysResponse?.first)
        //                    }
        //                }
        //            } catch {
        //                print("하하하\(error.localizedDescription)\n\(error)")
        //            }
        //        }.resume()
    }
}


