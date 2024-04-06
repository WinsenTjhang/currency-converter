//
//  CurrencyDetailView.swift
//  CurrencyConverter
//
//  Created by winsen on 05/04/24.
//

import SwiftUI

struct CurrencyDetailView: View {
    @EnvironmentObject var themeManager: ThemeManager
    var currency: Currency
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Currency Name: \(currency.currencyName)")
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
    }
}

#Preview {
    CurrencyDetailView(currency: .sampleCurrency)
}
