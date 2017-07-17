//
//  NetworkManager.swift
//  Moolah
//
//  Created by Arvin San Miguel on 7/8/17.
//  Copyright © 2017 Appr1sing Studios. All rights reserved.
//

import Foundation
import Alamofire


class NetworkManager {
    
    static let shared = NetworkManager()
    
    static let reachabilityMgr = NetworkReachabilityManager()
    
    static var status : Bool {
        return (NetworkManager.reachabilityMgr?.isReachable)! || (NetworkManager.reachabilityMgr?.isReachableOnEthernetOrWiFi)! ? true : false
    }
    
    private init() {}
    
    func observingNetwork() -> Bool {
        
        let reachability = NetworkReachabilityManager(host: Secret.url + "USD")
        reachability?.listener = { status in
            switch status {
            case .notReachable, .unknown:
                print("The network is not reachable")
            case .reachable(.ethernetOrWiFi), .reachable(.wwan):
                print("The network is reachable")
            }
        }
        reachability?.startListening()
        
        return (reachability?.isReachable)! ? true : false
        
    }
    
}

