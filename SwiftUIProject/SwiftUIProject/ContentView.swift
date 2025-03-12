//
//  ContentView.swift
//  SwiftUIProject
//
//  Created by pravallika on 06/03/25.
//

import SwiftUI

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showSelectedCurrency = false
    @State var leftAmount = ""
    @State var rightAmount = ""
    @State var leftCurrency : Currency = .silverPenny
    @State var rightCurrency : Currency = .copperPenny
    @FocusState var leftTyping
    @FocusState var rightTyping
    
//case copperPenny = 6400
//case silverPenny  = 64
//case silverPiece = 16
//case goldPenny = 4
//case goldPiece = 1
    var body: some View {
        ZStack{
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            VStack{
                //prancing pony image
                Image(.dog).resizable().scaledToFit().frame(height: 200)
                Text("Currency Exchange").font(.largeTitle).foregroundStyle(.white)
                //currency exchange text
                //conversion section
                HStack{
                    //left conversion section
                    VStack{
                        //currecny
                        HStack{
                            Image(leftCurrency.image).resizable().scaledToFit().frame( height: 33)
                            Text(leftCurrency.name).font(.headline).foregroundStyle(.white)
                            //currency image
                            //currency text
                        }
                        .padding(.bottom,-5).onTapGesture {
                            showSelectedCurrency.toggle()
                        }
                        TextField("Amount",text: $leftAmount).textFieldStyle(.roundedBorder).multilineTextAlignment(.leading).keyboardType(.numberPad)
                            .focused($leftTyping)
                            .onChange(of: leftAmount) { value in
                                if(leftTyping == true)
                                {
                                 rightAmount = leftCurrency.convert(amountString: leftAmount, currency: rightCurrency)
                                }
                                
                            }
                        //                        Text("TextField").font(.headline).foregroundStyle(.white)
                        
                    }
                    Image(systemName: "equal").foregroundStyle(.white).font(.largeTitle).symbolEffect(.pulse)
                    //equal sign
                    //right conversion section
                    VStack{
                        //currecny
                        HStack{
                            //currency image
                            Text(rightCurrency.name).font(.headline).foregroundStyle(.white)
                            Image(rightCurrency.image).resizable().scaledToFit().frame( height: 33)
                            //currency text
                            
                        } .padding(.bottom,-5)
                            .onTapGesture {
                                print(showSelectedCurrency)
                                showSelectedCurrency.toggle()
                            }
                        TextField("Amount",text: $rightAmount).textFieldStyle(.roundedBorder).multilineTextAlignment(.trailing).keyboardType(.numberPad)
                            .focused($rightTyping)
                            .onChange(of: rightAmount) { value in
                                if(rightTyping == true)
                                {
                                    
                                    leftAmount = rightCurrency.convert(amountString: rightAmount, currency: leftCurrency)
                                }
                              
                            
                        }
                        //
                        
                        //                        Text("TextField").font(.headline).foregroundStyle(.white)
                    }
                }.padding().background(.black.opacity(0.5)).clipShape(.capsule)
                Spacer()
                //Info button
                HStack {
                    Spacer()
                    Button{
                        self.showExchangeInfo.toggle()
                        print(self.showExchangeInfo)
                    }label: {
                        Image(systemName: "info.circle.fill").foregroundStyle(.white).font(.largeTitle)
                    }
                    .padding(.trailing)
                    .sheet(isPresented:$showExchangeInfo){
                        ExchangeInfo()
                    }
                    .sheet(isPresented:$showSelectedCurrency){
                        SelectCurrency(topCurreny: $leftCurrency, bottomCurrency: $rightCurrency)
                    }
                }
            }
            //.border(.blue)
        }.onTapGesture {
            UIApplication.shared.endEditing(true)
        }
    }
}

#Preview {
    ContentView()
}
extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows.first?.endEditing(force)
    }
}
