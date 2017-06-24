//
//  Currency.swift
//  Moolah
//
//  Created by Arvin San Miguel on 6/11/17.
//  Copyright © 2017 Appr1sing Studios. All rights reserved.
//

import Foundation


struct Currency : Equatable {
    var countryName: String
    var currencyName: String
    var currencyValue: Double
    
    init(_ countryName: String, currencyName: String, currencyValue: Double) {
        self.countryName = countryName
        self.currencyName = currencyName
        self.currencyValue = currencyValue
    }
    
}

func ==(lhs: Currency, rhs: Currency) -> Bool {
    return lhs.countryName == rhs.countryName &&
           lhs.currencyName == rhs.currencyName &&
           lhs.currencyValue == lhs.currencyValue
}
