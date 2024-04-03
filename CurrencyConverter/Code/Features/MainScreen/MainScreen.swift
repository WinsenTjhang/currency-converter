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
    
    @EnvironmentObject var themeManager: ThemeManager
    
    var body: some View {
        NavigationStack {
            if viewModel.isFetchingData {
                ProgressView()
            } else {
                VStack {
                    Text("AUD Convert")
                        .font(.custom(themeManager.selectedTheme.font, size: 30))
                        .bold()
                    
                    CurrenciesList(viewModel: viewModel)
                        .font(.custom(themeManager.selectedTheme.font, size: 20))
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



