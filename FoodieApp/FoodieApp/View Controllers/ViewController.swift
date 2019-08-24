//
//  ViewController.swift
//  FoodieApp
//
//  Created by Mervin Flores on 8/22/19.
//  Copyright © 2019 Mervin Flores. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        GeneralManager.getCategories { (response) in
            switch response {
            case .success(let category):
                print(category)
            case .error:
                print("error")
            }
        }
    }
}

