//
//  SelectionView 2.swift
//  LOTR Converter
//
//  Created by Krishnanunni K A on 23/06/26.
//

import SwiftUI

struct SelectionView: View {
    var intt:Int = 2
    @Environment(\.dismiss) var dismissSheet
    var body: some View {
        
        ZStack {
            
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack{
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                    .font(.title3)
                   
                LazyVGrid(columns: [GridItem(),GridItem(),GridItem()]) {
                    ForEach(Currency.allCases) { currency in
                        CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                    }
                }
                
                

                
                
                Text("Select the currency you want to convert to :")
                    .fontWeight(.bold)
                    .font(.title3)
                
                
                
                
                Button("Done"){
                    dismissSheet()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.largeTitle)
                .foregroundStyle(.white)
                .padding()
            }
            .padding()
            .multilineTextAlignment(.center)
            
        }
    }
}

#Preview {
    SelectionView()
}
