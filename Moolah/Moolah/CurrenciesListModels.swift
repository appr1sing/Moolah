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
        
        struct Request {}
        
        struct Response {
            var currencies: [Currency]
        }
        
        struct ViewModel {
            struct DisplayedItem {
                var countryName: String?
                var currencyName: String?
                var currencyValue: String?
            }
            
            var displayedItems: [DisplayedItem]
            
        }
        
    }
    
    struct Delete {
        
        struct Request {
            var index = 0
        }
        
        struct Response {
            var index = 0
            var successfully: Bool
        }
        
        struct ViewModel {
            struct Error {
                var alertController: UIAlertController
            }
            struct Successful {
                var indexPath: IndexPath
            }
        }
        
    }
    
}

