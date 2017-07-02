//
//  ProceedButton.swift
//  Moolah
//
//  Created by Arvin San Miguel on 7/1/17.
//  Copyright © 2017 Appr1sing Studios. All rights reserved.
//

import UIKit

class ProceedButton: UIButton {

    var isOn: Bool = false
    
    override func draw(_ rect: CGRect) {
        ProceedIconSK.drawCanvas1(frame: bounds, resizing: .aspectFit)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buttonPressed() {
        activateButton(bool: !isOn)
    }
    
    private func activateButton(bool: Bool) {
        isOn = bool
        UIView.animate(withDuration: 0.2, animations: {
            self.alpha = 0.3
        }) { _ in
            self.alpha = 1.0
        }
        
    }
    
}
