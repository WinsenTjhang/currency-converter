//
//  CurrenciesList.swift
//  CurrencyConverter
//
//  Created by winsen on 23/03/24.
//

import SwiftUI

struct CurrenciesList: View {
    @EnvironmentObject var themeManager: ThemeManager
    let viewModel: MainViewModel
    
    var body: some View {
        List {
            Section {
                ForEach(viewModel.currencies, id: \.self) { currency in
                    if currency.buyTT != "N/A" {
                        NavigationLink(destination: ConvertDetailView(currency: currency)) {
                            Text(currency.currencyCode + " - " + currency.country + " " + currency.currencyName)
                        }
                    }
                }
            } header: {
                Text("Convert from:")
            }
            
            Spacer()
            
            Section {
                ForEach(viewModel.currencies, id: \.self) { currency in
                    if currency.buyTT == "N/A" {
                        NavigationLink(destination: ConvertDetailView(currency: currency)) {
                            Text(currency.currencyCode + " - " + currency.country + " " + currency.currencyName)
                        }
                    }
                }
            } header: {
                Text("Not available:")
            }
            
        }
        .listStyle(.plain)
    }
}

#Preview {
    CurrenciesList(viewModel: MainViewModel())
}
