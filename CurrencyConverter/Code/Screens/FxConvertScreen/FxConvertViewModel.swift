//
//  ConvertDetailViewModel.swift
//  CurrencyConverter
//
//  Created by winsen on 22/03/24.
//

import Combine
import SwiftUI

@Observable
class FxConvertViewModel {
    private var cancellables: Set<AnyCancellable> = []
    var selectedType: ConversionType = .toAUD
    var currency: Currency = .sampleCurrency
    
    var currencyCodeForResultView: String {
        ConversionManager.shared.getCurrencyCodeForResultView(currency: currency, selectedType: selectedType)
    }
    
    var currencyCodeForInputView: String {
        ConversionManager.shared.getCurrencyCodeForResultView(currency: currency, selectedType: selectedType)
    }
    
    func convertCurrency(amount: String) -> Double {
        return ConversionManager.shared.convertCurrency(currency: currency, amount: amount, selectedType: selectedType)
    }
    
    func setCurrency(_ currency: Currency) {
        self.currency = currency
    }
    
}
