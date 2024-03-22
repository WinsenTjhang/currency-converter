//
//  ContentView.swift
//  wpc-currency-converter
//
//  Created by winsen on 09/03/24.
//

import SwiftUI

struct MainScreen: View {
    @State var viewModel = MainViewModel()
    @State private var amount: Double = 0
    @State private var selectedIndex = 15
    @State private var showAlert = false
    
    var body: some View {
        NavigationStack {
            if viewModel.isFetchingData {
                ProgressView()
            } else {
                Text("AUD Convert")
                    .font(.title2)
                
                List {
                    Section {
                        ForEach(viewModel.currencies, id: \.self) { currency in
                            if currency.buyTT != "N/A" {
                                NavigationLink(destination: ConvertDetailView(currency: currency)) {
                                    Text(currency.currencyCode + " - " + currency.country + " " + currency.currencyName)
                                }
                            }
                        }
                    } header: {
                        Text("Convert from:")
                            .foregroundStyle(.black)
                    }
                    
                    Spacer()
                    
                    Section {
                        ForEach(viewModel.currencies, id: \.self) { currency in
                            if currency.buyTT == "N/A" {
                                NavigationLink(destination: ConvertDetailView(currency: currency)) {
                                    Text(currency.currencyCode + " - " + currency.country + " " + currency.currencyName)
                                }
                            }
                        }
                    } header: {
                        Text("Not available:")
                            .foregroundStyle(.black)
                    }
                    
                }
                .listStyle(.plain)
                
                
            }
        }
        .onAppear() {
            Task {
                try await viewModel.fetchData()
            }
            
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Oopss"), message: Text("Something wrong with the application, please restart the app"), dismissButton: .default(Text("OK")))
        }
    
        
        
    }
}

#Preview {
    MainScreen()
}



