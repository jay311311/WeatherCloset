import SwiftUI

struct ContentView: View {
    @ObservedObject var weatherManager = WeatherManager()
    
    var body: some View {
        
            VStack{
                TodayWeatherView()
                    .frame( alignment: .center)
                    
                 //   .zIndex(1)
                
                FiveDaysWeatherView()
                    .frame( alignment: .top)
                
                    
            }.frame( maxWidth: .infinity,  maxHeight: .infinity)
            
      
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
