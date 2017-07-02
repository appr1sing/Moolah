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
    func presentSelectedIndexPath(_ response: AddCurrency.SelectedCurrency.Response)
    func presentUpdatedSelectedIndexPath(_ response: AddCurrency.SelectedCurrency.Response)
}

protocol AddCurrencyPresenterOutput : class {
    func displayFetchedItems(_ viewModel: AddCurrency.FetchItems.ViewModel)
    func displaySelectedIndexPath(_ viewModel: AddCurrency.SelectedCurrency.ViewModel)
    func displayUpdatedSelectedIndexPath(_ viewModel: AddCurrency.SelectedCurrency.ViewModel)
}

class AddCurrencyPresenter: AddCurrencyPresenterInput {
    
    weak var output : AddCurrencyPresenterOutput!
    
    func presentFetchItems(_ response: AddCurrency.FetchItems.Response) {
        let viewModel = AddCurrency.FetchItems.ViewModel(displayedItems: response.currencies.map{ $0.presentedCurrencies()})
        output.displayFetchedItems(viewModel)
    }
    
    func presentSelectedIndexPath(_ response: AddCurrency.SelectedCurrency.Response) {
        let viewModel = AddCurrency.SelectedCurrency.ViewModel(indexpaths: response.indexPath.map{ $0.displayIndex() })
        output.displaySelectedIndexPath(viewModel)
    }
    
    func presentUpdatedSelectedIndexPath(_ response: AddCurrency.SelectedCurrency.Response) {
        let viewModel = AddCurrency.SelectedCurrency.ViewModel(indexpaths: response.indexPath.map{ $0.displayIndex() })
        output.displayUpdatedSelectedIndexPath(viewModel)
    }
    
}

extension IndexPath  {
    
    func displayIndex() -> AddCurrency.SelectedCurrency.ViewModel.SelectedIndexPath {
        return AddCurrency.SelectedCurrency.ViewModel.SelectedIndexPath(indexPath: self)
    }
    
}

extension Currency {

    func presentedCurrencies() -> AddCurrency.FetchItems.ViewModel.DisplayedItems {
        return AddCurrency.FetchItems.ViewModel.DisplayedItems(countryName: self.countryName, currencyName: self.currencyName, value: self.currencyValue)
    }
    
}
