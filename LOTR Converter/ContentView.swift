//
//  ContentView.swift
//  LOTR Converter
//
//  Created by Krishnanunni K A on 20/06/26.
//

import SwiftUI

struct ContentView: View {
    
    @State var showExchangeInfo = false
    @State var r_Amount = ""
   
    @State var l_Amount = ""
    
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
                            Image(.silverpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            Text("Silver Piece")
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            
                        }
                        
                        TextField("Amount", text: $l_Amount)
                            .textFieldStyle(.roundedBorder)
                            .padding([.bottom,.leading])
                    }
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    VStack{
                        HStack{
                            Image(.goldpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            Text("Gold Piece")
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            
                            
                        }
                        
                        TextField("Amount", text: $r_Amount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .padding([.bottom,.trailing])
                            
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
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
        .sheet(isPresented: $showExchangeInfo) {
            ExchangeInfo()
        }
    }
}

#Preview {
    ContentView()
}
