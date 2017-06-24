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
    var displayedCurrencies : [CurrenciesList.FetchItems.ViewModel.DisplayedItem] = []
    
    //MARK - Views
    let tableView = UITableView(frame: .zero)
    let activityIndicator = UIActivityIndicatorView()
    
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
        CurrenciesListConfigurator.sharedInstance.configure(viewController: self)
     }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        activityIndicator.startAnimating()
        fetchItems()
    }
    
    func fetchItems() {
        let request = CurrenciesList.FetchItems.Request()
        output.fetchItems(request)
    }
    
    
    func displayFetchedItems(_ viewModel: CurrenciesList.FetchItems.ViewModel) {
        displayedCurrencies = viewModel.displayedItems
        activityIndicator.stopAnimating()
        self.tableView.reloadData()
    }
    
    func displayDeleteResultError(_ viewModel: CurrenciesList.Delete.ViewModel.Error) {
        
    }
    
    func displayDeleteResultSuccessful(_ viewModel: CurrenciesList.Delete.ViewModel.Successful) {
        
    }

}

extension CurrenciesListViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        switch section {
        case 0 : count = 1
        case 1 : count = 1
        case 2 : count = displayedCurrencies.count
        default : break
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0 :
            let cell = TitleCell(style: .default, reuseIdentifier: "titleCell")
            cell.selectionStyle = .none
            return cell
        case 1 :
            let cell = BaseCurrencyCell(style: .default, reuseIdentifier: "baseCurrency")
            cell.selectionStyle = .none
            return cell
        case 2 :
            let cell = CurrencyCell(style: .default, reuseIdentifier: "currencyCell")
            cell.countryName.text = displayedCurrencies[indexPath.row].countryName
            cell.currencyValue.text = String(displayedCurrencies[indexPath.row].value)
            cell.currencyName.text = displayedCurrencies[indexPath.row].currencyName
            cell.selectionStyle = .none
            return cell
            
        default : return UITableViewCell()
        }

    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            return view.frame.height * 0.15
        }
        
        return view.frame.height * 0.12
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
               
    }
    
}



