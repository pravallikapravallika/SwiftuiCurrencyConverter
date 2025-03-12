//
//  ExchangeRate.swift
//  SwiftUIProject
//
//  Created by pravallika on 07/03/25.
//
import SwiftUI
struct ExchangeRate: View {
    let leftImage : ImageResource
    let rightImage :ImageResource
    let text:String
    
    var body: some View {
        HStack{
            //left currency image
            Image(leftImage).resizable()
                .scaledToFit().frame(height: 33)
            Text(text)
            Image(rightImage).resizable()
                .scaledToFit().frame(height: 33)
            //exchange rate text
            //right currency image
        }
    }
}

#Preview {
    ExchangeRate(leftImage: .silver, rightImage: .silverpenny,text: "1 Silver piece = 4 silver pennies")
}
