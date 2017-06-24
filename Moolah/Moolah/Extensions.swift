//
//  Extensions.swift
//  Moolah
//
//  Created by Arvin San Miguel on 6/15/17.
//  Copyright © 2017 Appr1sing Studios. All rights reserved.
//

import Foundation


extension Double {
    func roundTo(places num: Int) -> Double {
        let divisor = pow(10.0, Double(num))
        return (self * divisor).rounded() / divisor
        
    }
    
}
