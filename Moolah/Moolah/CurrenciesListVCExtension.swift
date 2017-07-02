//
//  ViewControllerExtension.swift
//  Moolah
//
//  Created by Arvin San Miguel on 6/12/17.
//  Copyright © 2017 Appr1sing Studios. All rights reserved.
//

import UIKit

extension CurrenciesListViewController {
    
    func layoutUI() {
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        tableView.backgroundColor = ColorConstant.blue
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BaseCurrencyCell.self, forCellReuseIdentifier: "baseCell")
        tableView.register(CurrencyCell.self, forCellReuseIdentifier: "currencyCell")
        tableView.register(TitleCell.self, forCellReuseIdentifier: "titleCell")
        tableView.register(FooterViewCell.self, forCellReuseIdentifier: "footerCell")
        
        activityIndicator.activityIndicatorViewStyle = .white
        activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 30, height: 30)
        activityIndicator.center = view.center
        view.addSubview(activityIndicator)
        
    }
    
}
