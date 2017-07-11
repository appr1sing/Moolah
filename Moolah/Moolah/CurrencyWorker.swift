//
//  CurrencyWorker.swift
//  Moolah
//
//  Created by Arvin San Miguel on 6/13/17.
//  Copyright © 2017 Appr1sing Studios. All rights reserved.
//

import Foundation

protocol CurrencyStoreProtocol{
    func fetchAllCurrencies(_ base: String, completionHandler: @escaping (_ currenciesArray: [Currency], _ error: CurrencyStoreError?) -> Void)
    func retrieveSavedData(_ completionHandler: @escaping (_ currencies: [Currency], _ error: CurrencyStoreError?) -> Void )
    
}

enum CurrencyStoreError: Equatable, Error{
    case CannotFetch(String)
    case CannotDelete(String)
    case CannotCreate(String)
    case CannotUpdate(String)
}

func ==(lhs: CurrencyStoreError, rhs: CurrencyStoreError) -> Bool {
    switch (lhs, rhs) {
    case (.CannotFetch(let a), .CannotFetch(let b)) where a == b: return true
    case (.CannotDelete(let a), .CannotDelete(let b)) where a == b: return true
    case (.CannotCreate(let a), .CannotCreate(let b)) where a == b: return true
    case (.CannotUpdate(let a), .CannotUpdate(let b)) where a == b: return true
    default: return false
    }
}


class CurrencyWorker {
    
    var store: CurrencyStoreProtocol
    
    init(store: CurrencyStoreProtocol) {
        self.store = store
    }
    
    func fetchAllCurrencies(_ base : String, completionHandler: @escaping (_ currenciesArray:[Currency]) -> Void) {

        store.fetchAllCurrencies(base) { results, error in
            if error != nil {
                completionHandler([])
            }
            else{
                completionHandler(results)
            }
        }
    
    }
    
    func retrieveSavedData(_ completionHandler: @escaping (_ currencies: [Currency]) -> Void) {
        
        store.retrieveSavedData { (results, error) in
            if error != nil {
                completionHandler([])
            }
            else{
                completionHandler(results)
            }
        }
        
    }
    
}

