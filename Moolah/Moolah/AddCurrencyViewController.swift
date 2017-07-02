//
//  AddCurrencyViewController.swift
//  Moolah
//
//  Created by Arvin San Miguel on 7/1/17.
//  Copyright © 2017 Appr1sing Studios. All rights reserved.
//

import UIKit

protocol AddCurrencyViewControllerInput {
    func displayFetchedItems(_ viewModel: AddCurrency.FetchItems.ViewModel)
    func displaySelectedIndexPath(_ viewModel: AddCurrency.SelectedCurrency.ViewModel)
    func displayUpdatedSelectedIndexPath(_ viewModel: AddCurrency.SelectedCurrency.ViewModel)
}

protocol AddCurrencyViewControllerOutput {
    func fetchItems(_ request: AddCurrency.FetchItems.Request)
    func fetchSelectedCurrencies(_ request: AddCurrency.SelectedCurrency.Request)
    func updateSelectedCurrencies(_ request: AddCurrency.Update.Request)
}

class AddCurrencyViewController: UIViewController, AddCurrencyViewControllerInput {
    
    var output : AddCurrencyViewControllerOutput!
    var router : AddCurrencyRouter!
    var currencies : [AddCurrency.FetchItems.ViewModel.DisplayedItems] = []
    var selectedCurrencies : [AddCurrency.SelectedCurrency.ViewModel.SelectedIndexPath] = []
    var displayedCurrencies : [CurrenciesList.FetchItems.ViewModel.DisplayedItem] = []
    
    let tableView = UITableView(frame: .zero)
    let proceedButton = ProceedButton(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AddCurrencyConfigurator.sharedInstance.configure(viewController: self)
        layoutUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchItems()
        updateItems()
    }
    
    //MARK - Output Protocol
    func fetchItems() {
        let request = AddCurrency.FetchItems.Request()
        output.fetchItems(request)
    }
    
    func updateItems() {
        let request = AddCurrency.Update.Request(currencies: displayedCurrencies)
        output.updateSelectedCurrencies(request)
    }
    
    
    //MARK - Input Protocol
    func displayFetchedItems(_ viewModel: AddCurrency.FetchItems.ViewModel) {
        currencies = viewModel.displayedItems
        self.tableView.reloadData()
    }
    
    func displaySelectedIndexPath(_ viewModel: AddCurrency.SelectedCurrency.ViewModel) {
        selectedCurrencies = viewModel.indexpaths
    }
    
    func displayUpdatedSelectedIndexPath(_ viewModel: AddCurrency.SelectedCurrency.ViewModel) {
        selectedCurrencies = viewModel.indexpaths
        print(selectedCurrencies.count, "count of selected currencies")
    }
    
}

extension AddCurrencyViewController : UITableViewDataSource, UITableViewDelegate {
    
    //MARK - Setup Tableview
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 { return 1 }
        return currencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = indexPath.section
        switch section {
        case 0 :
            let cell = TitleCell(style: .default, reuseIdentifier: "titleCell")
            cell.label.text = "Select Currency"
            cell.button = proceedButton
            cell.button.addTarget(self, action: #selector(proceedBtnPressed(_:)), for: .touchUpInside)
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell = AddCurrencyCell(style: .default, reuseIdentifier: "addCurrencyCell")
            let bgView = UIView()
            let countryName = currencies[indexPath.row].countryName
            bgView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            cell.countryName.text = countryName
            
            if !displayedCurrencies.filter({ $0.countryName == countryName }).isEmpty {
                cell.tintColor = UIColor.white
                cell.accessoryType = .checkmark
            }
            
            cell.selectedBackgroundView = bgView
            cell.selectionStyle = .default
            return cell
        default: return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 { return view.frame.height * 0.15 }
        if indexPath.section == 3 { return view.frame.height * 0.2 }
        return view.frame.height * 0.12
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 { return }
        
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.tintColor = UIColor.white
            if cell.accessoryType == .checkmark {
                cell.accessoryType = .none
                let request = AddCurrency.SelectedCurrency.Request(indexPath: indexPath, selected: false)
                output.fetchSelectedCurrencies(request)
            } else {
                let request = AddCurrency.SelectedCurrency.Request(indexPath: indexPath, selected: true)
                cell.accessoryType = .checkmark
                output.fetchSelectedCurrencies(request)
            }
        }
    
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let selected = AddCurrency.SelectedCurrency.ViewModel.SelectedIndexPath(indexPath: indexPath)
        if selectedCurrencies.contains(where: { $0.indexPath == selected.indexPath }) {
            cell.tintColor = UIColor.white
            cell.accessoryType = .checkmark
        }
    }
    
}

extension AddCurrencyViewController {
    
    func proceedBtnPressed(_ sender: ProceedButton) {
        sender.buttonPressed()
    }
    
}
