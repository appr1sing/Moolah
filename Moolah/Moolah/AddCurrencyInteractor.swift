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
    func presentSelectedIndexPath(_ response: AddCurrency.SelectedCurrency.Response)
    func presentUpdatedSelectedIndexPath(_ response: AddCurrency.SelectedCurrency.Response)
}


class AddCurrencyInteractor: AddCurrencyInteractorInput {
    
    var output: AddCurrencyInteractorOutput!
    var selectedIndexPath : [IndexPath] = []
    var currencies : [Currency] = []
    let worker = AddCurrencyWorker()
    
    
    func fetchItems(_ request: AddCurrency.FetchItems.Request) {
        let results = worker.createResponse(CurrencytoCountry.countryCode)
        self.currencies = results
        let response = AddCurrency.FetchItems.Response(currencies: results)
        output.presentFetchItems(response)
    }
    
    func fetchSelectedCurrencies(_ request: AddCurrency.SelectedCurrency.Request) {
        
        if request.selected {
            self.selectedIndexPath.append(request.indexPath)
        } else {
            selectedIndexPath = selectedIndexPath.filter({ $0 != request.indexPath })
        }
        
        let response = AddCurrency.SelectedCurrency.Response(indexPath: selectedIndexPath)
        output.presentSelectedIndexPath(response)
        print(selectedIndexPath)
    }
    
    func updateSelectedCurrencies(_ request: AddCurrency.Update.Request) {
        let selectedCurrencies = worker.convertViewModelToCurrencyType(request.currencies)
        let indexPaths = worker.retrieveIndexPath(from: currencies, with: selectedCurrencies)
        let response = AddCurrency.SelectedCurrency.Response(indexPath: indexPaths)
        selectedIndexPath = indexPaths
        output.presentUpdatedSelectedIndexPath(response)
    }
    
}
