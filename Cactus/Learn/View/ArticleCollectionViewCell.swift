//
//  ArticleCollectionViewCell.swift
//  Cactus
//
//  Created by Daniyar Agaltsov on 8/3/20.
//  Copyright © 2020 Agaltsov. All rights reserved.
//

import UIKit

class ArticleCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var card_view: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var subTitleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
      
        
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        
        card_view.layer.cornerRadius = 16
        card_view.layer.masksToBounds = true
        
        
    }
    
    func configure(with article: Article){
        titleLabel.text = article.title
        subTitleLabel.text = article.subtitle
        
    }
}
