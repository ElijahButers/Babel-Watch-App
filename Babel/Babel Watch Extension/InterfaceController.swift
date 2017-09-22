//
//  InterfaceController.swift
//  Babel Watch Extension
//
//  Created by User on 9/20/17.
//  Copyright © 2017 Razeware LLC. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var questionLabel: WKInterfaceLabel!
    @IBOutlet var answerPicker: WKInterfacePicker!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    @IBAction func pickerValueChanged(_ value: Int) {
    }
    @IBAction func checkAnswer() {
    }
    
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
