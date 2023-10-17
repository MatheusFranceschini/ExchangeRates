//
//  RateHistoricalModel.swift
//  ExchangeRates
//
//  Created by Matheus Franceschini on 16/10/23.
//

import Foundation

struct RateHistoricalModel: Identifiable {
    let id = UUID()
    var symbol: String
    var period: Date
    var endRate: Double
}
