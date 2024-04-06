//
//  ConvertViewModel.swift
//  wpc-currency-converter
//
//  Created by winsen on 10/03/24.
//

import Foundation

@Observable
final class MainViewModel {
    let networkManager = NetworkManager()
    var isFetchingData = true
    var currencies: [Currency] = []
    
    func fetchData() async throws {
        let data = try await networkManager.getData()
        self.currencies = data.list.sorted { $0.currencyCode < $1.currencyCode }
        isFetchingData = false
    }
    
}
