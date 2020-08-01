//
//  SessionsStorage.swift
//  Cactus
//
//  Created by Daniyar Agaltsov on 8/1/20.
//  Copyright © 2020 Agaltsov. All rights reserved.
//

import Foundation

class SessionsStorage{
    
    static let shared = SessionsStorage()
    
    var sessions = [Session]()
    func addSession(session: Session){
        sessions.append(session)
   
        }
    
}
