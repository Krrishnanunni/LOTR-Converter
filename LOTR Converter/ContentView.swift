//
//  ContentView.swift
//  LOTR Converter
//
//  Created by Krishnanunni K A on 20/06/26.
//

import SwiftUI
import TipKit

struct ContentView: View {
    
    @State var showExchangeInfo = false
    @State var showCurrencySelection = false
    
    @State var r_Amount = ""
    @State var l_Amount = ""
    
    @FocusState var isLeftFocused
    @FocusState var isRightFocused
    
    @State var leftCurrency:Currency = .copperPenny
    @State var rightCurrency:Currency = .goldPiece
    
    var currencyTip = CurrencyTip()
    
    var body: some View {
        ZStack{
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                HStack{
                    VStack{
                        HStack{
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            
                        }
                        .onTapGesture {
                            showCurrencySelection.toggle()
                            CurrencyTip().invalidate(reason: .actionPerformed)
                        }
                        .popoverTip(CurrencyTip(), arrowEdge: .bottom)
                        
                        TextField("Amount", text: $l_Amount)
                            .textFieldStyle(.roundedBorder)
                            .focused($isLeftFocused)
                            .padding([.bottom,.leading])
                            
                    }
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    VStack{
                        HStack{
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            
                            
                        }
                        .onTapGesture {
                            showCurrencySelection.toggle()
                            CurrencyTip().invalidate(reason: .actionPerformed)
                        }
                        
                        TextField("Amount", text: $r_Amount)
                            .textFieldStyle(.roundedBorder)
                            .focused($isRightFocused)
                            .multilineTextAlignment(.trailing)
                            .padding([.bottom,.trailing])
                            
                            
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .keyboardType(.decimalPad)
                .clipShape(.capsule)
                
                
                Spacer()
                
                HStack {
                    Spacer()
                    Button {
                        showExchangeInfo.toggle()
                        print("INfo : \(showExchangeInfo)")
                    }label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }.padding(.trailing)
                }
            }
            
            
            
        }
        .task {
            try? Tips.configure()
        }
        .onChange(of: l_Amount) {
            if isLeftFocused{
                r_Amount = leftCurrency.convert(l_Amount, to: rightCurrency)
            }
        }
        .onChange(of: r_Amount) {
            if isRightFocused{
                l_Amount = rightCurrency.convert(r_Amount, to: leftCurrency)
            }
        }
        
        .onChange(of: leftCurrency, {
            r_Amount = leftCurrency.convert(l_Amount, to: rightCurrency)
        })
        .onChange(of: rightCurrency, {
            l_Amount = rightCurrency.convert(r_Amount, to: leftCurrency)
        })
        
        .sheet(isPresented: $showExchangeInfo) {
            ExchangeInfo()
        }
        .sheet(isPresented: $showCurrencySelection) {
            SelectionView(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
        }
    }
}

#Preview {
    ContentView()
}
