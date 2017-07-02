//
//  CurrenciesListInteractor.swift
//  Moolah
//
//  Created by Arvin San Miguel on 6/11/17.
//  Copyright © 2017 Appr1sing Studios. All rights reserved.
//

import UIKit

protocol CurrenciesListInteractorInput {
    func fetchItems(_ request: CurrenciesList.FetchItems.Request, with base: CurrenciesList.FetchItems.ViewModel.Base)
    func requestDeleteItem(_ request: CurrenciesList.Delete.Request)
    func convert(_ request: CurrenciesList.FetchItems.Request, with value: String)
}

protocol CurrenciesListInteractorOutput {
    func presentFetchedItems(_ response: CurrenciesList.FetchItems.Response)
    func presentDeleteItem(_ response: CurrenciesList.Delete.Response)
    func presentBaseCurrency(_ currency: CurrenciesList.FetchItems.ViewModel.Base)
    func presentConvertedValues(_ response: CurrenciesList.FetchItems.Response, with value: String)
}


class CurrenciesListInteractor: CurrenciesListInteractorInput {
    
    var output : CurrenciesListInteractorOutput!
    var worker = CurrencyWorker(store: CurrencyStore())
    var currencies : [Currency] = []
    var defaultCurrencies = ["GBP", "EUR", "JPY", "CNY", "USD"]
    
    func fetchItems(_ request: CurrenciesList.FetchItems.Request, with base: CurrenciesList.FetchItems.ViewModel.Base) {
        
        worker.fetchAllCurrencies(base.currencyName) { [unowned self] (results) in
            let defaults = self.presentDefaultCurrencies(results)
            let response = CurrenciesList.FetchItems.Response(currencies: defaults)
            self.currencies = results
            self.output.presentFetchedItems(response)
        }
        
        self.output.presentBaseCurrency(base)
        
    }
    
    func requestDeleteItem(_ request: CurrenciesList.Delete.Request) {
          
    }
    
    func convert(_ request: CurrenciesList.FetchItems.Request, with value: String) {
        let defaults = self.presentDefaultCurrencies(currencies)
        let response = CurrenciesList.FetchItems.Response(currencies: defaults)
        output.presentConvertedValues(response, with: value)
    }
    
    func presentDefaultCurrencies(_ results: [Currency]) -> [Currency] {
        var newResults: [Currency] = []
        for currency in results {
            if defaultCurrencies.contains(currency.currencyName) {
                newResults.append(currency)
            }
        }
        return newResults
    }
    
}




