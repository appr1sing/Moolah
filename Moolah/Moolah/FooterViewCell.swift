//
//  FooterViewCell.swift
//  Moolah
//
//  Created by Arvin San Miguel on 6/29/17.
//  Copyright © 2017 Appr1sing Studios. All rights reserved.
//

import UIKit

class FooterViewCell: UITableViewCell {

    private let label : UILabel = {
        let lbl = UILabel(frame: .zero)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor.white
        lbl.textAlignment = .left
        lbl.font = TextConstant.hvUS
        return lbl
    }()

    var button : AddButton! {
        didSet {
            setupButton()
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        
        backgroundColor = ColorConstant.blue
        
        addSubview(label)
        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        label.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        label.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        label.numberOfLines = 0
        label.text = "All rates are based from the European Central Bank."

    }
    
    fileprivate func setupButton() {
        
        addSubview(button)
        button.frame = .zero
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        button.centerYAnchor.constraint(equalTo: label.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.white.cgColor
        self.setNeedsLayout()
        
    }
    
}
