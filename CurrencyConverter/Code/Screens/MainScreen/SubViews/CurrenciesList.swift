//
//  CurrenciesList.swift
//  CurrencyConverter
//
//  Created by winsen on 23/03/24.
//

import SwiftUI

struct CurrenciesList: View {
    @EnvironmentObject var themeManager: ThemeManager
    let currencies: [Currency]
    
    var body: some View {
        List {
            Section {
                ForEach(currencies, id: \.self) { currency in
                    if currency.buyTT != "N/A" {
                        NavigationLink(destination: FxConvertView(currency: currency)) {
                            Text(currency.currencyCode + " - " + currency.country + " " + currency.currencyName)
                                .font(themeManager.selectedTheme.font)
                        }
                    }
                }
            } header: {
                Text("Convert from:")
                    .font(.system(size: 15))
            }
            
            Section {
                ForEach(currencies, id: \.self) { currency in
                    if currency.buyTT == "N/A" {
                        NavigationLink(destination: FxConvertView(currency: currency)) {
                            Text(currency.currencyCode + " - " + currency.country + " " + currency.currencyName)
                                .font(themeManager.selectedTheme.font)
                        }
                    }
                }
            } header: {
                Text("Not available:")
                    .font(.system(size: 15))
            }
            
        }
        .listStyle(.automatic)
    }
}

//#Preview {
//    CurrenciesList(viewModel: MainViewModel())
//}
