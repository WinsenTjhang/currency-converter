//
//  Error.swift
//  wpc-currency-converter
//
//  Created by winsen on 09/03/24.
//

import Foundation


enum NetworkError: Error {
    case unableToComplete
    case invalidResponse(statusCode: Int)
    case invalidData
}
