//
//  RateDetailView.swift
//  wpc-currency-converter
//
//  Created by winsen on 15/03/24.
//

import SwiftUI

struct ConvertDetailView: View {
    @EnvironmentObject var themeManager: ThemeManager
    var viewModel = ConvertDetailViewModel()
    var currency: Currency
    @State var topAmount: String = ""
    @State var bottomAmount: String = ""
    @FocusState var isTextFieldFocused: Bool
    
    var body: some View {
        VStack {
            Text("\(currency.currencyCode) to AUD")
                .font(.title)
            
            Spacer()
            
            if currency.buyTT != "N/A" {
                AUDConvertView(topAmount: $topAmount, bottomAmount: $bottomAmount ,viewModel: viewModel, currency: currency)
                Spacer()
                FxConvertView(isTextFieldFocused: _isTextFieldFocused, topAmount: $topAmount, bottomAmount: $bottomAmount ,viewModel: viewModel, currency: currency)
            }
            
            VStack(alignment: .leading) {
                Text("Country: \(currency.currencyCode)")
                Text("Country: \(currency.currencyName)")
                Text("Country: \(currency.country)")
                Text("Buy Rate: \(currency.buyTT)")
                Text("Sell Rate: \(currency.sellTT)")
                Text("Buy TC: \(currency.buyTC)")
                Text("Buy Notes: \(currency.buyNotes)")
                Text("Sell Notes: \(currency.sellNotes)")
                Text("Spot Rate Date: \(currency.spotRateDate, formatter: DateFormatter.displayDate)")
                Text("Effective Date: \(currency.effectiveDate, formatter: DateFormatter.displayDate)")
                Text("Update Date: \(currency.updateDate, formatter: DateFormatter.displayDate)")
                Text("Last Updated: \(currency.lastUpdated, formatter: DateFormatter.displayDate)")
            }
            .padding()
            .font(.system(size: 15))
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
    ConvertDetailView(currency: .sampleCurrency)
}
