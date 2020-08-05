//
//  LearnViewController.swift
//  Cactus
//
//  Created by Daniyar Agaltsov on 8/3/20.
//  Copyright © 2020 Agaltsov. All rights reserved.
//

import UIKit

class LearnViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    let articleStorage = ArticlesStorage()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Learn"
        
//        collectionView.collectionViewLayout = layoutForCollectionView()
//        let url = URL(string: "https://ios-cactus-app.herokuapp.com/learn?offset=0&limit=10")!
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if let error = error{
//                print(error.localizedDescription)
//            }
//            if let data
//        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let article = articleStorage.articles[indexPath.row]
        
        performSegue(withIdentifier: "showArticle", sender: nil)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articleStorage.articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "article_cell", for: indexPath) as! ArticleCollectionViewCell
        let article = articleStorage.articles[indexPath.row]
        cell.configure(with: article)
        
        return cell
    }
    
    
    func layoutForCollectionView() -> UICollectionViewCompositionalLayout{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(279))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: itemSize, subitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        section.interGroupSpacing = 16
        
        
        return UICollectionViewCompositionalLayout(section: section)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        
        
        if let articleVC = segue.destination as? ArticleViewController{
            
            let selectedIndexPath = collectionView.indexPathsForSelectedItems!.first
            let selectedArticle = articleStorage.articles[selectedIndexPath!.row]
            
            articleVC.article = selectedArticle
        }
    }
    
    //Mark: - Loading
    
    
}
