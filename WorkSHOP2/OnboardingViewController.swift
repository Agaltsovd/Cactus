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
    let topTextArray = ["Choose Cactus to Plant","Stay Focused and Productive"]
    let image1 = UIImage(named: "image1")!
    let image2 = UIImage(named: "image2")!
    let image3 = UIImage(named: "image3")!
    
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
            present(nextController, animated: true, completion: nil)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        varButton.layer.cornerRadius = 14
        varButton.layer.masksToBounds = true
       
    }
    

   

}
