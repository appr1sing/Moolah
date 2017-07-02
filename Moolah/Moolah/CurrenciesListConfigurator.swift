//
//  CurrenciesListConfigurator.swift
//  Moolah
//
//  Created by Arvin San Miguel on 6/11/17.
//  Copyright © 2017 Appr1sing Studios. All rights reserved.
//

import UIKit

// MARK: Connect View, Interactor, and Presenter

extension CurrenciesListViewController: CurrenciesListPresenterOutput{
}

extension CurrenciesListInteractor: CurrenciesListViewControllerOutput{
}

extension CurrenciesListPresenter: CurrenciesListInteractorOutput{
}

class CurrenciesListConfigurator {
    // MARK: Object lifecycle
    
    class var sharedInstance: CurrenciesListConfigurator{
        struct Static {
            static let instance =  CurrenciesListConfigurator()
        }
        return Static.instance
    }
    
    // MARK: Configuration
    
    func configure(viewController: CurrenciesListViewController){
        let router = CurrenciesListRouter()
        router.viewController = viewController
        
        let presenter = CurrenciesListPresenter()
        presenter.output = viewController
        
        let interactor = CurrenciesListInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
