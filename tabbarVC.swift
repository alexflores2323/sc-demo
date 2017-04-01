//
//  tabbarVC.swift
//  insta
//
//  Created by Logan Caracci on 3/2/17.
//  Copyright © 2017 Logan Caracci. All rights reserved.
//

import UIKit

class tabbarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // color of item
        self.tabBar.tintColor = .white
        
        // color of background
        self.tabBar.barTintColor = UIColor(red: 37.0 / 255.0, green: 39.0 / 255.0, blue: 42.0 / 255.0, alpha: 1)
        
        // disable translucent
        self.tabBar.isTranslucent = false

        // Do any additional setup after loading the view.
    }

}
