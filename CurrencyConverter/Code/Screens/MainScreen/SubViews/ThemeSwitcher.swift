//
//  ThemeSwitcher.swift
//  CurrencyConverter
//
//  Created by winsen on 23/03/24.
//

import SwiftUI

struct ThemeSwitcher: View {
    @EnvironmentObject var themeManager: ThemeManager
    
    var body: some View {
        Picker("Theme", selection: $themeManager.selectedTheme) {
            ForEach(ThemeManager.Theme.allCases) { theme in
                theme.symbol
                    .tag(theme)
            }
        }
        .pickerStyle(.segmented)
        .padding()
    }
}

#Preview {
    ThemeSwitcher()
}
