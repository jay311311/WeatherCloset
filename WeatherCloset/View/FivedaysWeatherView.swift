import SwiftUI

struct FiveDaysWeatherView: View {
    @ObservedObject var fivedayManager = WeatherManager()
    var body: some View {
        if let fiveday = fivedayManager.fivedaysResponse?.first?.list{
            VStack{
                HStack(alignment: .lastTextBaseline, spacing: 180){
                    Text("5일 동안 날씨")
                    Text("* 3시간 기준")
                }
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(alignment: .top){
                        ForEach(fiveday, id: \.self){ fiveday in
                            FiveDaysDetailView(fiveday: fiveday)
                            
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(.top, 20)
        }else{
            LoadingView().task {
                fivedayManager.loadFiveDays()
            }
        }
    }
}

struct FiveDaysWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        FiveDaysWeatherView()
    }
}
