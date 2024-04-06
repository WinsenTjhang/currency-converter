//
//  ConvertDetailViewModel.swift
//  CurrencyConverter
//
//  Created by winsen on 22/03/24.
//

import Foundation

class FxConvertViewModel {
    func convertCurrency(currency: Currency, amount: String) -> Double {
        let result = ConversionManager.shared.convertCurrency(currency: currency, amount: amount)
        return result
    }
    
    func getCurrencyCodeForTo(currency: Currency) -> String {
        return ConversionManager.shared.getCurrencyCodeForTo(currency: currency)
    }
    
    func getCurrencyCodeForFrom(currency: Currency) -> String {
        return ConversionManager.shared.getCurrencyCodeForFrom(currency: currency)
    }
    
}
