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
    func presentBaseCurrency(_ response: CurrenciesList.FetchItems.Response)
    func presentConvertedValues(_ response: CurrenciesList.FetchItems.Response, with value: String)
    func presentDelegatedCurrencies(_ response: CurrenciesList.Update.Response)
    func presentDeleteIndexPath(_ response: CurrenciesList.DeleteIndexPath.Response)
}

protocol CurrenciesListPresenterOutput: class{
    func displayFetchedItems(_ viewModel: CurrenciesList.FetchItems.ViewModel)
//    func displayDeleteResultSuccessful(_ viewModel: CurrenciesList.Delete.ViewModel.Successful)
//    func displayDeleteResultError(_ viewModel: CurrenciesList.Delete.ViewModel.Error)
    func displayDeleteResultSuccessful(_ viewModel: CurrenciesList.FetchItems.ViewModel)
    func displayBaseCurrency(_ viewModel: CurrenciesList.FetchItems.ViewModel)
    func displayConvertedValues(_ viewModel: CurrenciesList.FetchItems.ViewModel)
    func displayDelegatedCurrencies(_ viewModel: CurrenciesList.FetchItems.ViewModel)
    func displayDeletedIndexPath(_ viewModel: CurrenciesList.DeleteIndexPath.ViewModel.Success)
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
    
    func presentDeleteItem(_ response: CurrenciesList.Delete.Response) {
        let viewModel = CurrenciesList.FetchItems.ViewModel(displayedItems: response.result.map({ $0.toDisplayedItem() }))
        output.displayDeleteResultSuccessful(viewModel)
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
    
    func presentDeleteIndexPath(_ response: CurrenciesList.DeleteIndexPath.Response) {
        let indexPath = IndexPath(row: response.index, section: 2)
        let viewModel = CurrenciesList.DeleteIndexPath.ViewModel.Success(indexPath: indexPath)
        output.displayDeletedIndexPath(viewModel)
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


