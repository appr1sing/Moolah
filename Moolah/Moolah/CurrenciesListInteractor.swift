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
    func convert(_ request: CurrenciesList.FetchItems.Request, with value: String)
    func fetchDelegatedCurrencies(_ request: CurrenciesList.Update.Request)
    func requestDeleteIndexPath(_ request: CurrenciesList.DeleteIndexPath.Request)
    func retrieveSavedData(_ request: CurrenciesList.Retrieve.Request)
}

protocol CurrenciesListInteractorOutput {
    func presentFetchedItems(_ response: CurrenciesList.FetchItems.Response)
    func presentBaseCurrency(_ currency: CurrenciesList.FetchItems.Response)
    func presentConvertedValues(_ response: CurrenciesList.FetchItems.Response, with value: String)
    func presentDelegatedCurrencies(_ response: CurrenciesList.Update.Response)
    func presentDeleteIndexPath(_ response: CurrenciesList.DeleteIndexPath.Response)
    func presentRetrievedData(_ response: CurrenciesList.Retrieve.Response)
}


class CurrenciesListInteractor: CurrenciesListInteractorInput {
    
    var output : CurrenciesListInteractorOutput!
    var worker = CurrencyWorker(store: CurrencyStore())
    var currencies : [Currency] = [] // All downloaded currencies stored here
    var defaultCurrencies = ["CNY", "EUR", "GBP", "JPY", "USD"] {
        didSet {
            FileCabinet.shared.saveSelectedCurrencies(defaultCurrencies)
        }
    }
    
    func fetchItems(_ request: CurrenciesList.FetchItems.Request) {
        
        // download all currencies
        
        worker.fetchAllCurrencies(request.defaultBase.currencyName) { [unowned self] (results) in
            
            // MARK : Saving last downloaded currency list
            FileCabinet.shared.saveCurrencies(results)
           
            let latestSelectedCurrencies = FileCabinet.shared.retrievedSelectedCurrencies()
            if !latestSelectedCurrencies.isEmpty { self.defaultCurrencies = latestSelectedCurrencies }
            
            let defaults = self.presentDefaultCurrencies(results)
            let convertRequest = self.convertViewModelToCurrencyType(request.defaultBase)
            let response = CurrenciesList.FetchItems.Response(currencies: defaults)
            let baseResponse = CurrenciesList.FetchItems.Response(currencies: [convertRequest])
            self.currencies = results
            self.output.presentFetchedItems(response)
            self.output.presentBaseCurrency(baseResponse)
        }
    }
    
    func retrieveSavedData(_ request: CurrenciesList.Retrieve.Request) {
        worker.retrieveSavedData { [unowned self] (results) in
            self.defaultCurrencies = FileCabinet.shared.retrievedSelectedCurrencies()
            let defaults = self.presentDefaultCurrencies(results)
            let response = CurrenciesList.Retrieve.Response(currencies: defaults)
            self.currencies = results
            self.output.presentRetrievedData(response)
        }
    }
    
    func fetchDelegatedCurrencies(_ request: CurrenciesList.Update.Request) {
        let results = request.currencies.filter({ $0.countryName != request.base.countryName })
        if !results.isEmpty { defaultCurrencies = results.map({ $0.currencyName }) + [request.base.currencyName] }
        let currencies = results.map({ convertViewModelToCurrencyType($0) })
        let response = CurrenciesList.Update.Response(currencies: currencies)
        output.presentDelegatedCurrencies(response)
        
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




