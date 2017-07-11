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
    //func displayDeleteResultSuccessful(_ viewModel: CurrenciesList.FetchItems.ViewModel)
    func displayConvertedValues(_ viewModel: CurrenciesList.FetchItems.ViewModel)
    func displayDelegatedCurrencies(_ viewModel: CurrenciesList.FetchItems.ViewModel)
    func displayDeletedIndexPath(_ viewModel: CurrenciesList.DeleteIndexPath.ViewModel.Success)
    func displayRetrievedData(_ viewModel: CurrenciesList.FetchItems.ViewModel)
}

protocol CurrenciesListViewControllerOutput {
    func fetchItems(_ request: CurrenciesList.FetchItems.Request)
    func convert(_ request: CurrenciesList.FetchItems.Request, with input: String)
    func fetchDelegatedCurrencies(_ request: CurrenciesList.Update.Request)
    func requestDeleteIndexPath(_ request: CurrenciesList.DeleteIndexPath.Request)
    func retrieveSavedData(_ request: CurrenciesList.Retrieve.Request)
}

class CurrenciesListViewController: UIViewController, CurrenciesListViewControllerInput {
    
    var output : CurrenciesListViewControllerOutput!
    var router : CurrenciesListRouter!
    var displayedCurrencies : [CurrenciesList.FetchItems.ViewModel.DisplayedItem] = []
    var defaultBase = CurrenciesList.FetchItems.ViewModel.DisplayedItem(countryName: "United States",
                                                                        currencyName: "USD",
                                                                        currencyValue: 1.00) {
        didSet {
            let request = CurrenciesList.FetchItems.Request(defaultBase: defaultBase)
            output.convert(request, with: String(defaultBase.currencyValue))
        }
    }
    var inputValues : String = "1.00"
    
    let tableView = UITableView(frame: .zero)
    let activityIndicator = UIActivityIndicatorView()
    let addButton = AddButton()
    
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CurrenciesListConfigurator.sharedInstance.configure(viewController: self)
        self.layoutUI()
        self.checkNetworkConnectivity()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        retrievedDelegatedCurrencies()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    func checkNetworkConnectivity() {
        if !NetworkManager.status {
            self.fetchSavedData()
            self.tableView.allowsSelection = false
            addButton.isHidden = true
        } else {
            addButton.isHidden = false
            self.fetchItems()
            self.tableView.reloadData()
        }
    }
    
    func fetchSavedData() {
        let request = CurrenciesList.Retrieve.Request()
        output.retrieveSavedData(request)
    }
    
    func fetchItems() {
        activityIndicator.startAnimating()
        let request = CurrenciesList.FetchItems.Request(defaultBase: defaultBase)
        output.fetchItems(request)
    }
    
    func retrievedDelegatedCurrencies() {
        let request = CurrenciesList.Update.Request(currencies: displayedCurrencies, base: defaultBase)
        let convertRqst = CurrenciesList.FetchItems.Request(defaultBase: defaultBase)
        output.fetchDelegatedCurrencies(request)
        output.convert(convertRqst, with: inputValues)
    }
    
    func displayFetchedItems(_ viewModel: CurrenciesList.FetchItems.ViewModel) {
        displayedCurrencies = viewModel.displayedItems
        activityIndicator.stopAnimating()
        
    }
    
    func displayRetrievedData(_ viewModel: CurrenciesList.FetchItems.ViewModel) {
        displayedCurrencies = viewModel.displayedItems
        self.tableView.reloadData()
    }
    
    func displayBaseCurrency(_ viewModel: CurrenciesList.FetchItems.ViewModel) {
        if viewModel.displayedItems.isEmpty { return }
        defaultBase = viewModel.displayedItems.first!
        activityIndicator.stopAnimating()
    }
    
    func displayDelegatedCurrencies(_ viewModel: CurrenciesList.FetchItems.ViewModel) {
        displayedCurrencies = viewModel.displayedItems
    }
    
    func displayConvertedValues(_ viewModel: CurrenciesList.FetchItems.ViewModel) {
        displayedCurrencies = viewModel.displayedItems
        activityIndicator.stopAnimating()
        self.tableView.reloadData()
    }
    
