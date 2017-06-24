//
//  CurrenciesListInteractor.swift
//  Moolah
//
//  Created by Arvin San Miguel on 6/11/17.
//  Copyright © 2017 Appr1sing Studios. All rights reserved.
//

import UIKit

protocol CurrenciesListInteractorInput {
    func fetchItems(_ request: CurrenciesList.FetchItems.Request)
    func requestDeleteItem(_ request: CurrenciesList.Delete.Request)
}

protocol CurrenciesListInteractorOutput {
    func presentFetchedItems(_ response: CurrenciesList.FetchItems.Response)
    func presentDeleteItem(_ response: CurrenciesList.Delete.Response)
}


class CurrenciesListInteractor: CurrenciesListInteractorInput {
    
    var output : CurrenciesListInteractorOutput!
    var worker = CurrencyWorker(store: CurrencyStore())
    var currencies : [Currency] = []
    
    func fetchItems(_ request: CurrenciesList.FetchItems.Request) {
        worker.fetchAllCurrencies { [unowned self] (results) in
            let response = CurrenciesList.FetchItems.Response(currencies: results)
            self.currencies = results
            self.output.presentFetchedItems(response)
        }
    }
    
    func requestDeleteItem(_ request: CurrenciesList.Delete.Request) {
          
    }
    
    
//    var output: CurrenciesListInteractorOutput!
//    var worker = ItemWorker(itemStore: ItemMemoryStore())
//    var itemsArray: [Currency] = []
//    
//    // MARK: Business logic
//    
//    func fetchItems(request:CurrenciesList.FetchItems.Request){
//        worker.fetchAllItems(completionHandler: {(items) in
//            let response = CurrenciesList.FetchItems.Response(items: items)
//            itemsArray = items
//            output.presentFetchedItems(response: response)
//        })
//    }
//    
//    func requestDeleteItem(request: CurrenciesList.Delete.Request){
//        worker.deleteItem(id: itemsArray[request.index].id!, completionHandler: {(error) in
//            let successfully = error == nil ? true : false
//            if successfully{
//                itemsArray.remove(at: request.index)
//            }
//            let response = CurrenciesList.Delete.Response(index: request.index, successfully: successfully)
//            output.presentDeleteItem(response: response)
//        })
//    }
}


