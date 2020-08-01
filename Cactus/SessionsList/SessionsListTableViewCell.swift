//
//  SessionsListTableViewCell.swift
//  Cactus
//
//  Created by Daniyar Agaltsov on 8/1/20.
//  Copyright © 2020 Agaltsov. All rights reserved.
//

import UIKit

class SessionsListTableViewCell: UITableViewCell {

    @IBOutlet weak var cactusImageView: UIImageView!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .clear
        
        cactusImageView.layer.cornerRadius = cactusImageView.frame.width / 2
        cactusImageView.layer.masksToBounds = true
        
    }
    func configure(with session: Session) {
        let hoursCount = session.durationInSeconds/60
        let minutesCount  = session.durationInSeconds%60
        
        var durationText: String!
        if( hoursCount==0){
            durationText = "\(minutesCount)m"
        }
        else if(minutesCount==0){
            durationText = "\(hoursCount)h"
            
        }
        else{
            durationText = "\(hoursCount)h \(minutesCount)m"
        }
        durationLabel.text = durationText
        
        let startDateText = "\(SessionsListTableViewCell.dateFormatter.string(from: session.startDate))"
        startDateLabel.text = startDateText
        
    }
    

    

}
