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
    
    var data = BabelData()
    var questionNumber = 0
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    func pickQusetion(from questions: [String]) {
        questionNumber = questions.count.random()
        questionLabel.setText(questions[questionNumber])
    }
    
    func showQuestion() {
        if let questionType = QuestionType(rawValue: QuestionType.count.random()) {
            switch questionType {
            case .number:
                pickQusetion(from: data.numberQuestions)
            case .color:
                pickQusetion(from: data.colorQuestions)
            case .emoji:
                pickQusetion(from: data.emojiQuestions)
            }
        }
    }
    
    @IBAction func pickerValueChanged(_ value: Int) {
    }
    @IBAction func checkAnswer() {
    }
}
