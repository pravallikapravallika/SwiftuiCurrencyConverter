//
//  CurrencyIcon.swift
//  SwiftUIProject
//
//  Created by pravallika on 07/03/25.
//
import SwiftUI
struct CurrencyIcon: View {
    
    let currencyImage : ImageResource
    let currencyName : String
    var body: some View {
        ZStack{
            VStack{
                //CurrencyIcons
                ZStack(alignment:.bottom){
                    //currency Image
                    Image(currencyImage).resizable().scaledToFit()
                    //Current Name
                    Text(currencyName).padding(3).font(.caption).frame(width: .infinity).background(.brown.opacity(0.75))
                }.padding(3).frame(width:100,height: 100)
                    .background(.brown)
                    .clipShape(.rect(cornerRadius: 25))
            }
        }
    }
}
#Preview {
    CurrencyIcon(currencyImage: .gold, currencyName: "Gold Piece")
}
