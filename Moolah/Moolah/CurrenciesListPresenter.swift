//
//  CurrenciesListPresenter.swift
//  Moolah
//
//  Created by Arvin San Miguel on 6/11/17.
//  Copyright © 2017 Appr1sing Studios. All rights reserved.
//

import UIKit

protocol CurrenciesListPresenterInput{
    func presentFetchedItems(_ response: CurrenciesList.FetchItems.Response)
    func presentBaseCurrency(_ response: CurrenciesList.FetchItems.Response)
    func presentConvertedValues(_ response: CurrenciesList.FetchItems.Response, with value: String)
    func presentDelegatedCurrencies(_ response: CurrenciesList.Update.Response)
    func presentRetrievedData(_ response: CurrenciesList.Retrieve.Response)
    func presentDeletedItem(_ response: CurrenciesList.FetchItems.Response)
}

protocol CurrenciesListPresenterOutput: class{
    func displayFetchedItems(_ viewModel: CurrenciesList.FetchItems.ViewModel)
    func displayBaseCurrency(_ viewModel: CurrenciesList.FetchItems.ViewModel)
    func displayConvertedValues(_ viewModel: CurrenciesList.FetchItems.ViewModel)
    func displayDelegatedCurrencies(_ viewModel: CurrenciesList.FetchItems.ViewModel)
    func displayRetrievedData(_ viewModel: CurrenciesList.FetchItems.ViewModel)
    func displayDeletedItem(_ viewModel: CurrenciesList.FetchItems.ViewModel)
}

class CurrenciesListPresenter: CurrenciesListPresenterInput {
    
    weak var output : CurrenciesListPresenterOutput! 
    
    func presentFetchedItems(_ response: CurrenciesList.FetchItems.Response) {
        let viewModel = CurrenciesList.FetchItems.ViewModel(displayedItems: response.currencies.map({ $0.toDisplayedItem() }))
        output.displayFetchedItems(viewModel)
    }
    
    func presentDelegatedCurrencies(_ response: CurrenciesList.Update.Response) {
        let viewModel = CurrenciesList.FetchItems.ViewModel(displayedItems: response.currencies.map({ $0.toDisplayedItem() }))
        output.displayDelegatedCurrencies(viewModel)
    }
    
    func presentBaseCurrency(_ response: CurrenciesList.FetchItems.Response) {
        let viewModel = CurrenciesList.FetchItems.ViewModel(displayedItems: response.currencies.map({ $0.toDisplayedItem() }))
        output.displayBaseCurrency(viewModel)
    }
    
    func presentConvertedValues(_ response: CurrenciesList.FetchItems.Response, with value: String) {
        guard let multiplier = Double(value) else { return }
        let viewModel = CurrenciesList.FetchItems.ViewModel(displayedItems: response.currencies.map({ $0.toConvertedValues(multiplier) }))
        output.displayConvertedValues(viewModel)
    }
    
    func presentRetrievedData(_ response: CurrenciesList.Retrieve.Response) {
        let viewModel = CurrenciesList.FetchItems.ViewModel(displayedItems: response.currencies.map({ $0.toDisplayedItem() }))
        output.displayRetrievedData(viewModel)
    }
    
    func presentDeletedItem(_ response: CurrenciesList.FetchItems.Response) {
        let viewModel = CurrenciesList.FetchItems.ViewModel(displayedItems: response.currencies.map({ $0.toDisplayedItem() }))
        output.displayDeletedItem(viewModel)
    }
    
}

extension Currency {
    func toDisplayedItem() -> CurrenciesList.FetchItems.ViewModel.DisplayedItem {
        
        return CurrenciesList.FetchItems.ViewModel.DisplayedItem(countryName: self.countryName,
                                                                 currencyName: self.currencyName,
                                                                 currencyValue: self.currencyValue)
    }
    
    func toConvertedValues(_ value: Double) -> CurrenciesList.FetchItems.ViewModel.DisplayedItem {
        
        return CurrenciesList.FetchItems.ViewModel.DisplayedItem(countryName: self.countryName, currencyName: self.currencyName, currencyValue: self.currencyValue * value)
        
    }
    
}


