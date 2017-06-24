//
//  CurrencyStore.swift
//  Moolah
//
//  Created by Arvin San Miguel on 6/14/17.
//  Copyright © 2017 Appr1sing Studios. All rights reserved.
//

import Foundation


class CurrencyStore: CurrencyStoreProtocol {
    
    let apiClient = CurrencyAPIClient.shared
    private var currencies : [Currency] = []
    var selectedCurrencies : [Currency] = []
    
    // MARK - Business logic
    
    func fetchAllCurrencies(completionHandler: @escaping (_ currenciesArray: [Currency], _ error: CurrencyStoreError?) -> Void) {
        
        apiClient.requestCurrentConversion { json in
            
            guard let responseCurrencies = json["rates"] as? [String : Double] else { fatalError() }
            
            for (key, value) in responseCurrencies {
                
                let countryName = CurrencytoCountry.countryCode[key]!
                let currency = Currency(countryName, currencyName: key, currencyValue: value)
                self.currencies.append(currency)
                
            }
            
            OperationQueue.main.addOperation {
                completionHandler(self.currencies.sorted(by: { $0.countryName < $1.countryName }), nil)
            }
        }
    }
    
    
    func fetchCurrency(currency: Currency, completionHandler: (Currency?, CurrencyStoreError?) -> Void) {
        let selectedCurrency = currencies.filter ({ $0.countryName == currency.countryName })
        completionHandler(selectedCurrency.first, nil)
    }
   
    func deleteCurrency(currency: Currency, completionHandler: (CurrencyStoreError?) -> Void) {
        
    }
    
    func updateCurrency(currency: Currency, completionHandler: (CurrencyStoreError?) -> Void) {
        
    }
    
    func createCurrency(currency: Currency, completionHandler: (CurrencyStoreError?) -> Void) {
        
    }
    
    
    private func getObjectIndex(id: NSNumber?) -> Int?{
        return 1
    }
    
}