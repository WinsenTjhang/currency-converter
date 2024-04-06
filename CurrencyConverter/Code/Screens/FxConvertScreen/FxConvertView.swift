//
//  RateDetailView.swift
//  wpc-currency-converter
//
//  Created by winsen on 15/03/24.
//

import SwiftUI

struct FxConvertView: View {
    @EnvironmentObject var themeManager: ThemeManager
    @FocusState var isTextFieldFocused: Bool
    @State var amount: String = ""
    var viewModel = FxConvertViewModel()
    var currency: Currency
    
    var body: some View {
        VStack {
            HStack {
                Text("\(currency.currencyCode)")
                Image(systemName: "arrow.left.arrow.right")
                Text("AUD")
            }
            .font(.system(size: 17, weight: .regular, design: .monospaced))
            .foregroundStyle(.blue)
            
            Spacer()
            
            if currency.buyTT != "N/A" {
                FxConvertResult(amount: $amount ,viewModel: viewModel, currency: currency)
                Spacer()
                FxSwapButton()
                Spacer()
                FxConvertInput(isTextFieldFocused: _isTextFieldFocused, amount: $amount ,viewModel: viewModel, currency: currency)
            }
            
            CurrencyDetailView(currency: currency)
            
            Spacer()
        }
        .ignoresSafeArea(.keyboard)
        .padding(.horizontal, 30)
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                Spacer()
            }
            ToolbarItem(placement: .keyboard) {
                Button {
                    isTextFieldFocused = false
                } label: {
                    Image(systemName: "keyboard.chevron.compact.down")
                }
            }
        }

    }
    
}

#Preview {
    FxConvertView(currency: .sampleCurrency)
}
