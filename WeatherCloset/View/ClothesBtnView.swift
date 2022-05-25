//
//  SwiftUIView.swift
//  WeatherCloset
//
//  Created by Jooeun Kim on 2022/05/25.
//

import SwiftUI



struct ClothesBtnView: View {
    
    var temp : Int
  var items : [ClothesResponse]

    var body: some View {
        VStack(alignment: .leading) {
            Text("날씨별 옷 추천")
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top , 5)
            ScrollView(.horizontal,showsIndicators: false){
              HStack(alignment: .top, spacing: 0){
                ForEach(items, id: \.self){ item in
                    
                        ClothesBtnItem(item: item)
                    
                    //Text(landmark.name)
                }
            }
          }.frame( height: 185)
        }
    }
}

//struct ClothesBtnView_Previews: PreviewProvider {
//    static var previews: some View {
//        ClothesBtnView(temp: "27", items: ClothesResponse(name: "qkss", icon: "vdfs", url: "sfdsf"))
//    }
//}
