//
//  BaseCurrencyCell.swift
//  Moolah
//
//  Created by Arvin San Miguel on 6/19/17.
//  Copyright © 2017 Appr1sing Studios. All rights reserved.
//

import UIKit

class BaseCurrencyCell: UITableViewCell {

    public var title = "USD" {
        willSet {
            currencyName.text = newValue
            setNeedsDisplay()
        }
    }
    
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
    
    public var textField : UITextField = {
        let tf = UITextField(frame: .zero)
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.adjustsFontSizeToFitWidth = true
        tf.textAlignment = .right
        tf.attributedPlaceholder = NSAttributedString(string: "1.00", attributes: [NSForegroundColorAttributeName: UIColor.white])
        tf.font = TextConstant.hvBig
        tf.textColor = UIColor.white
        return tf
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
        
        //Add Base Currency label
        addSubview(currencyName)
        currencyName.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 10).isActive = true
        currencyName.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        currencyName.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4).isActive = true
        currencyName.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        currencyName.text = "USD"
        
        addSubview(countryName)
        countryName.bottomAnchor.constraint(equalTo: currencyName.topAnchor, constant: 5).isActive = true
        countryName.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        countryName.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        countryName.heightAnchor.constraint(equalToConstant: 20).isActive = true
        countryName.text = "United States of America"
        
        addSubview(textField)
        textField.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10).isActive = true
        textField.centerYAnchor.constraint(equalTo: currencyName.centerYAnchor).isActive = true
        textField.leftAnchor.constraint(equalTo: currencyName.rightAnchor).isActive = true
        
        backgroundColor = UIColor.black.withAlphaComponent(0.5)
    }

}
