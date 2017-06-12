//
//  Currency.swift
//  Moolah
//
//  Created by Arvin San Miguel on 6/11/17.
//  Copyright © 2017 Appr1sing Studios. All rights reserved.
//

import Foundation


struct Currency {
    var countryName: String
    var currencyName: String
    var currencyValue: String
    
    init(countryName: String, currencyName: String, currencyValue: String) {
        self.countryName = countryName
        self.currencyName = currencyName
        self.currencyValue = currencyValue
    }
    
}
