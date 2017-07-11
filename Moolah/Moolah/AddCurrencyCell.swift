//
//  AddCurrencyCell.swift
//  Moolah
//
//  Created by Arvin San Miguel on 7/1/17.
//  Copyright © 2017 Appr1sing Studios. All rights reserved.
//

import UIKit

class AddCurrencyCell: UITableViewCell {
    
    public var countryName : UILabel = {
        let lbl = UILabel(frame: .zero)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        lbl.textAlignment = .left
        lbl.font = TextConstant.futuraMedium
        return lbl
    }()
    
    public var flag : UILabel = {
        let lbl = UILabel(frame: .zero)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor.white
        lbl.textAlignment = .left
        lbl.font = TextConstant.hvSmall
        return lbl
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        
        backgroundColor = .clear //ColorConstant.blue
        
        addSubview(flag)
        flag.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        flag.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        flag.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1).isActive = true
        flag.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        addSubview(countryName)
        countryName.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        countryName.leftAnchor.constraint(equalTo: flag.rightAnchor, constant: 20).isActive = true
        countryName.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
        countryName.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        
        
    }
    
}
