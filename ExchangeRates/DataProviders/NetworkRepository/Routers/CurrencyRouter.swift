//
//  CurrencyRouter.swift
//  ExchangeRates
//
//  Created by Matheus Franceschini on 14/10/23.
//

import Foundation

enum CurrencyRouter {
    case symbols
    
    var path: String {
        switch self {
        case .symbols:
            return RatesAPI.symbols
        }
    }
    
    func asUrlRequest() throws -> URLRequest? {
        guard let url = URL(string: RatesAPI.baseURL) else { return nil }
        
        switch self {
        case .symbols:
            var request = URLRequest(url: url.appendingPathComponent(path), timeoutInterval: Double.infinity)
            request.httpMethod = HttpMethod.get.rawValue
            request.addValue(RatesAPI.apiKey, forHTTPHeaderField: "apikey")
            
            return request
        }
    }
}
