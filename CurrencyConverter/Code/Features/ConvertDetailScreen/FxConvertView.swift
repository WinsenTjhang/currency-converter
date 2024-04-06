//
//  RateDetailView.swift
//  wpc-currency-converter
//
//  Created by winsen on 15/03/24.
//

import SwiftUI

struct FxConvertView: View {
    @EnvironmentObject var themeManager: ThemeManager
    @EnvironmentObject var conversionManager: ConversionManager
    var viewModel = ConvertDetailViewModel()
    var currency: Currency
    @State var amount: String = ""
    @FocusState var isTextFieldFocused: Bool
    
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
                ConvertToView(amount: $amount ,viewModel: viewModel, currency: currency)
                    .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 3, y: 3)
                
                Spacer()
                
                FxSwapButton()
                
                Spacer()
                
                ConvertFromView(isTextFieldFocused: _isTextFieldFocused, amount: $amount ,viewModel: viewModel, currency: currency)
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
        .onAppear() {
            conversionManager.setCurrency(currency)
            print("set")
        }
    }
    
}

#Preview {
    FxConvertView(currency: .sampleCurrency)
}
