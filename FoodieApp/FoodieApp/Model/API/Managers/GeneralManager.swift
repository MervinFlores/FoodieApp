//
//  GeneralManager.swift
//  FoodieApp
//
//  Created by Mervin Flores on 8/23/19.
//  Copyright © 2019 Mervin Flores. All rights reserved.
//

import Foundation

class GeneralManager {
    
    //MARK: - Get Categories
    
    enum getCategoriesCallback {
        case success([Category])
        case error
    }
    
    typealias getCategoriesCallbacks = (getCategoriesCallback) -> Void
    
    static func getCategories(callback: @escaping getCategoriesCallbacks){
        
        APIClient.executeRequest(req: APIClient.request(GeneralRouter.getCategories), onSuccess: { (res: Categories?, _) in
            if let response = res{
                callback(.success(response.allCategories!))
            } else {
                callback(.error)
            }
        }) { (error, _) in
            callback(.error)
        }
    }
}
