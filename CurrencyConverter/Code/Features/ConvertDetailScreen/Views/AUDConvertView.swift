//
//  SwiftUIView.swift
//  CurrencyConverter
//
//  Created by winsen on 22/03/24.
//

import SwiftUI

struct AUDConvertView: View {
    @Binding var topAmount: Double
    @Binding var bottomAmount: Double
    var viewModel: ConvertDetailViewModel
    let currency: Currency
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("AUD")
                Spacer()
                Text("Dollars")
            }
            .bold()
            .padding(.horizontal)
            
            HStack {
                Text("$")
                    .font(.system(size: 20))
                TextField("Amount", value: $topAmount, format: .number)
                    .keyboardType(.phonePad)
                    .font(.system(size: 40, weight: .light))
                    .onChange(of: topAmount) {
                        bottomAmount = viewModel.convertCurrency(currency: currency ,amount: topAmount, fromTop: true)
                    }
            }
            .foregroundStyle(.blue)
            .padding()
        }
        .padding()
        .background{
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(color: Color.gray.opacity(0.4), radius: 10, x: 3, y: 3)
        }
        .padding(.vertical)
    }
}
