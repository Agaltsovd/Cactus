//
//  Article.swift
//  Cactus
//
//  Created by Daniyar Agaltsov on 8/3/20.
//  Copyright © 2020 Agaltsov. All rights reserved.
//

import Foundation

class Article {
    let title: String
    let subtitle: String
    let text: String
    let author: Author
    
    init(title: String, subtitle: String, text: String, author: Author) {
        self.title = title
        self.subtitle = subtitle
        self.text = text
        self.author = author
    }
}
