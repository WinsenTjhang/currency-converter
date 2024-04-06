//
//  ContentView.swift
//  wpc-currency-converter
//
//  Created by winsen on 09/03/24.
//

import SwiftUI

struct MainScreen: View {
    @EnvironmentObject var themeManager: ThemeManager
    @State var viewModel = MainViewModel()
    @State private var amount: Double = 0
    @State private var showAlert = false
    
    var body: some View {
        NavigationStack {
            if viewModel.isFetchingData {
                ProgressView()
            } else {
                VStack {
                    Text("AUD Convert")
                        .font(.system(size: 30))
                        .foregroundStyle(.blue)
                        .bold()
                        .padding()
                    
                    CurrenciesList(currencies: viewModel.currencies)
                        .font(.system(size: 20))
                        .toolbar {
                            ToolbarItem {
                                ThemeSwitcher()
                            }
                        }
                }
                .preferredColorScheme(themeManager.selectedTheme.scheme)
            }
            
        }
        .onAppear() {
            Task {
                do {
                    try await viewModel.fetchData()
                } catch {
                    print(error)
                    showAlert = true
                }
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



