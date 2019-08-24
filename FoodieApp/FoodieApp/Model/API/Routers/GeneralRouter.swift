//
//  GeneralRouter.swift
//  FoodieApp
//
//  Created by Mervin Flores on 8/23/19.
//  Copyright © 2019 Mervin Flores. All rights reserved.
//

import Foundation
import Alamofire

enum GeneralRouter: URLRequestConvertible {
    case getCategories
    
    var method: HTTPMethod {
        switch self {
        case .getCategories:
            return .get
            
        }
    }
    
    var path: String {
        switch self {
        case .getCategories:
            return "/categories"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try APIConst.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        default:
            break
        }
        
        return urlRequest
    }
    
}
