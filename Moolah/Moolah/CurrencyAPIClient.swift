//
//  CurrencyAPIClient.swift
//  Moolah
//
//  Created by Arvin San Miguel on 6/13/17.
//  Copyright © 2017 Appr1sing Studios. All rights reserved.
//

import Foundation
typealias JSON = [ String : Any ]

struct CurrencyAPIClient {
    
    static let shared = CurrencyAPIClient()
    
    private init() {}
    
    func requestCurrentConversion(_ base: String,_ completion: @escaping (JSON) -> ()) {
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        let urlString = Secret.url + base
        let url = URL(string: urlString)
        let task = session.dataTask(with: url!) { data, response, error in
            
            guard let data = data else { fatalError() }
            guard let responseJSON = try? JSONSerialization.jsonObject(with: data, options: []) as! JSON else { return }
            
            OperationQueue.main.addOperation {
                completion(responseJSON)
            }
            
        }
        task.resume()
        
    }
    
}
