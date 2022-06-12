import SwiftUI

struct ClothesBtnView: View {
    
    var temp : Int
    var items : [ClothesResponse]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("날씨별 옷 추천")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(.leading, 15)
            ScrollView(.horizontal,showsIndicators: false){
                HStack(alignment: .top){
                    ForEach(items, id: \.self){ item in
                        ClothesBtnItem(item: item)
                    }
                }
            }
            .padding(15)
            
        }
    }
}

struct ClothesBtnView_Previews: PreviewProvider {
    static var previews: some View {
        ClothesBtnView(temp: 27, items:[ ClothesResponse(name: "qkss", icon: "Tshirt", url: "sfdsf", level: ["Hot"])])
    }
}
