//
//  ViewController.swift
//  WorkSHOP2
//
//  Created by Daniyar Agaltsov on 7/28/20.
//  Copyright © 2020 Agaltsov. All rights reserved.
//

import UIKit

class SessionViewController: UIViewController {

    @IBOutlet  var cactusImage: UIImageView!
    @IBOutlet weak var plantButton: UIButton!

           
   
    
    
    

    @IBAction func buttonPlant() {
        performSegue(withIdentifier: "takeBreakSegue", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cactusImage.layer.cornerRadius = cactusImage.frame.width/2
        cactusImage.layer.masksToBounds = true
        
        plantButton.layer.cornerRadius = 14
        plantButton.layer.masksToBounds = true
        
        
    }


}

