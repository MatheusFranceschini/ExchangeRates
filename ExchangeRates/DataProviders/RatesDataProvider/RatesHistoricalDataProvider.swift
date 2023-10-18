//
//  RatesHistoricalDataProvider.swift
//  ExchangeRates
//
//  Created by Matheus Franceschini on 14/10/23.
//

import Foundation
import Combine

protocol RatesHistoricalDataProviderProtocol {
    func fetchTimeseries(by base: String, from symbol: String, startDate: String, endDate: String) -> AnyPublisher<[RateHistoricalModel], Error>
}

class RatesHistoricalDataProvider: RatesHistoricalDataProviderProtocol {
    private let ratesStore: RatesStore
    
    init(ratesStore: RatesStore = RatesStore()) {
        self.ratesStore = ratesStore
    }
    
    func fetchTimeseries(by base: String, from symbol: String, startDate: String, endDate: String) -> AnyPublisher<[RateHistoricalModel], Error> {
        
        return Future { promise in
            self.ratesStore.fetchTimeseries(by: base, from: symbol, startDate: startDate, endDate: endDate) { result, error in
                DispatchQueue.main.async {
                    if let error {
                        return promise(.failure(error))
                    }
                    
                    guard let rates = result?.rates else {
                        return //promise(.failure(error)) TODO: - Passar erro para a ViewModel
                    }
                    
                    let rateHistorical = rates.flatMap({ (period, rates) -> [RateHistoricalModel] in
                        return rates.map { RateHistoricalModel(symbol: $0, period: period.toDate(), endRate: $1) }
                    })
                    
                    return promise(.success(rateHistorical))
                }
            }
        }.eraseToAnyPublisher()
    }
}
