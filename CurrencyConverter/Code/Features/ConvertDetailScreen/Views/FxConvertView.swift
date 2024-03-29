//
//  FxConvertView.swift
//  CurrencyConverter
//
//  Created by winsen on 22/03/24.
//

import SwiftUI

struct FxConvertView: View {
    @EnvironmentObject var themeManager: ThemeManager
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
            .foregroundStyle(themeManager.selectedTheme.fxConvertTextColor)
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
            if themeManager.selectedTheme == .light {
                RoundedRectangle(cornerRadius: 10)
                    .fill(themeManager.selectedTheme.backgroundColor)
                    .shadow(color: Color.gray.opacity(0.4), radius: 10, x: 3, y: 3)
            } else {
                RoundedRectangle(cornerRadius: 10)
                    .fill(themeManager.selectedTheme.backgroundColor)
                    .stroke(Color.blue, lineWidth: 2)
            }
        }
        
        Spacer()
    }
    
}


