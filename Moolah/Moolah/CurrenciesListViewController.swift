//
//  CurrenciesListViewController.swift
//  Moolah
//
//  Created by Arvin San Miguel on 6/11/17.
//  Copyright © 2017 Appr1sing Studios. All rights reserved.
//

import UIKit

protocol CurrenciesListViewControllerInput {
    
    func displayFetchedItems(_ viewModel: CurrenciesList.FetchItems.ViewModel)
    func displayDeleteResultSuccessful(_ viewModel: CurrenciesList.Delete.ViewModel.Successful)
    func displayDeleteResultError(_ viewModel: CurrenciesList.Delete.ViewModel.Error)
    
}

protocol CurrenciesListViewControllerOutput {
    func fetchItems(_ request: CurrenciesList.FetchItems.Request)
    func requestDeleteItem(_ request: CurrenciesList.Delete.Request)
}

class CurrenciesListViewController: UIViewController, CurrenciesListViewControllerInput {

    var output : CurrenciesListViewControllerOutput!
    var router : CurrenciesListRouter!
    
    let titleView : TitleView = {
        let view = TitleView(frame: .zero)
        return view
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func displayFetchedItems(_ viewModel: CurrenciesList.FetchItems.ViewModel) {
        
    }
    
    func displayDeleteResultError(_ viewModel: CurrenciesList.Delete.ViewModel.Error) {
        
    }
    
    func displayDeleteResultSuccessful(_ viewModel: CurrenciesList.Delete.ViewModel.Successful) {
        
    }

}

// MARK - SETUP UI

extension CurrenciesListViewController {
    
    func setupUI() {
        
        view.addSubview(titleView)
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        titleView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        titleView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        
        view.backgroundColor = ColorConstant.blue
        
    }
    
}



