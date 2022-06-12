import SwiftUI

struct FiveDaysDetailView: View {
    var fiveday : FiveDaysResponse.ThreeHoursResponse
    
   var fivedayViewModel =  TodayViewModel()
    var body: some View {
        VStack{
            Text("\(fivedayViewModel.getEveryThreeHour(time: fiveday.dt).date)")
                .font(.caption)
            Text("\(fivedayViewModel.getEveryThreeHour(time: fiveday.dt).hour)")
                .font(.subheadline)
            Image(systemName: fivedayViewModel.getSymbol(fiveday.weather[0].id))
                .padding(.top, 1)
                .font(.headline)
            Text("\(fivedayViewModel.getTemp(temp: fiveday.main.temp))°")
        }
    }
}

//struct FiveDaysDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        FiveDaysDetailView(fiveday: .init(dt: 1654117200, main: .init(temp: 23.32), weather: [FiveDaysResponse.ThreeHoursWeather].init(_immutableCocoaArray: 802)))
//    }
//}
