//
//  SessionManager.swift
//  Cactus
//
//  Created by Daniyar Agaltsov on 7/29/20.
//  Copyright © 2020 Agaltsov. All rights reserved.
//

import Foundation

protocol SessionManagerDelegate {
    func sessionDidStart(session: Session)
    func sessionTimeLeftChanged(secondsLeft: Int)
    func cancelTimeLeftChanged(secondsLeft: Int)
    func sessionDidEnd(session: Session)
    func sessionDidCancel()
    func showGiveUpButton()
    func hideGiveUpButton()
}

class SessionManager {
    let delegate: SessionManagerDelegate
    
    var sessionTimer: CountdownTimer?
    var cancelPlantingTimer: CountdownTimer?
    
    init(delegate: SessionManagerDelegate) {
        self.delegate = delegate
    }
    
    func startSession(session: Session) {
        sessionTimer = CountdownTimer(durationInSeconds: session.durationInSeconds) { secondsLeft in
            if secondsLeft == 0 {
                  SessionsStorage.shared.addSession(session: session)
//                Balance.shared.addCoins(session.coinsCount)
                self.delegate.sessionDidEnd(session: session)
                self.delegate.hideGiveUpButton()
                
            } else {
                self.delegate.sessionTimeLeftChanged(secondsLeft: secondsLeft)
            }
        }
    
        
        sessionTimer?.start()
        delegate.sessionDidStart(session: session)
    }
    func cancelPlanting(){
        cancelPlantingTimer = CountdownTimer(durationInSeconds: 10){ secondsLeft in
            if secondsLeft == 0{
                self.delegate.showGiveUpButton()
            }
            else{
                self.delegate.cancelTimeLeftChanged(secondsLeft: secondsLeft)
            }
        }
        
        cancelPlantingTimer?.start()
        
    }
    
    func stopSession() {
        sessionTimer?.stop()
        delegate.sessionDidCancel()
    }
    func stopCancelTimer(){
        cancelPlantingTimer?.stop()
        
    }
}
