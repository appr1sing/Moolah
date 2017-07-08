//
//  AddCurrencyPresenter.swift
//  Moolah
//
//  Created by Arvin San Miguel on 7/1/17.
//  Copyright © 2017 Appr1sing Studios. All rights reserved.
//

import Foundation

protocol AddCurrencyPresenterInput {
    func presentFetchItems(_ response: AddCurrency.FetchItems.Response)
    func presentSelectedCurrencies(_ response: AddCurrency.SelectedCurrency.Response)
    func presentUpdatedSelectedCurrencies(_ response: AddCurrency.SelectedCurrency.Response)
}

protocol AddCurrencyPresenterOutput : class {
    func displayFetchedItems(_ viewModel: AddCurrency.FetchItems.ViewModel)
    func displaySelectedCurrencies(_ viewModel: AddCurrency.SelectedCurrency.ViewModel)
    func displayUpdatedSelectedCurrencies(_ viewModel: AddCurrency.SelectedCurrency.ViewModel)
}

class AddCurrencyPresenter: AddCurrencyPresenterInput {
    
    weak var output : AddCurrencyPresenterOutput!
    
    func presentFetchItems(_ response: AddCurrency.FetchItems.Response) {
        let viewModel = AddCurrency.FetchItems.ViewModel(displayedItems: response.currencies.map{ $0.presentedCurrencies()})
        output.displayFetchedItems(viewModel)
    }
    
    func presentSelectedCurrencies(_ response: AddCurrency.SelectedCurrency.Response) {
        let viewModel = AddCurrency.SelectedCurrency.ViewModel(displayedItems: response.currencies.map{ $0.toDisplayedItem() })
        output.displaySelectedCurrencies(viewModel)
    }
    
    func presentUpdatedSelectedCurrencies(_ response: AddCurrency.SelectedCurrency.Response) {
        let viewModel = AddCurrency.SelectedCurrency.ViewModel(displayedItems: response.currencies.map{ $0.toDisplayedItem() })
        output.displayUpdatedSelectedCurrencies(viewModel)
    }
    
}

extension Currency {

    func presentedCurrencies() -> AddCurrency.FetchItems.ViewModel.DisplayedItems {
        return AddCurrency.FetchItems.ViewModel.DisplayedItems(countryName: self.countryName, currencyName: self.currencyName, value: self.currencyValue)
    }
    
}
