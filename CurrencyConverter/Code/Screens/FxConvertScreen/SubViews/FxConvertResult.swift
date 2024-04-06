//
//  SwiftUIView.swift
//  CurrencyConverter
//
//  Created by winsen on 22/03/24.
//

import SwiftUI

struct FxConvertResult: View {
    @EnvironmentObject var themeManager: ThemeManager
    @Binding var amount: String
    var viewModel: FxConvertViewModel
    let currency: Currency
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Text("\(viewModel.getCurrencyCodeForTo(currency: currency))")
                    .font(.system(size: 20))
                Text(String(format: "%.2f", viewModel.convertCurrency(currency: currency, amount: amount)))
                Spacer()
            }
            .font(.system(size: 45, weight: .light))
            .foregroundStyle(themeManager.selectedTheme.fxConvertTextColor)
            .padding()
        }
        .padding()
        .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 3, y: 3)
        
    }
}
