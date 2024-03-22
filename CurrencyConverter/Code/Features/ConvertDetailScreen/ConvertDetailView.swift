//
//  RateDetailView.swift
//  wpc-currency-converter
//
//  Created by winsen on 15/03/24.
//

import SwiftUI

struct ConvertDetailView: View {
    var viewModel = ConvertDetailViewModel()
    var currency: Currency
    @State var topAmount: Double = 0.0
    @State var bottomAmount: Double = 0.0
    
    var body: some View {
        VStack {
            Text("\(currency.currencyCode) to AUD")
                .font(.title)
            
            Spacer()
            
            if currency.buyTT != "N/A" {
                AUDConvertView(topAmount: $topAmount, bottomAmount: $bottomAmount ,viewModel: viewModel, currency: currency)
                FxConvertView(topAmount: $topAmount, bottomAmount: $bottomAmount ,viewModel: viewModel, currency: currency)
            }
                
            VStack(alignment: .leading) {
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
            .frame(maxWidth: .infinity)
            
            Spacer()
        }
        .padding(.horizontal, 30)
    }
    
}

#Preview {
    ConvertDetailView(currency: .sampleCurrency)
}
