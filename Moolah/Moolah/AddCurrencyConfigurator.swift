//
//  AddCurrencyConfigurator.swift
//  Moolah
//
//  Created by Arvin San Miguel on 7/1/17.
//  Copyright © 2017 Appr1sing Studios. All rights reserved.
//

import UIKit

// MARK: Connect View, Interactor, and Presenter

extension AddCurrencyViewController: AddCurrencyPresenterOutput {
}

extension AddCurrencyInteractor: AddCurrencyViewControllerOutput{
}

extension AddCurrencyPresenter: AddCurrencyInteractorOutput{
}

class AddCurrencyConfigurator {
    // MARK: Object lifecycle
    
    class var sharedInstance: AddCurrencyConfigurator{
        struct Static {
            static let instance =  AddCurrencyConfigurator()
        }
        return Static.instance
    }
    
    // MARK: Configuration
    
    func configure(viewController: AddCurrencyViewController){
        let router = AddCurrencyRouter()
        router.viewController = viewController
        
        let presenter = AddCurrencyPresenter()
        presenter.output = viewController
        
        let interactor = AddCurrencyInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
