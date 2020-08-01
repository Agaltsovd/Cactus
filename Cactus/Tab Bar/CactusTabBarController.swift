//
//  CactusTabBarController.swift
//  Cactus
//
//  Created by Daniyar Agaltsov on 8/1/20.
//  Copyright © 2020 Agaltsov. All rights reserved.
//

import UIKit

class CactusTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.tintColor = UIColor(named: "secondaryColor")
        tabBar.barTintColor = UIColor(displayP3Red: 255, green: 255, blue: 255, alpha: 0.5)
    }
    

 

}
