//
//  RestaurantDetailsViewController.swift
//  FoodieApp
//
//  Created by Mervin Flores on 8/24/19.
//  Copyright © 2019 Mervin Flores. All rights reserved.
//

import UIKit
import AlamofireImage

class RestaurantDetailsViewController: BaseViewController {
    
    @IBOutlet weak var imageViewThumbRest: UIImageView!
    @IBOutlet weak var imageViewOnlineDelivery: UIImageView!
    @IBOutlet weak var imageViewDeliveryNow: UIImageView!
    @IBOutlet weak var labelTitleRest: UILabel!
    @IBOutlet weak var labelTiming: UILabel!
    @IBOutlet weak var labelFullAddress: UILabel!
    @IBOutlet weak var labelCostForTwo: UILabel!
    
    var currentRestaurant: Restaurant!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupUI()
    }
    
    private func setupUI(){
        self.withBackButtonNavBar(title: "Details")
        if currentRestaurant.featuredImage!.isEmpty{
            self.imageViewThumbRest.af_setImage(withURL: URL(string: APIConst.imagePlaceholderURL)!)
        } else {
            self.imageViewThumbRest.af_setImage(withURL: URL(string: currentRestaurant.featuredImage!)!)
        }
        
        if self.currentRestaurant.hasOnlineDelivery == 1{
            self.imageViewOnlineDelivery.image = #imageLiteral(resourceName: "ic_tick_check")
        } else {
            self.imageViewOnlineDelivery.image = #imageLiteral(resourceName: "ic_cross_uncheck")
        }
        
        if self.currentRestaurant.isDeliveringNow == 1{
            self.imageViewDeliveryNow.image = #imageLiteral(resourceName: "ic_tick_check")
        } else {
            self.imageViewDeliveryNow.image = #imageLiteral(resourceName: "ic_cross_uncheck")
        }
        
        self.labelTitleRest.text = self.currentRestaurant.name ?? ""
        self.labelCostForTwo.text = "\(self.currentRestaurant.averageCostForTwo ?? 0) \(self.currentRestaurant.currency ?? "")"
        self.labelFullAddress.text = self.currentRestaurant.location?.address ?? ""
        self.labelTiming.text = self.currentRestaurant.timings ?? ""
    }

}
