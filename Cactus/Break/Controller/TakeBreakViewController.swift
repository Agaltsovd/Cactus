//
//  TakeBreakViewController.swift
//  WorkSHOP2
//
//  Created by Daniyar Agaltsov on 7/28/20.
//  Copyright © 2020 Agaltsov. All rights reserved.
//

import UIKit

class TakeBreakViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, BreakManagerDelegate {
   
    
    
    

    @IBAction func dismissBreakView() {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBOutlet weak var takeBreakButton: UIButton!
    @IBOutlet weak var cactusImage: UIImageView!
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var finishBreakButton: UIButton!
    
    @IBOutlet weak var countdownLabel: UILabel!
    @IBOutlet weak var topLabel: UILabel!
    
    lazy var breakManager = BreakManager(delegate: self)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cactusImage.layer.cornerRadius = cactusImage.frame.width/2
        cactusImage.layer.masksToBounds = true

        takeBreakButton.layer.cornerRadius = 14
        takeBreakButton.layer.masksToBounds = true
        
        finishBreakButton.layer.cornerRadius = 14
        finishBreakButton.layer.masksToBounds = true
        finishBreakButton.layer.borderWidth = 1
        finishBreakButton.layer.borderColor = UIColor(named: "darkGrey")?.cgColor
        
        pickerView.delegate = self
        pickerView.dataSource = self
    }
   
    
    @IBAction func didTapTakeBreak() {
        let selectedRow = pickerView.selectedRow(inComponent: 0)
        let selectedDuration = durations[selectedRow]
        
        let aBreak = Break(durationsInSeconds: selectedDuration)
        breakManager.startBreak(aBreak: aBreak)
    }
    
    @IBAction func didTapFinishBreak() {
        breakManager.cancelBreak()
    }
    
    
    
    // PickerDataSource/Delegate
    
    let durations = [5,10,15,20,25,30]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
       }
  
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         return durations.count
     }
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         return "\(durations[row]) mins"
     }
    
    // BreakManagerDelegate
    
    func breakDidStart(aBreak: Break) {
        showTimeLeft(secondsLeft: aBreak.durationInSeconds)
        pickerView.isHidden = true
        takeBreakButton.isHidden = true
        
        countdownLabel.isHidden = false
        topLabel.isHidden = false
        finishBreakButton.isHidden = false
    }
    
    
    func showTimeLeft(secondsLeft: Int) {
        countdownLabel.text = String(format: "%02d:%02d", secondsLeft / 60, secondsLeft % 60)
    }
    
    func breakTimeLeftChanged(secondsLeft: Int) {
        showTimeLeft(secondsLeft: secondsLeft)
    }
    
    func breakDidEnd(aBreak: Break) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    func breakDidCancel() {
        
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    

}
