//
//  CurrenciesListModels.swift
//  Moolah
//
//  Created by Arvin San Miguel on 6/11/17.
//  Copyright © 2017 Appr1sing Studios. All rights reserved.
//

import UIKit

struct CurrenciesList {
    
    struct FetchItems {
        
        struct Request {
            var defaultBase: CurrenciesList.FetchItems.ViewModel.DisplayedItem
        }
        
        struct Response {
            var currencies: [Currency]
        }
        
        struct ViewModel {
            struct DisplayedItem {
                var countryName: String
                var currencyName: String
                var currencyValue: Double
                var value : Double { return currencyValue.roundTo(places: 3) }
            }
            
            var displayedItems: [DisplayedItem]
    
        }
        
    }
    
    struct Update {
        
        struct Request {
            var currencies : [CurrenciesList.FetchItems.ViewModel.DisplayedItem]
            var base : CurrenciesList.FetchItems.ViewModel.DisplayedItem
        }
        
        struct Response {
            var currencies: [Currency]
        }
        
        struct ViewModel {
            struct DisplayedItem {
                var countryName: String
                var currencyName: String
                var currencyValue: Double
                var value : Double { return currencyValue.roundTo(places: 3) }
            }
            var displayedItems: [DisplayedItem]
        }
        
        
    }
    
    struct Delete {
        
        struct Request {
            var deletedItem : CurrenciesList.FetchItems.ViewModel.DisplayedItem
        }
        
        struct Response {
            var result: [Currency]
        }
        
        struct ViewModel {
            struct DisplayedItem {
                var countryName: String
                var currencyName: String
                var currencyValue: Double
                var value : Double { return currencyValue.roundTo(places: 3) }
            }
            var displayedItems: [DisplayedItem]
        }
        
    }
    
    struct DeleteIndexPath {
        
        struct Request {
            var index = 0
        }
        
        struct Response {
            var index = 0
        }
        
        struct ViewModel {
            struct Success {
                var indexPath: IndexPath
            }
        }
        
    }
    
    struct Retrieve {
        
        struct Request {}
        
        struct Response {
            var currencies: [Currency]
        }
        
    }
    
}


