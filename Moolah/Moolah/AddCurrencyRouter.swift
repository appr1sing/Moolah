//
//  AddCurrencyRouter.swift
//  Moolah
//
//  Created by Arvin San Miguel on 7/1/17.
//  Copyright © 2017 Appr1sing Studios. All rights reserved.
//

import UIKit

protocol AddCurrencyRouterInput {
    func navigateToSomewhere()
}

class AddCurrencyRouter : AddCurrencyRouterInput {
    
    weak var viewController: AddCurrencyViewController!
    
    // MARK: Navigation
    
    func navigateToSomewhere(){
        goToRootVC()
    }
    
    func goToRootVC() {
        viewController.dismiss(animated: true, completion: nil)
    }
    
}
