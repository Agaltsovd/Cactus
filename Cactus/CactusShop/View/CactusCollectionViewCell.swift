//
//  CactusCollectionViewCell.swift
//  Cactus
//
//  Created by Daniyar Agaltsov on 8/3/20.
//  Copyright © 2020 Agaltsov. All rights reserved.
//

import UIKit

class CactusCollectionViewCell: UICollectionViewCell {
    
    
   
    @IBOutlet weak var cactusView: UIView!
    
    @IBOutlet weak var cactusImage: UIImageView!
    
    @IBOutlet weak var coinImage: UIImageView!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        
        cactusView.layer.cornerRadius = 16
        cactusView.layer.masksToBounds = true

        cactusImage.layer.cornerRadius = 16
        cactusImage.layer.masksToBounds = true
        
        
    }
    
    func configure( with cactus: Cactus, isSelected: Bool){
        cactusImage.image = UIImage(named: cactus.imageName)!
        if (cactus.imageName != "cactus_1")&&(cactus.imageName != "cactus_2"){
            coinImage.image = UIImage(named: "Coin")
            priceLabel.text = "100"
        }
        else{
            priceLabel.text = ""
        }
        
        cactusView.backgroundColor = isSelected ? UIColor(named: "greenColor") : UIColor(named: "lightGreenColor")
    }
}
