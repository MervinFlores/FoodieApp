//
//  HomeViewController.swift
//  FoodieApp
//
//  Created by Mervin Flores on 8/24/19.
//  Copyright © 2019 Mervin Flores. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.regularNavBar(title: "Home")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
