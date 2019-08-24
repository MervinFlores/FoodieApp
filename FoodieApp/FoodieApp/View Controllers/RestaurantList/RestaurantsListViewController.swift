//
//  RestaurantsListViewController.swift
//  FoodieApp
//
//  Created by Mervin Flores on 8/24/19.
//  Copyright © 2019 Mervin Flores. All rights reserved.
//

import UIKit
import AlamofireImage

class RestaurantsListViewController: BaseViewController {
    
    @IBOutlet weak var tableViewRestaurantsList: UITableView!
    
    var restaurantsList = [Restaurant]()
    var restaurantCategory: Category!
    
    let cellIdentifier = "RestaurantsListTableViewCellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getAllRestaurantList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.withBackButtonNavBar(title: self.restaurantCategory.name ?? "List")
        self.tableViewRestaurantsList.tableFooterView = UIView()
    }
    
    private func getAllRestaurantList(){
        self.view.showLoading()
        GeneralManager.getRestaurantsBy(categoryID: self.restaurantCategory.id!) { (response) in
            self.view.dissmissLoading()
            switch response {
            case .success(let restaurantsList):
                self.restaurantsList = restaurantsList
                self.tableViewRestaurantsList.reloadData()
            case .error:
                break
            }
        }
    }
}

extension RestaurantsListViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.restaurantsList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath) as! RestaurantsListTableViewCell
        
        let restaurantDetailsViewController = UIStoryboard.RestaurantDetails().instantiateViewController(withIdentifier: "RestaurantDetailsViewController") as! RestaurantDetailsViewController
        restaurantDetailsViewController.currentRestaurant = cell.currentRestaurant
        
        self.navigationController?.pushViewController(restaurantDetailsViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier) as! RestaurantsListTableViewCell
        
        cell.fillCell(self.restaurantsList[indexPath.row])
        
        return cell
    }
}

class RestaurantsListTableViewCell: UITableViewCell{
    @IBOutlet weak var labelTitleRest: UILabel!
    @IBOutlet weak var labelCuisine: UILabel!
    @IBOutlet weak var labelLocationRest: UILabel!
    @IBOutlet weak var imageViewRestIcon: UIImageView!
    
    var currentRestaurant: Restaurant!
    
    func fillCell(_ currentRestaurant: Restaurant){
        self.currentRestaurant = currentRestaurant
        self.labelTitleRest.text = currentRestaurant.name ?? ""
        self.labelCuisine.text = currentRestaurant.cuisines ?? ""
        self.labelLocationRest.text = currentRestaurant.location?.localityVerbose ?? ""
        if currentRestaurant.featuredImage!.isEmpty{
            self.imageViewRestIcon.af_setImage(withURL: URL(string: APIConst.imagePlaceholderURL)!)
        } else {
            self.imageViewRestIcon.af_setImage(withURL: URL(string: currentRestaurant.featuredImage!)!)
        }
        
    }
}
