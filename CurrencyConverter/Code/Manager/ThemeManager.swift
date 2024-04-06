//
//  Theme.swift
//  CurrencyConverter
//
//  Created by winsen on 23/03/24.
//

import SwiftUI

class ThemeManager: ObservableObject {
    @Published var selectedTheme: Theme = .light
    
    enum Theme: String, CaseIterable, Identifiable {
        case light
        case dark

        var id: String { self.rawValue }
        
        var scheme: ColorScheme? {
            switch self {
            case .light: return ColorScheme(.light)
            case .dark: return ColorScheme(.dark)
            }
        }
        
        var symbol: Image {
            switch self {
            case .light: return Image(systemName: "sun.max")
            case .dark: return Image(systemName: "moon")
            }
        }

        var backgroundColor: Color {
            switch self {
            case .light: return Color("backgroundLight")
            case .dark: return Color("backgroundDark")
            }
        }

        var fxConvertTextColor: Color {
            switch self {
            case .light: return .blue
            case .dark: return .white
            }
        }

        var font: Font {
            switch self {
            case .light: return .system(size: 20)
            case .dark: return .custom("RobotoCondensed-Regular", size: 20)
            }
        }

        var imageName: String {
            switch self {
            case .light: return "sun"
            case .dark: return "moon"
            }
        }
    }
    
}


