//
//  SavedDataStore.swift
//  Moolah
//
//  Created by Arvin San Miguel on 7/9/17.
//  Copyright © 2017 Appr1sing Studios. All rights reserved.
//

import Foundation

struct SavedDataClient {
    
    static let shared = SavedDataClient()
    
    private init() {}
    
    func retrieveData(_ completion: @escaping (JSON) -> ()) {
        
        if !NetworkManager.shared.observingNetwork() {
            if let savedData = UserDefaults.standard.value(forKey: "currencies") as? JSON {
                OperationQueue.main.addOperation {
                    completion(savedData)
                }
            } else {
                    completion([:])
            }
        }
    }
    
    
    
}
