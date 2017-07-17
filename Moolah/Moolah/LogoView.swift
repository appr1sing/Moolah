//
//  LogoView.swift
//  Moolah
//
//  Created by Arvin San Miguel on 7/12/17.
//  Copyright © 2017 Appr1sing Studios. All rights reserved.
//

import UIKit

class LogoView: UIView {

    override func draw(_ rect: CGRect) {
        LogoIconSK.drawCanvas(frame: bounds, resizing: .aspectFill)
    }

}
