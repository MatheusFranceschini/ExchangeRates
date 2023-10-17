//
//  CurrencySymbolModel.swift
//  ExchangeRates
//
//  Created by Matheus Franceschini on 16/10/23.
//

import Foundation

struct CurrencySymbolModel: Identifiable {
    let id = UUID()
    var symbol: String
    var fullName: String
}
