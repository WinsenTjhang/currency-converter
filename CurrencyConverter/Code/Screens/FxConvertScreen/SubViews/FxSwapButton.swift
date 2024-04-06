//
//  FxSwapButton.swift
//  CurrencyConverter
//
//  Created by winsen on 05/04/24.
//

import SwiftUI

struct FxSwapButton: View {
    @Binding var selectedType: ConversionType
    
    var body: some View {
        Button {
            switch selectedType {
            case .fromAUD:
                selectedType = .toAUD
            case .toAUD:
                selectedType = .fromAUD
            }
            print(selectedType)
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

//#Preview {
//    FxSwapButton(ses)
//}
