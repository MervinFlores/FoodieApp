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
    case getRestaurantsBy(categoryID: Int)
    
    var method: HTTPMethod {
        switch self {
        case .getCategories:
            return .get
        case .getRestaurantsBy:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getCategories:
            return "/categories"
        case .getRestaurantsBy:
            return "/search"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try APIConst.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .getRestaurantsBy(let categoryID):
            let searchParams = ["category": categoryID]
            urlRequest = try URLEncoding.queryString.encode(urlRequest, with: searchParams)
            
        default:
            break
        }
        
        return urlRequest
    }
    
}
