//
//  ClothesBtnItem.swift
//  WeatherCloset
//
//  Created by Jooeun Kim on 2022/05/25.
//

import SwiftUI

struct ClothesBtnItem: View {
    var item : ClothesResponse

    var body: some View {
       
           Text("\(item.name)")
        
    }
}

struct ClothesBtnItem_Previews: PreviewProvider {
    static var previews: some View {
        ClothesBtnItem(item: ClothesViewModel().Hot[0])
    }
}
