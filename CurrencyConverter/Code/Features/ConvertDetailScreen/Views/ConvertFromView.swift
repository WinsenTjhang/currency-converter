//
//  FxConvertView.swift
//  CurrencyConverter
//
//  Created by winsen on 22/03/24.
//

import SwiftUI

struct ConvertFromView: View {
    @EnvironmentObject var themeManager: ThemeManager
    @EnvironmentObject var conversionManager: ConversionManager
    @FocusState var isTextFieldFocused: Bool
    @Binding var amount: String
    var viewModel: ConvertDetailViewModel
    let currency: Currency
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Text(conversionManager.getCurrencyCodeForFrom())
                Divider()
                    .frame(height: 40)
                    .background(.gray)
                TextField("", text: $amount)
                    .numbersOnly($amount)
                    .keyboardType(.decimalPad)
                    .focused($isTextFieldFocused)
                
            }
            .font(.system(size: 20, weight: .regular))
            .foregroundStyle(themeManager.selectedTheme.fxConvertTextColor)
            .padding()
            .background{
                if themeManager.selectedTheme == .light {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(themeManager.selectedTheme.backgroundColor)
                        .shadow(color: Color.gray.opacity(0.4), radius: 10, x: 3, y: 3)
                } else {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(themeManager.selectedTheme.backgroundColor)
                        .stroke(Color.blue, lineWidth: 2)
                }
            }
            
        }
        .padding()
        
        }
        
    }
    


