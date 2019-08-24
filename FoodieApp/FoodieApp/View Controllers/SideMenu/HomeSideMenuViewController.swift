//
//  HomeSideMenuViewController.swift
//  FoodieApp
//
//  Created by Mervin Flores on 8/24/19.
//  Copyright © 2019 Mervin Flores. All rights reserved.
//

import UIKit
import SideMenu

protocol SideMenuCustomDelegate {
    func logoButtonTouched()
}

class HomeSideMenuViewController: UITableViewController {
    
    @IBOutlet var menuTableView: UITableView!
    
    var delegate: SideMenuCustomDelegate!
    let cellIdentifier = "menuCell"
    var categories = [Category]()
    
    //segues
    let goToAllShows = "goToAllShows"
    let goToActors = "goToActors"
    let goToFavActors = "goToFavActors"
    let goToFavShows = "goToFavShows"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let container = try! Container()
        let categoriesSaved = container.values(
            Category.self,
            matching: .all
            ).values()
        
        if categoriesSaved.count <= 0{
            self.view.showLoading()
            GeneralManager.getCategories { (response) in
                self.view.dissmissLoading()
                switch response {
                case .success(let categories):
                    self.categories = categories
                    self.menuTableView.reloadData()
                case .error: break
                }
            }
        } else {
            self.categories = categoriesSaved
            self.menuTableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        self.configNavBar()
        guard tableView.backgroundView == nil else {
            return
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Mark: - Private Functions
    
    private func configNavBar(){
        let buttonLogo = UIButton.init(type: .custom)
        buttonLogo.setImage(#imageLiteral(resourceName: "ic_app").withRenderingMode(.alwaysOriginal), for: .normal)
        buttonLogo.frame = CGRect.init(x: 0, y: 0, width: 40, height: 30)
        buttonLogo.imageEdgeInsets = UIEdgeInsets.init(top: 7.0, left: 0.0, bottom: 7.0, right: 0.0)
        buttonLogo.tintColor = .white
        buttonLogo.addTarget(self, action: #selector(self.logoButtonTouched(sender:)), for: .touchUpInside)
        
        let barButtonLogo = UIBarButtonItem.init(customView: buttonLogo)
        self.tableView.reloadData()
        self.navigationItem.leftBarButtonItem = barButtonLogo
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
    }
    
    @objc func logoButtonTouched(sender: UIButton!) {
        self.delegate.logoButtonTouched()
    }
    
    // MARK: - UITableView Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath) as! SideMenuCellTableViewCell
        
        let restaurantsListViewController = UIStoryboard.Main().instantiateViewController(withIdentifier: "RestaurantsListViewController") as! RestaurantsListViewController
        restaurantsListViewController.restaurantCategory = cell.currentCategory
        self.navigationController?.pushViewController(restaurantsListViewController, animated: true)
        
    }
    
    // MARK: - UITableView DataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! SideMenuCellTableViewCell
        
        
        
        cell.fillCell(self.categories[indexPath.row])
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        cell.selectedBackgroundView = backgroundView
        
        return cell
    }
}

class SideMenuCellTableViewCell: UITableViewCell{
    
    @IBOutlet var labelOption: UILabel!
    @IBOutlet var imageViewImage: UIImageView!
    
    var currentCategory: Category!
    
    func fillCell(_ optionCategory: Category){
        self.currentCategory = optionCategory
        self.labelOption.text = optionCategory.name
        self.setupImage()
    }
    
    private func setupImage(){
        var optionImage: UIImage!
        
        switch self.currentCategory.id!{
        case 1: break
        case 2: break
        case 3: break
        case 4: break
        case 5: break
        case 6: break
        case 7: break
        case 8: break
        case 9: break
        case 10: break
        case 11: break
        case 12: break
        case 13: break
        default:break
        }
        
//        self.imageViewImage.image = optionImage.withRenderingMode(.alwaysTemplate)
//        self.imageView?.tintColor = .white
    }
}

