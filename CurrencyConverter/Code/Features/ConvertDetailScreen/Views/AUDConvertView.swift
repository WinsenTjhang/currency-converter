//
//  SwiftUIView.swift
//  CurrencyConverter
//
//  Created by winsen on 22/03/24.
//

import SwiftUI

struct AUDConvertView: View {
    @EnvironmentObject var themeManager: ThemeManager
    @Binding var topAmount: Double
    @Binding var bottomAmount: Double
    var viewModel: ConvertDetailViewModel
    let currency: Currency
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("AUD")
                Spacer()
                Text("Dollars")
            }
            .bold()
            .padding(.horizontal)
            
            HStack {
                Text("$")
                    .font(.system(size: 20))
                TextField("Amount", value: $topAmount, format: .number)
                    .keyboardType(.phonePad)
                    .font(.system(size: 40, weight: .light))
                    .onChange(of: topAmount) {
                        bottomAmount = viewModel.convertCurrency(currency: currency ,amount: topAmount, fromTop: true)
                    }
            }
            .foregroundStyle(themeManager.selectedTheme.fxConvertTextColor)
            .padding()
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
        .padding(.vertical)
    }
}
