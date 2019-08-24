//
//  ViewController.swift
//  FoodieApp
//
//  Created by Mervin Flores on 8/22/19.
//  Copyright © 2019 Mervin Flores. All rights reserved.
//

import UIKit
import SideMenu

class BaseViewController: UIViewController {
    
    var logoImageView   : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private Funtions
    
    func setTitleView(_ title: String){
        let customView = UIView(frame: CGRect(x: 0, y: 0, width: self.navigationController!.navigationBar.bounds.width*0.3, height: self.navigationController!.navigationBar.bounds.height))
        let customLabel = UILabel(frame: CGRect(x: self.navigationController!.navigationBar.bounds.width*(-0.03), y: 0, width: customView.layer.bounds.width, height: customView.layer.bounds.height))
        customLabel.text = title
        customLabel.lineBreakMode = .byWordWrapping
        customLabel.numberOfLines = 0
        customLabel.textAlignment = .right
        customLabel.textColor = UIColor.white
        customLabel.font = UIFont(name: "Aller-Regular", size: 15.0 - self.sizeFont())
        customView.addSubview(customLabel)
        
        self.navigationItem.titleView = customView
    }
    
    private func sizeFont() -> CGFloat{
        if UIScreen.main.scale == 2.0 {
            return 1
        } else {
            return 0
        }
    }
    
    private func sizeRightButtonWidht() -> CGFloat {
        if UIScreen.main.scale == 2.0 {
            return 108
        } else {
            return 115
        }
    }
    
    // MARK: - Navigation Bar Funtions
    func setupCustomBackButton(){
        let backImage = #imageLiteral(resourceName: "ic_btn_back").withRenderingMode(.alwaysTemplate)
        let back = UIBarButtonItem(image: backImage, style: UIBarButtonItem.Style.plain, target: self, action: #selector(backToPreviousView))
        back.tintColor = #colorLiteral(red: 1, green: 0.5518518206, blue: 0.5154265377, alpha: 1)
        
        self.navigationItem.leftBarButtonItem = back
    }
    
    @objc func backToPreviousView(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func regularNavBar(title: String){
        self.setleftMenuButton()
        self.setupSideMenu()
        self.instantiateSideMenuController()
        self.navigationItem.title = title
    }
    
    func withBackButtonNavBar(title: String){
        self.navigationItem.title = title
        self.setupCustomBackButton()
    }
    
    func setleftMenuButton(){
        let menuButton = UIButton(type: .custom)
        menuButton.setImage(#imageLiteral(resourceName: "ic_burguerMenu").withRenderingMode(.alwaysTemplate), for: .normal)
        menuButton.tintColor = #colorLiteral(red: 1, green: 0.5518518206, blue: 0.5154265377, alpha: 1)
        menuButton.imageEdgeInsets = UIEdgeInsets.init(top: 7.0, left: 0.0, bottom: 7.0, right: 0.0)
        menuButton.frame = CGRect(x: 0, y: 0, width: 40, height: 30)
        menuButton.addTarget(self, action: #selector(self.showSideMenu(sender:)), for: .touchUpInside)
        
        let barMenuButton = UIBarButtonItem(customView: menuButton)
        self.navigationItem.leftBarButtonItem = barMenuButton
    }
    
    // MARK: - MenuSide Methods
    func instantiateSideMenuController() {
        let sideMenu = UIStoryboard.Main().instantiateViewController(withIdentifier: "SideMenu")
        let tableViewController = sideMenu.children.first as? HomeSideMenuViewController
        tableViewController?.delegate = self
        
        SideMenuManager.default.menuRightNavigationController = sideMenu as? UISideMenuNavigationController
    }
    
    
    func setupSideMenu() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let mainNavBar = mainStoryboard.instantiateViewController(withIdentifier: "menuSide") as! HomeSideMenuViewController
        mainNavBar.delegate = self
        
        let menuLeftNavigationController = UISideMenuNavigationController(rootViewController: mainNavBar)
        menuLeftNavigationController.leftSide = true
        
        SideMenuManager.default.menuLeftNavigationController = menuLeftNavigationController
        SideMenuManager.default.menuAnimationBackgroundColor = UIColor.clear
        SideMenuManager.default.menuPresentMode = .menuSlideIn
        SideMenuManager.default.menuFadeStatusBar = false
    }
    
    @objc func showSideMenu(sender: UIButton!) {
        self.present(SideMenuManager.default.menuLeftNavigationController!, animated: true, completion: nil)
    }
    
}

extension BaseViewController: SideMenuCustomDelegate {
    func logoButtonTouched() {
        SideMenuManager.default.menuLeftNavigationController?.dismiss(animated: true, completion: nil)
    }
    
    func appearView(_ view: UIView){
        UIView.animate(withDuration: 0.5, animations: {
            view.alpha = 1.0
        })
    }
    
    func disappearView(_ view: UIView){
        UIView.animate(withDuration: 0.5, animations: {
            view.alpha = 0.0
        })
    }
}
