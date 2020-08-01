//
//  OnboardingViewController.swift
//  WorkSHOP2
//
//  Created by Daniyar Agaltsov on 7/28/20.
//  Copyright © 2020 Agaltsov. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {
    let textArray = ["Next →","Start"]
    let topTextArray = ["Choose\nCactus\nto Plant","Stay Focused\nand Productive!"]
    let image1 = UIImage(named: "Open Doodles")!
    let image2 = UIImage(named: "plant")!
    let image3 = UIImage(named: "onboarding_stay")!
    
    @IBOutlet weak var topText: UILabel!
    
    @IBOutlet weak var imageVIew: UIImageView!
    
    @IBOutlet weak var varButton: UIButton!
    
    
    var count:Int = 0
    
    @IBAction func nextButton() {
        
        let arrayImages = [image2,image3]
        if(count<2){
            
            varButton.setTitle(textArray[count], for: .normal)
            topText.text = topTextArray[count]
            imageVIew.image = arrayImages[count]
            
            count+=1
        }
        else{
            var nextController: SessionViewController
            nextController = storyboard?.instantiateViewController(identifier: "SessionViewController") as! SessionViewController
            nextController.modalPresentationStyle = .fullScreen
            performSegue(withIdentifier: "showSession", sender: nil)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        varButton.layer.cornerRadius = 14
        varButton.layer.masksToBounds = true
       
    }
    

   

}
