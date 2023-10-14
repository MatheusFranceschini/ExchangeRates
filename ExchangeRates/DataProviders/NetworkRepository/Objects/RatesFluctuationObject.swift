//
//  RatesFluctuationObject.swift
//  ExchangeRates
//
//  Created by Matheus Franceschini on 14/10/23.
//

import Foundation

typealias RatesFluctuationObject = [String: FluctuationObject]

struct FluctuationObject: Codable {
    
    let change: Double
    let changePct: Double
    let endRate: Double

    enum CodingKeys: String, CodingKey {
        case change
        case endRate = "end_rate"
        case changePct = "change_pct"
    }
}
