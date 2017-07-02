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
    func displayConvertedValues(_ viewModel: CurrenciesList.FetchItems.ViewModel)
}

protocol CurrenciesListViewControllerOutput {
    func fetchItems(_ request: CurrenciesList.FetchItems.Request, with base: CurrenciesList.FetchItems.ViewModel.Base)
    func requestDeleteItem(_ request: CurrenciesList.Delete.Request)
    func convert(_ request: CurrenciesList.FetchItems.Request, with input: String)
}

class CurrenciesListViewController: UIViewController, CurrenciesListViewControllerInput {
    
    var output : CurrenciesListViewControllerOutput!
    var router : CurrenciesListRouter!
    var displayedCurrencies : [CurrenciesList.FetchItems.ViewModel.DisplayedItem] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var defaultBaseCurrency = CurrenciesList.FetchItems.ViewModel.Base(currencyName: "USD")
    var inputValues : String = "1.00"
    
    let tableView = UITableView(frame: .zero)
    let activityIndicator = UIActivityIndicatorView()
    let addButton = AddButton()
    
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
        output.fetchItems(request, with: defaultBaseCurrency)
    }
    
    
    func displayFetchedItems(_ viewModel: CurrenciesList.FetchItems.ViewModel) {
        displayedCurrencies = viewModel.displayedItems
        activityIndicator.stopAnimating()
    }
    
    func displayBaseCurrency(_ viewModel: CurrenciesList.FetchItems.ViewModel.Base) {
        defaultBaseCurrency = viewModel
        activityIndicator.stopAnimating()
    }
    
    func displayDeleteResultError(_ viewModel: CurrenciesList.Delete.ViewModel.Error) {
        
    }
    
    func displayDeleteResultSuccessful(_ viewModel: CurrenciesList.Delete.ViewModel.Successful) {
        
    }
    
    func displayConvertedValues(_ viewModel: CurrenciesList.FetchItems.ViewModel) {
        displayedCurrencies = viewModel.displayedItems
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
            cell.countryName.text = defaultBaseCurrency.countryName
            cell.currencyName.text = defaultBaseCurrency.currencyName
            cell.textField.delegate = self
            cell.textField.text = inputValues
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
            let selected = displayedCurrencies[indexPath.row].currencyName
            let currency = CurrenciesList.FetchItems.ViewModel.Base(currencyName: selected)
            let request = CurrenciesList.FetchItems.Request()
            displayedCurrencies = []
            inputValues = "1.00"
            output.fetchItems(request, with: currency)
            activityIndicator.startAnimating()
        }
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.section == 2 {
            cell.alpha = 0.5
            cell.center.x -= 50
            UIView.animate(withDuration: 0.2, animations: {
                
                cell.alpha = 1.0
                cell.center.x += 50
                 
            }, completion: nil)
            
        }
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
       
        let request = CurrenciesList.FetchItems.Request()
        if let value = textField.text {
            output.convert(request, with: value)
            inputValues = value
            if value == "" {
                inputValues = "1.00"
                textField.placeholder = "1.00"
                output.convert(request, with: inputValues)
            }
            
            if !value.characters.map({ String($0) }).contains(".") {
                inputValues = inputValues + ".00"
            }
            
        }
        
        textField.resignFirstResponder()
        
    }
    
//    func validateContentsOf(dollars text: String) -> Bool {
//        
//        let regex = "[+-]?[0-9]{1,3}(?:,?[0-9]{3})*(?:\\.[0-9]{1,2})?"
//        let currencyTestOne = NSPredicate(format: "SELF MATCHES %@", regex)
//        
//        if currencyTestOne.evaluate(with: text) { return true }
//        return false
//        
//    }

    
}

extension CurrenciesListViewController {
    
    func addButtonPressed(_ sender: AddButton) {
        sender.buttonPressed()
        router.goToAddCurrencyViewController()
    }
    
} 



