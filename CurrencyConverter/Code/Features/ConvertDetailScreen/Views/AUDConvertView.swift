//
//  SwiftUIView.swift
//  CurrencyConverter
//
//  Created by winsen on 22/03/24.
//

import SwiftUI

struct AUDConvertView: View {
    @EnvironmentObject var themeManager: ThemeManager
    @Binding var topAmount: String
    @Binding var bottomAmount: String
    var viewModel: ConvertDetailViewModel
    let currency: Currency
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Text("AUD")
                    .font(.system(size: 20))
                Text("$")
                    .font(.system(size: 20))
                Text(String(format: "%.2f", viewModel.convertCurrency(currency: currency, amount: bottomAmount)))
                Spacer()
            }
            .font(.system(size: 45, weight: .light))
            .foregroundStyle(themeManager.selectedTheme.fxConvertTextColor)
            .padding()
        }
        .padding()
        
    }
}
