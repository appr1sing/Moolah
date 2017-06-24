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
}

protocol CurrenciesListPresenterOutput: class{
    func displayFetchedItems(_ viewModel: CurrenciesList.FetchItems.ViewModel)
    func displayDeleteResultSuccessful(_ viewModel: CurrenciesList.Delete.ViewModel.Successful)
    func displayDeleteResultError(_ viewModel: CurrenciesList.Delete.ViewModel.Error)
}

class CurrenciesListPresenter: CurrenciesListPresenterInput{
    
    weak var output : CurrenciesListPresenterOutput! 
    
    
    func presentFetchedItems(_ response: CurrenciesList.FetchItems.Response) {
        let viewModel = CurrenciesList.FetchItems.ViewModel(displayedItems: response.currencies.map({ $0.toDisplayedItem() }))
        output.displayFetchedItems(viewModel)
    }
    
    func presentDeleteItem(_ response: CurrenciesList.Delete.Response) {
        
    }
    
    //    weak var output: CurrenciesListPresenterOutput!
    
    // MARK: Presentation logic
    
//    func presentFetchedItems(_ response: CurrenciesList.FetchItems.Response){
//        let viewModel = CurrenciesList.FetchItems.ViewModel(displayedItems: response.currencies.map{$0.toDisplayedItem()})
//        output.displayFetchedItems(viewModel)
//    }
//    
//    func presentDeleteItem(_ response: CurrenciesList.Delete.Response){
//        if response.successfully {
//            presentDeleteItemSuccessful(atIndex: response.index)
//        }
//        else{
//            presentDeleteItemError()
//        }
//    }
//    
//    func presentDeleteItemSuccessful(atIndex: Int){
//        let viewModel = CurrenciesList.Delete.ViewModel.Successful(indexPath: IndexPath(item: atIndex, section: 0))
//        output.displayDeleteResultSuccessful(viewModel)
//    }
//    
//    func presentDeleteItemError(){
//        let alertController = UIAlertController(title: nil, message: "Error found, please try later", preferredStyle: UIAlertControllerStyle.alert)
//        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
//        let viewModel = CurrenciesList.Delete.ViewModel.Error(alertController: alertController)
//        output.displayDeleteResultError(viewModel)
//    }

}

extension Currency {
    func toDisplayedItem() -> CurrenciesList.FetchItems.ViewModel.DisplayedItem {
        
        return CurrenciesList.FetchItems.ViewModel.DisplayedItem(countryName: self.countryName,
                                                                 currencyName: self.currencyName,
                                                                 currencyValue: self.currencyValue)
    }
}


