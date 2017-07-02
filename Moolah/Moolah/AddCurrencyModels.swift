//
//  AddCurrencyModels.swift
//  Moolah
//
//  Created by Arvin San Miguel on 7/1/17.
//  Copyright © 2017 Appr1sing Studios. All rights reserved.
//

import Foundation

struct AddCurrency {
    
    struct FetchItems {
        
        struct Request {}
        
        struct Response {
            var currencies : [Currency]
        }
        
        struct ViewModel {
            
            struct DisplayedItems {
                var countryName: String
                var currencyName: String
                var value: Double
            }
            var displayedItems: [DisplayedItems]
        }
        
    }
    
    struct SelectedCurrency {
        
        struct Request {
            var indexPath : IndexPath
            var selected : Bool
        }
        
        struct Response {
            var indexPath: [IndexPath]
        }
        
        struct ViewModel {
            struct SelectedIndexPath {
                var indexPath : IndexPath
            }
            
            var indexpaths: [SelectedIndexPath]
            
        }
        
    }
    
    struct Update {
        struct Request {
            var currencies : [CurrenciesList.FetchItems.ViewModel.DisplayedItem]
        }
        
        struct Response {
            var response : [IndexPath]
        }
        
        struct ViewModel {
            var indexPath : [IndexPath]
        }
        
    }
    
    
}
