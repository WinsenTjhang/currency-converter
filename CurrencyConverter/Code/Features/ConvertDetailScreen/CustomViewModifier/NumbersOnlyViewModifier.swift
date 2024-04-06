//
//  NumbersOnlyViewModifier.swift
//  CurrencyConverter
//
//  Created by winsen on 30/03/24.
//

import SwiftUI
import Combine

struct NumbersOnlyViewModifier: ViewModifier {
    
    @Binding var text: String
    
    func body(content: Content) -> some View {
        content
            .onReceive(Just(text)) { newValue in
                let numbers = "0123456789."
                let filtered = newValue.filter { numbers.contains($0)}
                if filtered != newValue {
                    self.text = filtered
                }
            }
    }
}

extension View {
    func numbersOnly(_ text: Binding<String>) -> some View {
        self.modifier(NumbersOnlyViewModifier(text: text))
    }
}