    func displayDeletedIndexPath(_ viewModel: CurrenciesList.DeleteIndexPath.ViewModel.Success) {
        tableView.beginUpdates()
        displayedCurrencies.remove(at: viewModel.indexPath.row)
        tableView.deleteRows(at: [viewModel.indexPath], with: .fade)
        tableView.endUpdates()
    }

}

extension CurrenciesListViewController : UITableViewDelegate, UITableViewDataSource {
    
    // MARK - SETUP TABLEVIEW
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        switch section {
        case 0 : count = 1
        case 1 : count = 1
        case 2 : count = displayedCurrencies.count
        case 3 : count = 1
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
            cell.countryName.text =  defaultBase.countryName //defaultBaseCurrency.countryName
            cell.currencyName.text = defaultBase.currencyName //defaultBaseCurrency.currencyName
            cell.textField.delegate = self
            cell.textField.text = inputValues //inputValues
            return cell
        case 2 :
            let cell = CurrencyCell(style: .default, reuseIdentifier: "currencyCell")
            let bgView = UIView()
            bgView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            cell.countryName.text = displayedCurrencies[indexPath.row].countryName
            cell.currencyValue.text = String(displayedCurrencies[indexPath.row].value)
            cell.currencyName.text = displayedCurrencies[indexPath.row].currencyName
            cell.selectedBackgroundView = bgView
            cell.selectionStyle = .default
            return cell
        case 3 :
            let cell = FooterViewCell(style: .default, reuseIdentifier: "footerCell")
            cell.button = addButton
            cell.button.addTarget(self, action: #selector(addButtonPressed(_:)), for: .touchUpInside)
            cell.selectionStyle = .none
            return cell
        default : return UITableViewCell()
        }

    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 { return view.frame.height * 0.15 }
        if indexPath.section == 3 { return view.frame.height * 0.2 }
        return view.frame.height * 0.12
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 2 {
            defaultBase = displayedCurrencies[indexPath.row]
            defaultBase.currencyValue = Double(inputValues)!
            inputValues = String(defaultBase.value) // "1.00"
            let request = CurrenciesList.FetchItems.Request(defaultBase: defaultBase)
            output.fetchItems(request)
            activityIndicator.startAnimating()
        }
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.section == 2 {
            cell.alpha = 0.5
            UIView.animate(withDuration: 0.2, animations: {
                cell.alpha = 1.0
            }, completion: nil)
         }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
                let selected = CurrenciesList.DeleteIndexPath.Request(index: indexPath.row)
                output.requestDeleteIndexPath(selected)
        }
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section == 2 { return true }
        return false
    }
    
}

extension CurrenciesListViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textField(_ shouldChangeCharactersIntextField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // Check textfield input, only allows up to 2 decimal point.
        
        let oldText: NSString = shouldChangeCharactersIntextField.text! as NSString
        let newText: String = oldText.replacingCharacters(in: range, with: string)
        let arrayOfNewText = newText.characters.map({ String($0) })
        
        if arrayOfNewText.contains(".") {
            
            let arraySlice = Int(arrayOfNewText.index(of: ".")!)
            if ((arrayOfNewText.count - 1) - arraySlice) == 3 { return false }
            
        }
        
        return true
        
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.text = ""
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
       
        let request = CurrenciesList.FetchItems.Request(defaultBase: defaultBase)
        if let value = textField.text {
            if value == "" {
                textField.text = String(defaultBase.value)
                inputValues = String(defaultBase.value)
                output.convert(request, with: inputValues)
            } else if validateContentsOf(value) {
                inputValues = value
                defaultBase.currencyValue = Double(value)!
                output.convert(request, with: value)
                if !value.characters.map({ String($0) }).contains(".") {
                    inputValues = value + ".00"
                }
            }
        }
        textField.resignFirstResponder()
    }
    
    func validateContentsOf(_ text: String) -> Bool {
        
        let regex = "[+-]?[0-9]{1,3}(?:,?[0-9]{3})*(?:\\.[0-9]{1,2})?"
        let currencyTestOne = NSPredicate(format: "SELF MATCHES %@", regex)
        
        if currencyTestOne.evaluate(with: text) { return true }
        return false
        
    }

    
}

extension CurrenciesListViewController {
    
    func addButtonPressed(_ sender: AddButton) {
        sender.buttonPressed()
        router.goToAddCurrencyViewController()
    }
    
}


