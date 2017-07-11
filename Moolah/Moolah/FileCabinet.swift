//
//  FileCabinet.swift
//  Moolah
//
//  Created by Arvin San Miguel on 7/8/17.
//  Copyright © 2017 Appr1sing Studios. All rights reserved.
//

import Foundation

class FileCabinet {
    
    static let shared = FileCabinet()
    
    private init() {}
    
    func saveCurrencies(_ currencies: [Currency]) {
        
        let savedData : JSON = ["rates" : toDictionary(currencies)]
        
        do {
            let userDefaults = UserDefaults.standard
            let jsonData = try JSONSerialization.data(withJSONObject: savedData, options: .prettyPrinted)
            let decoded = try JSONSerialization.jsonObject(with: jsonData, options: [])
            if let dictFromJsonData = decoded as? JSON {
                userDefaults.setValue(dictFromJsonData, forKey: "currencies")
            }
        }
        
        catch { print(error.localizedDescription) }
        
    }
    
    func saveSelectedCurrencies(_ currencies: [String]) {
        let userDefaults = UserDefaults.standard
        userDefaults.setValue(currencies, forKey: "savedCurrencies")
    }
    
    private func toDictionary(_ currencies: [Currency] ) -> JSON {
        var dictionary : JSON = [:]
        for item in currencies {
            dictionary["\(item.currencyName)"] = item.currencyValue
        }
        return dictionary
    }
    
    func retrievedSelectedCurrencies() -> [String] {
        if let selectedCurrencies = UserDefaults.standard.value(forKey: "savedCurrencies") as? [String] {
                return selectedCurrencies
        }
        return []
    }
}


