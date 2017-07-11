//
//  TitleCell.swift
//  Moolah
//
//  Created by Arvin San Miguel on 6/11/17.
//  Copyright © 2017 Appr1sing Studios. All rights reserved.
//

import UIKit

class TitleCell: UITableViewCell {

    private let title = "Currencies"
    let label : UILabel = {
        let lbl = UILabel(frame: .zero)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor.white
        lbl.textAlignment = .left
        lbl.font = TextConstant.futuraBig
        return lbl
    }()
    
    var button : ProceedButton! {
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
        
        addSubview(label)
        label.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        label.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        label.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
        label.text = title
        
        backgroundColor = .clear //ColorConstant.blue
        
    }
    
    fileprivate func setupButton() {
        
        addSubview(button)
        button.frame = .zero
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        button.centerYAnchor.constraint(equalTo: label.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.setNeedsLayout()
        
    }
    
}
