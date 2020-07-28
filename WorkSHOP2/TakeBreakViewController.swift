//
//  TakeBreakViewController.swift
//  WorkSHOP2
//
//  Created by Daniyar Agaltsov on 7/28/20.
//  Copyright © 2020 Agaltsov. All rights reserved.
//

import UIKit

class TakeBreakViewController: UIViewController {

    @IBAction func dismissBreakView() {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBOutlet weak var takeBreakButton: UIButton!
    @IBOutlet weak var cactusImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cactusImage.layer.cornerRadius = cactusImage.frame.width/2
        cactusImage.layer.masksToBounds = true

        takeBreakButton.layer.cornerRadius = 14
        takeBreakButton.layer.masksToBounds = true
    }
    

    

}
