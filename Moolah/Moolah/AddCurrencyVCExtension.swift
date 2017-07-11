//
//  AddCurrencyVCExtension.swift
//  Moolah
//
//  Created by Arvin San Miguel on 7/1/17.
//  Copyright © 2017 Appr1sing Studios. All rights reserved.
//

import Foundation
import UIKit

extension AddCurrencyViewController {
    
    func layoutUI() {
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        tableView.backgroundColor = ColorConstant.midnight
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TitleCell.self, forCellReuseIdentifier: "titleCell")
        tableView.register(AddCurrencyCell.self, forCellReuseIdentifier: "addCurrencyCell")
        
        
    }
    
    
}
