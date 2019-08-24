//
//  CategoryObj.swift
//  FoodieApp
//
//  Created by Mervin Flores on 8/23/19.
//  Copyright © 2019 Mervin Flores. All rights reserved.
//

import Foundation
import RealmSwift

final class CategoryObject: Object {
    
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

extension Category: Persistable {
    
    public init(managedObject: CategoryObject) {
        
        self.id = managedObject.id
        self.name = managedObject.name
        
    }
    
    
    public func managedObject() ->  CategoryObject {
        
        let categoryObj = CategoryObject()
        
        categoryObj.id = self.id ?? 0
        categoryObj.name = self.name ?? ""
        
        return categoryObj
    }
}

extension Category {
    
    public enum Query: QueryType {
        
        case id(Int)
        case all
        
        public var predicate: NSPredicate? {
            switch
            self {
            case .id(let value):
                return NSPredicate(format: "id == %@", value)
            case .all:
                return nil
            }
        }
        
        public var sortDescriptors: [SortDescriptor] {
            return [SortDescriptor(keyPath: "id")]
        }
    }
    
    public enum PropertyValue: PropertyValueType {
        
        case id(Int)
        
        public var propertyValuePair: PropertyValuePair {
            
            switch self {
                
            case .id(let id):
                return ("id", id)
            }
        }
    }
}
