//
//  LeaderboardTableViewCell.swift
//  Cactus
//
//  Created by Daniyar Agaltsov on 8/1/20.
//  Copyright © 2020 Agaltsov. All rights reserved.
//

import UIKit

class LeaderboardTableViewCell: UITableViewCell {

   
    
    @IBOutlet weak var leaderImage: UIImageView!
    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        
    }
    func configure(with leader: Leader){
        let numberOnBoard = Int(LeadersStorage.shared.leaders.firstIndex{$0===leader}!)+1
        numberLabel.text = String(numberOnBoard)
        if numberOnBoard<=3{
            numberLabel.textColor = UIColor(named: "secondaryColor")
        }
        else{
            numberLabel.textColor = UIColor(named: "greyColor")
        }
        numberLabel.text = String(numberOnBoard)
        hoursLabel.text = String(leader.hoursCount)
        nameLabel.text = String(leader.name)
        
    }

  

}
