//
//  AddCurrencyWorker.swift
//  Moolah
//
//  Created by Arvin San Miguel on 7/1/17.
//  Copyright © 2017 Appr1sing Studios. All rights reserved.
//

import Foundation

class AddCurrencyWorker {
    
    //MARK: Business Logic 
   
    func createResponse(_ input: [String:String]) -> [Currency] {
        
        let list = CurrencytoCountry.countryCode
        var currencies : [Currency] = []
        for (key, value) in list {
            currencies.append(Currency(value, currencyName: key, currencyValue: 1.0))
        }
        return currencies.sorted { $0.countryName < $1.countryName }
    }
    
    func convertViewModelToCurrencyType(_ input: [CurrenciesList.FetchItems.ViewModel.DisplayedItem]) -> [Currency] {
        let results = input.map({ Currency($0.countryName, currencyName: $0.currencyName, currencyValue: $0.currencyValue) })
        return results
    }
    
    func retrieveIndexPath(from currencies: [Currency], with selected: [Currency]) -> [IndexPath] {
        
        var indexPaths : [IndexPath] = []
        for (index,value) in currencies.enumerated() {
            if selected.contains(value) {
                indexPaths.append(IndexPath(row: index, section: 1))
            }
        }
        return Array(indexPaths.dropLast())
        
    }
    
}
