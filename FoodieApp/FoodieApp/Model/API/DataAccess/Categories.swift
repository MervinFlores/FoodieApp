//
//  Categories.swift
//  FoodieApp
//
//  Created by Mervin Flores on 8/23/19.
//  Copyright © 2019 Mervin Flores. All rights reserved.
//

import Foundation
import Argo
import Curry
import Runes

struct Categories: Argo.Decodable{
    var allCategories: [Category]?
    
    static func decode(_ json: JSON) -> Decoded<Categories> {
        return Categories.init <^> json <||? "categories"
    }
}

struct Category: Argo.Decodable {
    var id: Int?
    var name: String?
    static func decode(_ json: JSON) -> Decoded<Category> {
        
        let category = curry(Category.init)
        return category
            <^> json <|? ["categories", "id"]
            <*> json <|? ["categories", "name"]
    }
}
