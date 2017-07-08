//
//  CurrenciesListInteractor.swift
//  Moolah
//
//  Created by Arvin San Miguel on 6/11/17.
//  Copyright © 2017 Appr1sing Studios. All rights reserved.
//

import UIKit

protocol CurrenciesListInteractorInput {
    func fetchItems(_ request: CurrenciesList.FetchItems.Request)
    func requestDeleteItem(_ request: CurrenciesList.Delete.Request)
    func convert(_ request: CurrenciesList.FetchItems.Request, with value: String)
    func fetchDelegatedCurrencies(_ request: CurrenciesList.Update.Request)
    func requestDeleteIndexPath(_ request: CurrenciesList.DeleteIndexPath.Request)
}

protocol CurrenciesListInteractorOutput {
    func presentFetchedItems(_ response: CurrenciesList.FetchItems.Response)
    func presentDeleteItem(_ response: CurrenciesList.Delete.Response)
    func presentBaseCurrency(_ currency: CurrenciesList.FetchItems.Response)
    func presentConvertedValues(_ response: CurrenciesList.FetchItems.Response, with value: String)
    func presentDelegatedCurrencies(_ response: CurrenciesList.Update.Response)
    func presentDeleteIndexPath(_ response: CurrenciesList.DeleteIndexPath.Response)
}


class CurrenciesListInteractor: CurrenciesListInteractorInput {
    
    var output : CurrenciesListInteractorOutput!
    var worker = CurrencyWorker(store: CurrencyStore())
    var currencies : [Currency] = [] // All downloaded currencies stored here
    var defaultCurrencies = ["CNY", "EUR", "GBP", "JPY", "USD"]
    
    func fetchItems(_ request: CurrenciesList.FetchItems.Request) {
        
        // download all currencies
        
        worker.fetchAllCurrencies(request.defaultBase.currencyName) { [unowned self] (results) in
            let defaults = self.presentDefaultCurrencies(results)
            let convertRequest = self.convertViewModelToCurrencyType(request.defaultBase)
            let response = CurrenciesList.FetchItems.Response(currencies: defaults)
            let baseResponse = CurrenciesList.FetchItems.Response(currencies: [convertRequest])
            self.currencies = results
            self.output.presentFetchedItems(response)
            self.output.presentBaseCurrency(baseResponse)
        }
    }
    
    func fetchDelegatedCurrencies(_ request: CurrenciesList.Update.Request) {
        let results = request.currencies.filter({ $0.countryName != request.base.countryName })
        if !results.isEmpty { defaultCurrencies = results.map({ $0.currencyName }) + [request.base.currencyName] }
        let currencies = results.map({ convertViewModelToCurrencyType($0) })
        let response = CurrenciesList.Update.Response(currencies: currencies)
        output.presentDelegatedCurrencies(response)
    }
    
    func requestDeleteItem(_ request: CurrenciesList.Delete.Request) {
//        let deletedCurrency = convertViewModelToCurrencyType(request.deletedItem)
//        defaultCurrencies = defaultCurrencies.filter({ $0 != deletedCurrency.currencyName })
//        let results = presentDefaultCurrencies(currencies)
//        let response = CurrenciesList.Delete.Response(result: results)
//        output.presentDeleteItem(response)
        
    }
    
    func requestDeleteIndexPath(_ request: CurrenciesList.DeleteIndexPath.Request) {
        defaultCurrencies.remove(at: request.index)
        let response = CurrenciesList.DeleteIndexPath.Response(index: request.index)
        output.presentDeleteIndexPath(response)
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
    
    func convertViewModelToCurrencyType(_ input: CurrenciesList.FetchItems.ViewModel.DisplayedItem) -> Currency {
        return Currency(input.countryName, currencyName: input.currencyName, currencyValue: input.currencyValue)
    }
    
}




