//
//  ViewController.swift
//  WorkSHOP2
//
//  Created by Daniyar Agaltsov on 7/28/20.
//  Copyright © 2020 Agaltsov. All rights reserved.
//

import UIKit

class SessionViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, SessionManagerDelegate {
 
    
  
    
   
    
    
    
    

    @IBOutlet  var cactusImage: UIImageView!
    
    @IBOutlet weak var plantButton: UIButton!
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var giveUpButton: UIButton!
    
    @IBOutlet weak var cancelButton: UIButton!
    
    
    
    lazy var sessionManager = SessionManager(delegate: self)

    @IBAction func buttonPlant() {
//        performSegue(withIdentifier: "takeBreakSegue", sender: nil)
        let selectedPickerRow = pickerView.selectedRow(inComponent: 0)
        let selectedDuration = durations[selectedPickerRow]
        
        let session = Session(durationInSeconds: selectedDuration)
        sessionManager.startSession(session: session)
        sessionManager.cancelPlanting()
        
    }
    
    @IBAction func didTapGiveUpButton() {
        sessionManager.stopSession()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cactusImage.layer.cornerRadius = cactusImage.frame.width/2
        cactusImage.layer.masksToBounds = true
        
        plantButton.layer.cornerRadius = 14
        plantButton.layer.masksToBounds = true
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        giveUpButton.layer.borderColor = UIColor(named: "greyColor")?.cgColor
        giveUpButton.layer.borderWidth = 1
        giveUpButton.layer.cornerRadius = 14
        giveUpButton.layer.masksToBounds = true
        
        
        
    }
    // PickerDataSource/Delegate
    
    let durations = [10,20,30,40,50,60,70,80,90,100,110,120]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return durations.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(durations[row]) mins"
    }
    
    //SessionManagerDelegate
       
    func sessionDidStart(session: Session) {
        showTimeLeft(secondsLeft: session.durationInSeconds)
        cancelTimeLeftChanged(secondsLeft: 10)
        
        
        pickerView.isHidden = true
        plantButton.isHidden = true
        
        giveUpButton.isHidden = true
        cancelButton.isHidden = false
        timeLabel.isHidden = false
        
    }
    func showTimeLeft(secondsLeft:Int){
        timeLabel.text = String(format: "%02d:%02d", secondsLeft/60,secondsLeft%60)
    }
    func showCancelTimeLeft(secondsLeft: Int){
        cancelButton.setTitle("Cancel(\(secondsLeft))", for: .normal)
    }
    
    func sessionTimeLeftChanged(secondsLeft: Int) {
        showTimeLeft(secondsLeft: secondsLeft)
    }
    func cancelTimeLeftChanged(secondsLeft: Int) {
        showCancelTimeLeft(secondsLeft: secondsLeft)
    }
    
    func showGiveUpButton() {
        giveUpButton.isHidden = false
        
        cancelButton.isHidden = true
        
    }
    
    @IBAction func didTapCancelButton() {
        sessionManager.stopSession()
        pickerView.isHidden = false
        plantButton.isHidden = false
        giveUpButton.isHidden = true
        timeLabel.isHidden = true
        cancelButton.isHidden = true
    }
    
    func sessionDidEnd(session: Session) {
        performSegue(withIdentifier: "takeBreakSegue", sender: nil)
        pickerView.isHidden = false
        plantButton.isHidden = false
        
        giveUpButton.isHidden = true
        timeLabel.isHidden = true
        cancelButton.isHidden = true
        
    }
       
    func sessionDidCancel() {
        pickerView.isHidden = false
        plantButton.isHidden = false
        giveUpButton.isHidden = true
        timeLabel.isHidden = true
        cancelButton.isHidden = true
    }

}


