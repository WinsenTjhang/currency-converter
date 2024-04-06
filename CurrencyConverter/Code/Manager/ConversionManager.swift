//
//  ConversionManager.swift
//  CurrencyConverter
//
//  Created by winsen on 05/04/24.
//

import Foundation

class ConversionManager: ObservableObject {
    @Published var selectedType: Convert = .toAUD
    @Published var currency: Currency = .sampleCurrency
    
    enum Convert {
        case fromAUD
        case toAUD
    }
    
    func setCurrency(_ currency: Currency) {
        self.currency = currency
        print(self.currency)
    }
    
    func getCurrencyCodeForTo() -> String {
        switch selectedType {
        case .fromAUD: return "\(currency.currencyCode) \(Locale.locale(from: currency.currencyCode)?.currencySymbol ?? currency.currencyCode) "
        case .toAUD: return "AUD $"
        }
    }
    
    func getCurrencyCodeForFrom() -> String {
        switch selectedType {
        case .toAUD: return "\(currency.currencyCode) \(Locale.locale(from: currency.currencyCode)?.currencySymbol ?? currency.currencyCode) "
        case .fromAUD: return "AUD $"
        }
    }
    
    func convertCurrency(currency: Currency, amount: String) -> Double {
        switch selectedType {
        case .toAUD: return ((Double(amount) ?? 0) / (Double(currency.buyTT) ?? 0))
        case .fromAUD: return ((Double(amount) ?? 0) * (Double(currency.buyTT) ?? 0))
        }
        
    }
    
}
