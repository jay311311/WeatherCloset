//
//  ClothesBtnItem.swift
//  WeatherCloset
//
//  Created by Jooeun Kim on 2022/05/25.
//

import SwiftUI

struct ClothesBtnItem: View {
    var item : ClothesResponse
    @State var showModal = false
    
    var body: some View {
        VStack(alignment: .center){
            Button(action: { self.showModal = true}) {
                Image("\(item.icon)")
                    .resizable()
                    .frame(width:40, height: 40, alignment: .center)
                    .background(
                        Circle()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60, alignment: .center)
                        .foregroundColor(.white)
                    )
                    .padding(10)
                
            }
            .sheet(isPresented: self.$showModal) {
                ModalView()
            }
            Text("\(item.name)")
                .font(.subheadline)
                .padding(.horizontal ,10)
        }
        
    }
}

struct ClothesBtnItem_Previews: PreviewProvider {
    var item : ClothesResponse
    static var previews: some View {
        ClothesBtnItem(item: ClothesResponse(name: "123", icon: "shorts", url: "tdf", level: ["Hot"]))
    }
}
