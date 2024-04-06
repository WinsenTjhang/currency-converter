//
//  FxSwapButton.swift
//  CurrencyConverter
//
//  Created by winsen on 05/04/24.
//

import SwiftUI

struct FxSwapButton: View {
    
    var body: some View {
        Button {
            switch ConversionManager.shared.selectedType {
            case .fromAUD:
                ConversionManager.shared.selectedType = .toAUD
            case .toAUD:
                ConversionManager.shared.selectedType = .fromAUD
            }
        } label: {
            Text("Swap")
            Image(systemName: "arrow.up.arrow.down")
        }
        .font(.system(size: 15))
        .foregroundColor(.white)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.blue)
                .shadow(color: Color.gray.opacity(0.5), radius: 10, x: 3, y: 3)
        )
    }
}

#Preview {
    FxSwapButton()
}
