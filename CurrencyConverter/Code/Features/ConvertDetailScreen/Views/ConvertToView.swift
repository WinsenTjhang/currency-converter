//
//  SwiftUIView.swift
//  CurrencyConverter
//
//  Created by winsen on 22/03/24.
//

import SwiftUI

struct ConvertToView: View {
    @EnvironmentObject var themeManager: ThemeManager
    @EnvironmentObject var conversionManager: ConversionManager
    @Binding var amount: String
    var viewModel: ConvertDetailViewModel
    let currency: Currency
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Text("\(conversionManager.getCurrencyCodeForTo())")
                    .font(.system(size: 20))
                Text(String(format: "%.2f", conversionManager.convertCurrency(currency: currency, amount: amount)))
                Spacer()
            }
            .font(.system(size: 45, weight: .light))
            .foregroundStyle(themeManager.selectedTheme.fxConvertTextColor)
            .padding()
        }
        .padding()
        
    }
}
