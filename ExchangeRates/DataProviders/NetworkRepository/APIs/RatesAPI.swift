//
//  RatesAPI.swift
//  ExchangeRates
//
//  Created by Matheus Franceschini on 14/10/23.
//

import Foundation
enum HttpMethod: String {
    case get = "GET"
}

struct RatesAPI {
    static let baseURL: String = "https://api.apilayer.com/exchangerates_data"
    static let apiKey: String = "ATQncB50lUnmSExoEjCJFxbIzpLvqjF7"
    static let fluctuation: String = "/fluctuation"
    static let symbols: String = "/symbols"
    static let timeseries: String = "/timeseries"
}
