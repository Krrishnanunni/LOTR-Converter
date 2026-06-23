//
//  ExchangeInfo.swift
//  LOTR Converter
//
//  Created by Krishnanunni K A on 22/06/26.
//

import SwiftUI

struct ExchangeInfo: View {
    
    @Environment(\.dismiss) var dismissSheet
    
    var body: some View {
        ZStack {
            
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack{
                Text("Exchange Rate")
                    .font(.largeTitle)
                    .tracking(3)
                
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title3)
                    .padding()
                
                ExchangeRateSubView(rightImage: .goldpiece, text:"1 Gold Piece = 4 Gold Pennies", leftImage: .goldpenny)
                ExchangeRateSubView(rightImage: .goldpenny, text:"1 Gold Penny = 4 Silver Piece", leftImage: .silverpiece)
                ExchangeRateSubView(rightImage: .silverpiece, text:"1 Silver Piece = 4 Silver Pennies", leftImage: .silverpiece)
                ExchangeRateSubView(rightImage: .silverpenny, text:"1 Silver Penny = 100 Copper Pennies", leftImage: .copperpenny)
                
                
                Button("Done"){
                    dismissSheet()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.largeTitle)
                .foregroundStyle(.white)
                .padding()
            }
            .foregroundStyle(.black)
        }
    }
}

#Preview {  
    ExchangeInfo()
}



