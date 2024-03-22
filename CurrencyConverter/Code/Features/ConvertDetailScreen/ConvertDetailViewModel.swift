//
//  ConvertDetailViewModel.swift
//  CurrencyConverter
//
//  Created by winsen on 22/03/24.
//

import Foundation

class ConvertDetailViewModel {
    
    func convertCurrency(currency: Currency, amount: Double, fromTop: Bool) -> Double {
        let conversionResult = fromTop ? amount * Double(currency.buyTT)! : amount / Double(currency.buyTT)!
        
        let roundedResult = (conversionResult * 100).rounded() / 100
            return roundedResult
    }
    
}
