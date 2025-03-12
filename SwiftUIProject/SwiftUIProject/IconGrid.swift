//
//  IconGrid.swift
//  SwiftUIProject
//
//  Created by pravallika on 07/03/25.
//
import SwiftUI
struct IconGrid: View {
    @Environment(\.dismiss) var dismiss
    @Binding var currency:Currency
    var body: some View {
        //CurrencyIcons
        LazyVGrid(columns:[GridItem(),GridItem(),GridItem()]){
            ForEach(Currency.allCases){currency in
                if self.currency == currency {
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name).shadow(color: .black, radius: 10).overlay {
                        RoundedRectangle(cornerRadius: 25).stroke(lineWidth:3).opacity(0.5)
                    }
                }else{
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                        .shadow(color: .black, radius: 10)
                        .onTapGesture {
                            self.currency = currency
                        }
                }
            }
        }
    }
}


#Preview {
    @Previewable @State var currency:Currency = .silverPenny
    IconGrid(currency: $currency)
}
