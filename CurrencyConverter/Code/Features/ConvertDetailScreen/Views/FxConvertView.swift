//
//  FxConvertView.swift
//  CurrencyConverter
//
//  Created by winsen on 22/03/24.
//

import SwiftUI

struct FxConvertView: View {
    @Binding var topAmount: Double
    @Binding var bottomAmount: Double
    var viewModel: ConvertDetailViewModel
    let currency: Currency
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(Locale.locale(from: currency.currencyCode)?.currencySymbol ?? currency.currencyCode)
                    .font(.system(size: 20))
                TextField("Amount", value: $bottomAmount, format: .number)
                    .keyboardType(.phonePad)
                    .font(.system(size: 40, weight: .light))
                    .onChange(of: bottomAmount) {
                        topAmount = viewModel.convertCurrency(currency: currency ,amount: bottomAmount, fromTop: false)
                    }
            }
            .foregroundStyle(.blue)
            .padding()
            
            HStack {
                Text(currency.currencyCode)
                Spacer()
                Text(currency.currencyName)
            }
            .bold()
            .padding(.horizontal)
        }
        .padding()
        .background{
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(color: Color.gray.opacity(0.4), radius: 10, x: 3, y: 3)
        }
        
        Spacer()
    }
    
}


