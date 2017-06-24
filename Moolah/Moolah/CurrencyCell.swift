//
//  CurrencyCell.swift
//  Moolah
//
//  Created by Arvin San Miguel on 6/20/17.
//  Copyright © 2017 Appr1sing Studios. All rights reserved.
//

import UIKit

class CurrencyCell: UITableViewCell {

    public var countryName : UILabel = {
        let lbl = UILabel(frame: .zero)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor.white
        lbl.textAlignment = .left
        lbl.font = TextConstant.hvUL
        return lbl
    }()
    
    public var currencyName : UILabel = {
       let lbl = UILabel(frame: .zero)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor.white
        lbl.textAlignment = .left
        lbl.font = TextConstant.hvBig
        return lbl
    }()
    
    public var currencyValue : UILabel = {
        let lbl = UILabel(frame: .zero)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor.white
        lbl.textAlignment = .right
        lbl.font = TextConstant.hvBig
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
        
        backgroundColor = ColorConstant.blue
        
        addSubview(currencyName)
        currencyName.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 10).isActive = true
        currencyName.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        currencyName.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4).isActive = true
        currencyName.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        addSubview(countryName)
        countryName.bottomAnchor.constraint(equalTo: currencyName.topAnchor, constant: 5).isActive = true
        countryName.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        countryName.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        countryName.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        addSubview(currencyValue)
        currencyValue.centerYAnchor.constraint(equalTo: currencyName.centerYAnchor).isActive = true
        currencyValue.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        currencyValue.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        currencyValue.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
    }

}
