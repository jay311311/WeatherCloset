import SwiftUI

struct TodayDetailWeatherView: View {
    var wind : Int
    var humidity : Int
    var feelLike :Int
    var sunRise: String
    var sunSet :String
    
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 25){
            VStack(spacing:10){
            Text("바람")
                    .fontWeight(.light)
                    .font(.headline)
                    .opacity(0.8)
                Text("\(wind) km/h")
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
        VStack(spacing:10){
            Text("체감온도")
                .fontWeight(.light)
                .font(.headline)
                .opacity(0.8)
            Text("\(feelLike)°")
                .font(.subheadline)
                .fontWeight(.semibold)
        }
        VStack(spacing:10){
            Text("습도")
                .fontWeight(.light)
                .font(.headline)
                .opacity(0.8)
            Text("\(humidity)%")
                .font(.subheadline)
                .fontWeight(.semibold)
        }
        VStack(spacing:10){
            Text("일출&일몰")
                .fontWeight(.light)
                .font(.headline)
                .opacity(0.8)
            VStack{
                
            Text("\(sunRise)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
            Text("\(sunSet)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            
        }
        }
    }
}

struct TodayDetailWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        TodayDetailWeatherView(wind: 5, humidity: 5, feelLike: 5, sunRise: "7:00", sunSet: "8:00")
    }
}
