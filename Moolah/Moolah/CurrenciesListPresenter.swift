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
    func presentDeleteItem(_ response: CurrenciesList.Delete.Response)
    func presentBaseCurrency(_ currency: CurrenciesList.FetchItems.ViewModel.Base)
    func presentConvertedValues(_ response: CurrenciesList.FetchItems.Response, with value: String)
    
}

protocol CurrenciesListPresenterOutput: class{
    func displayFetchedItems(_ viewModel: CurrenciesList.FetchItems.ViewModel)
    func displayDeleteResultSuccessful(_ viewModel: CurrenciesList.Delete.ViewModel.Successful)
    func displayDeleteResultError(_ viewModel: CurrenciesList.Delete.ViewModel.Error)
    func displayBaseCurrency(_ viewModel: CurrenciesList.FetchItems.ViewModel.Base)
    func displayConvertedValues(_ viewModel: CurrenciesList.FetchItems.ViewModel)
}

class CurrenciesListPresenter: CurrenciesListPresenterInput {
    
    weak var output : CurrenciesListPresenterOutput! 
    
    func presentFetchedItems(_ response: CurrenciesList.FetchItems.Response) {
        let viewModel = CurrenciesList.FetchItems.ViewModel(displayedItems: response.currencies.map({ $0.toDisplayedItem() }))
        output.displayFetchedItems(viewModel)
    }
    
    func presentDeleteItem(_ response: CurrenciesList.Delete.Response) {
        
    }
    
    func presentBaseCurrency(_ currency: CurrenciesList.FetchItems.ViewModel.Base) {
        let viewModel = currency
        output.displayBaseCurrency(viewModel)
    }
    
    func presentConvertedValues(_ response: CurrenciesList.FetchItems.Response, with value: String) {
        guard let multiplier = Double(value) else { return }
        let viewModel = CurrenciesList.FetchItems.ViewModel(displayedItems: response.currencies.map({ $0.toConvertedValues(multiplier) }))
        output.displayConvertedValues(viewModel)
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


