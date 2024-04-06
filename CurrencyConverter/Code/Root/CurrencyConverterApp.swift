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
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(themeManager)
        }
    }
}
