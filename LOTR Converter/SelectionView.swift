//
//  SelectionView 2.swift
//  LOTR Converter
//
//  Created by Krishnanunni K A on 23/06/26.
//

import SwiftUI

struct SelectionView: View {
    @Environment(\.dismiss) var dismissSheet
    @State var topCurrency:Currency
    @State var bottomCurrency:Currency
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
                   
                IconGrid(selectedCurrency:topCurrency )
                
                Text("Select the currency you want to convert to :")
                    .fontWeight(.bold)
                    .font(.title3)
                    .padding(.top)
                
                IconGrid(selectedCurrency:bottomCurrency )
                
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
            .foregroundStyle(.black)
            
        }
    }
}

#Preview {
    SelectionView(topCurrency: .copperPenny, bottomCurrency: .goldPiece)
}
