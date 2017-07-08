//
//  AddCurrencyInteractor.swift
//  Moolah
//
//  Created by Arvin San Miguel on 7/1/17.
//  Copyright © 2017 Appr1sing Studios. All rights reserved.
//

import Foundation

protocol AddCurrencyInteractorInput {
    func fetchItems(_ request: AddCurrency.FetchItems.Request)
    func fetchSelectedCurrencies(_ request: AddCurrency.SelectedCurrency.Request)
    func updateSelectedCurrencies(_ request: AddCurrency.Update.Request)
}

protocol AddCurrencyInteractorOutput {
    func presentFetchItems(_ response: AddCurrency.FetchItems.Response)
    func presentSelectedCurrencies(_ response: AddCurrency.SelectedCurrency.Response)
    func presentUpdatedSelectedCurrencies(_ response: AddCurrency.SelectedCurrency.Response)
}


class AddCurrencyInteractor: AddCurrencyInteractorInput {
    
    var output: AddCurrencyInteractorOutput!
    var selectedIndexPath : [IndexPath] = []
    
    var selectedCurrencies: [Currency] = []
    var currencies : [Currency] = [] // List Country Currency Code
    let worker = AddCurrencyWorker()
    
    
    func fetchItems(_ request: AddCurrency.FetchItems.Request) {
        let results = worker.createResponse(CurrencytoCountry.countryCode)
        self.currencies = results
        
        if let base = request.currencies.last {
            let response = AddCurrency.FetchItems.Response(currencies: results.filter({ $0.currencyName != base.currencyName }))
            output.presentFetchItems(response)
        }
        
    }
    
    func fetchSelectedCurrencies(_ request: AddCurrency.SelectedCurrency.Request) {
        let selected = Currency(request.currency.countryName, currencyName: request.currency.currencyName, currencyValue: request.currency.value)
        if request.selected {
            self.selectedCurrencies.append(selected)
        } else {
            selectedCurrencies = selectedCurrencies.filter({ $0 != selected })
        }
        let response = AddCurrency.SelectedCurrency.Response(currencies: selectedCurrencies)
        output.presentSelectedCurrencies(response)
    }
    
    func updateSelectedCurrencies(_ request: AddCurrency.Update.Request) {
        let results = worker.convertViewModelToCurrencyType(request.currencies)
        let response = AddCurrency.SelectedCurrency.Response(currencies: results)
        selectedCurrencies = results
        output.presentUpdatedSelectedCurrencies(response)
    }
    
}
