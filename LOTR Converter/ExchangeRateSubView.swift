//
//  ExchangeInfoView.swift
//  LOTR Converter
//
//  Created by Krishnanunni K A on 22/06/26.
//
import SwiftUI

struct ExchangeRateSubView: View {
    let rightImage:ImageResource
    let text:String
    let leftImage:ImageResource
    var body: some View {
        
        HStack{
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            Text(text)
            
            
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

#Preview {
    ExchangeRateSubView(rightImage: .goldpenny, text: "sdasd = asdasda", leftImage: .goldpiece)
}
