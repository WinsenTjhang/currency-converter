//
//  LocaleExtensions.swift
//  CurrencyConverter
//
//  Created by winsen on 22/03/24.
//

import Foundation

extension Locale {
    static func locale(from currencyIdentifier: String) -> Locale? {
        let allLocales = Locale.availableIdentifiers.map({ Locale.init(identifier: $0) })
        return allLocales.filter({ $0.currency?.identifier == currencyIdentifier }).first
    }
}
