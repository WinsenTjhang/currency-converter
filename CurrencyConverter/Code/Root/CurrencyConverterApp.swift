//
//  CurrencyConverterApp.swift
//  CurrencyConverter
//
//  Created by winsen on 20/03/24.
//

import SwiftUI

@main
struct CurrencyConverterApp: App {
    @State var themeManager = ThemeManager()
    @State var conversionManager = ConversionManager()
    
    var body: some Scene {
        WindowGroup {
            MainScreen()
                .environmentObject(themeManager)
                .environmentObject(conversionManager)
        }
    }
}
