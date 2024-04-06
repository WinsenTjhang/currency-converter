//
//  ConvertDetailViewModel.swift
//  CurrencyConverter
//
//  Created by winsen on 22/03/24.
//

import Foundation

class ConvertDetailViewModel {
    
//    func convertCurrency(currency: Currency, amount: String, fromTop: Bool) -> String {
//
//        var conversionResult: Double
//        
//        if fromTop {
//            conversionResult = (Double(amount) ?? 0) * (Double(currency.buyTT) ?? 0)
//        } else {
//            conversionResult = (Double(amount) ?? 0) / (Double(currency.buyTT) ?? 0)
//        }
//        
//        return String(conversionResult.rounded())
        
//        if roundedResult.truncatingRemainder(dividingBy: 1) == 0 {
//            return String(Int(roundedResult))
//        } else {
//            return String(roundedResult)
//        }
//    }
    
    func convertCurrency(currency: Currency, amount: String) -> Double {
        return ((Double(amount) ?? 0) / (Double(currency.buyTT) ?? 0))
    }
    
}
