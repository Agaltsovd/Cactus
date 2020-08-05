//
//  ArticleViewController.swift
//  Cactus
//
//  Created by Daniyar Agaltsov on 8/4/20.
//  Copyright © 2020 Agaltsov. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {
    
    var article: Article!

    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var articleTitleLabel: UILabel!
    @IBOutlet weak var articleTextLabel: UILabel!
    
    @IBOutlet weak var profilePictureImage: UIImageView!
    
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var authorSubtitleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = article.title
        articleTextLabel.text = article.text
        articleTitleLabel.text = article.title
        
        authorNameLabel.text = article.author.name
        authorSubtitleLabel.text = article.author.subtitle
        
        
        

        
    }
    

   

}
