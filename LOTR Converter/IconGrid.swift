//
//  IconGrid.swift
//  LOTR Converter
//
//  Created by Krishnanunni K A on 30/06/26.
//


import SwiftUI

struct IconGrid: View {
    @Binding var selectedCurrency:Currency
    var body: some View {
        
        LazyVGrid(columns: [GridItem(),GridItem(),GridItem()]) {
            ForEach(Currency.allCases) { currency in
                
                if self.selectedCurrency == currency{
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                        .shadow(color: .black, radius: 10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(lineWidth: 3)
                                .opacity(0.5)
                        }
                }else{
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                        .onTapGesture {
                            self.selectedCurrency = currency
                        }
                }
            }
        }
    }
}
#Preview {
    @Previewable @State var selectedCurrency:Currency = .copperPenny
    IconGrid(selectedCurrency: $selectedCurrency)
}
