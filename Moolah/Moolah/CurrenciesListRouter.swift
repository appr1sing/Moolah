//
//  CurrenciesListRouter.swift
//  Moolah
//
//  Created by Arvin San Miguel on 6/11/17.
//  Copyright © 2017 Appr1sing Studios. All rights reserved.
//

import UIKit
import Foundation

protocol CurrenciesListRouterInput {
    func navigateToSomewhere()
}

class CurrenciesListRouter : CurrenciesListRouterInput, AddCurrencyViewControllerDelegate {
    
    weak var viewController: CurrenciesListViewController!
    
    // MARK: Navigation
    
    func navigateToSomewhere(){
        
    }
    
    // MARK: Communication
    
    func passDataToNextScene<T: AddCurrencyViewController>(_ vc: T) {
        vc.displayedCurrencies = viewController.displayedCurrencies + [viewController.defaultBase]
   }
    
    func goToAddCurrencyViewController() {
        let addCurrencyVC = AddCurrencyViewController()
        addCurrencyVC.delegate = self
        self.passDataToNextScene(addCurrencyVC)
        viewController.present(addCurrencyVC, animated: true, completion: nil)
    }
    
    func passData(_ from: AddCurrencyViewController, currencies: [CurrenciesList.FetchItems.ViewModel.DisplayedItem]) {
        viewController.displayedCurrencies = currencies
    }
    
}


