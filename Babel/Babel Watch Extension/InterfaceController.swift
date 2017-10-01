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
    var answerValue = 0
    
    lazy var numberItems: [WKPickerItem] = self.pickerItems(with: .number)
    lazy var emojiItems: [WKPickerItem] = self.pickerItems(with: .emoji)
    lazy var colorItems: [WKPickerItem] = self.pickerItems(with: .color)
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        showQuestion()
    }
    
    override func didAppear() {
        answerPicker.setSelectedItemIndex(0)
    }
    
    func pickQuestion(from questions: [String]) {
        questionNumber = questions.count.random()
        questionLabel.setText(questions[questionNumber])
    }
    
    func showQuestion() {
        if let questionType = QuestionType(rawValue: QuestionType.count.random()) {
            switch questionType {
            case .number:
                pickQuestion(from: data.numberQuestions)
                answerPicker.setItems(numberItems)
            case .color:
                pickQuestion(from: data.colorQuestions)
                answerPicker.setItems(colorItems)
            case .emoji:
                pickQuestion(from: data.emojiQuestions)
                answerPicker.setItems(emojiItems)
            }
        }
    }
    
    private func pickerItems(fromTitles titles: [String]) -> [WKPickerItem] {
        
        let items = titles.map {(title: String) -> WKPickerItem in
            let pickerItem = WKPickerItem()
            pickerItem.title = title
            return pickerItem
        }
        return items
    }
    
    private func pickerItems(fromImageNames imageNames: [String]) -> [WKPickerItem] {
        
        let items = imageNames.map {(name: String) -> WKPickerItem in
            let pickerItem = WKPickerItem()
            pickerItem.contentImage = WKImage(imageName: name)
            return pickerItem
        }
        return items
    }
    
    func pickerItems(with questionType: QuestionType) -> [WKPickerItem] {
        
        switch questionType {
        case .number:
            return pickerItems(fromTitles: data.numberAnswers)
        case .emoji:
            return pickerItems(fromTitles: data.emojiAnswers)
        case .color:
            return pickerItems(fromTitles: data.colorAnswers)
        }
    }
    
    
    @IBAction func pickerValueChanged(_ value: Int) {
        
        answerValue = value
    }
    @IBAction func checkAnswer() {
        
        showQuestion()
    }
}
