//
//  FxConvertView.swift
//  CurrencyConverter
//
//  Created by winsen on 22/03/24.
//

import SwiftUI

struct FxConvertView: View {
    @EnvironmentObject var themeManager: ThemeManager
    @FocusState var isTextFieldFocused: Bool
    @Binding var topAmount: String
    @Binding var bottomAmount: String
    var viewModel: ConvertDetailViewModel
    let currency: Currency
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Text(" \(Locale.locale(from: currency.currencyCode)?.currencySymbol ?? currency.currencyCode)")
                Divider()
                    .frame(height: 40)
                    .background(.gray)
                    .padding(.horizontal)
                TextField("", text: $bottomAmount)
                    .numbersOnly($bottomAmount)
                    .keyboardType(.decimalPad)
                    .focused($isTextFieldFocused)
                
            }
            .font(.system(size: 25, weight: .light))
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
    


