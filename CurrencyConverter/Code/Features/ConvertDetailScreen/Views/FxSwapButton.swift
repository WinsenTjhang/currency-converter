//
//  FxSwapButton.swift
//  CurrencyConverter
//
//  Created by winsen on 05/04/24.
//

import SwiftUI

struct FxSwapButton: View {
    @EnvironmentObject var conversionManager: ConversionManager
    
    var body: some View {
        Button {
            switch conversionManager.selectedType {
            case .fromAUD:
                conversionManager.selectedType = .toAUD
            case .toAUD:
                conversionManager.selectedType = .fromAUD
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
