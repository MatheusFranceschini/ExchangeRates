//
//  CurrencySymbolsDataProvider.swift
//  ExchangeRates
//
//  Created by Matheus Franceschini on 14/10/23.
//

import Foundation
import Combine

protocol CurrencySymbolsDataProviderProtocol {
    func fetchSymbols() -> AnyPublisher<[CurrencySymbolModel], Error>
}

class CurrencySymbolsDataProvider: CurrencySymbolsDataProviderProtocol {
    private let currencyStore: CurrencyStore
    
    init(currencyStore: CurrencyStore = CurrencyStore()) {
        self.currencyStore = currencyStore
    }
    
    func fetchSymbols() -> AnyPublisher<[CurrencySymbolModel], Error> {
        
        return Future { promise in
            self.currencyStore.fetchSymbols { result, error in
                DispatchQueue.main.async {
                    if let error {
                        return promise(.failure(error))
                    }
                    
                    guard let symbols = result?.symbols else {
                        return //promise(.failure(error)) TODO: - Passar erro para a ViewModel
                    }
                    
                    let currenciesSymbol = symbols.map ({ (symbol, fullName) -> CurrencySymbolModel in
                        return CurrencySymbolModel(symbol: symbol, fullName: fullName)
                    })
                    
                    return promise(.success(currenciesSymbol))
                }
            }
        }.eraseToAnyPublisher()
    }
}
