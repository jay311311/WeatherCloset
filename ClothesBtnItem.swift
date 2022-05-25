//
//  ClothesBtnItem.swift
//  
//
//  Created by Jooeun Kim on 2022/05/25.
//

import SwiftUI

struct ClothesBtnItem: View {
    
    var clothes :ClothesResponse
    var body: some View {
        VStack(alignment: .leading){
            clothes.icon
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(clothes.name)
                .font(.caption)
                .foregroundColor(.primary)
        }
        .padding(.leading, 5)
    }
}

struct ClothesBtnItem_Previews: PreviewProvider {
    static var previews: some View {
        ClothesBtnItem()
    }
}
