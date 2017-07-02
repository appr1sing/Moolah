//
//  CurrenciesListRouter.swift
//  Moolah
//
//  Created by Arvin San Miguel on 6/11/17.
//  Copyright © 2017 Appr1sing Studios. All rights reserved.
//

import UIKit

protocol CurrenciesListRouterInput {
    func navigateToSomewhere()
}

class CurrenciesListRouter : CurrenciesListRouterInput {
    
    weak var viewController: CurrenciesListViewController!
    
    // MARK: Navigation
    
    func navigateToSomewhere(){
        // NOTE: Teach the router how to navigate to another scene. Some examples follow:
        
        // 1. Trigger a storyboard segue
        // viewController.performSegueWithIdentifier("ShowSomewhereScene", sender: nil)
        
        // 2. Present another view controller programmatically
        // viewController.presentViewController(someWhereViewController, animated: true, completion: nil)
        
        // 3. Ask the navigation controller to push another view controller onto the stack
        // viewController.navigationController?.pushViewController(someWhereViewController, animated: true)
        
        // 4. Present a view controller from a different storyboard
        // let storyboard = UIStoryboard(name: "OtherThanMain", bundle: nil)
        // let someWhereViewController = storyboard.instantiateInitialViewController() as! SomeWhereViewController
        // viewController.navigationController?.pushViewController(someWhereViewController, animated: true)
    }
    
    // MARK: Communication
    
    func passDataToNextScene(segue: UIStoryboardSegue){
        // NOTE: Teach the router which scenes it can communicate with
        
    }
    
    func passDataToNextScene<T: AddCurrencyViewController>(_ vc: T) {
        vc.displayedCurrencies = viewController.displayedCurrencies
    }
    
    func goToAddCurrencyViewController() {
        let addCurrencyVC = AddCurrencyViewController()
        self.passDataToNextScene(addCurrencyVC)
        viewController.present(addCurrencyVC, animated: true, completion: nil)
    }
    
}

