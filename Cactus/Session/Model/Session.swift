//
//  Session.swift
//  Cactus
//
//  Created by Daniyar Agaltsov on 7/29/20.
//  Copyright © 2020 Agaltsov. All rights reserved.
//

import Foundation

class Session {
    let durationInSeconds: Int
    let startDate: Date
    
    
    init(durationInSeconds: Int, startDate: Date) {
        self.durationInSeconds = durationInSeconds
        self.startDate = startDate
    }
    
    var coinsCount: Int {
        if durationInSeconds <= 30 * 60 {
            return 3
        } else if durationInSeconds <= 60 * 60 {
            return 6
        } else {
            return 9
        }
    }
}
