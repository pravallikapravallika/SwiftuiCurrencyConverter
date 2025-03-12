//
//  ExchangeRate.swift
//  SwiftUIProject
//
//  Created by pravallika on 07/03/25.
//
import SwiftUI
struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var topCurreny:Currency
    @Binding var bottomCurrency:Currency
    var body: some View {
        ZStack{
            //Background image
            Image(.paperbackground)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack{
                //Text
                Text("Select the currency you are staring with:\(Currency.silverPenny.rawValue)")
                    .fontWeight(.bold).padding(.top)
                //CurrencyIcons
                IconGrid(currency:$topCurreny)
                Text("Select the currency you would like to convert to:").fontWeight(.bold)
                //Currency Icons
                IconGrid(currency:$bottomCurrency)
                //Done buttons
                Button("Done"){
                    dismiss()
                }.buttonStyle(.borderedProminent)
                    .tint(.brown.mix(with: .black, by: 0.2))
                    .font(.largeTitle).padding().foregroundStyle(.white)
            }    .multilineTextAlignment(.center).padding().foregroundStyle(.black)
        }
    }
}

#Preview {
    @Previewable @State var topCurrency :Currency = .silverPenny
    @Previewable @State var botttomCurrency :Currency = .goldPenny

    SelectCurrency(topCurreny: $topCurrency, bottomCurrency: $botttomCurrency)
}
