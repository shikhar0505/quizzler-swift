//
//  Question.swift
//  Quizzler
//
//  Created by Shikhar Kumar on 1/8/20.
//  Copyright © 2020 Shikhar Kumar. All rights reserved.
//

import Foundation

struct Question {
    var question: String
    var options: [String]
    var answerIndex: Int
    
    init(_ question: String, _ options: [String], _ answerIndex: Int) {
        self.question = question
        self.options = options
        self.answerIndex = answerIndex
    }
    
    func getQuestionText() -> String {
        return question
    }
    
    func getOptions(forIndex index: Int) -> String? {
        if (index < options.count) {
            return options[index]
        }
        return nil
    }
    
    func getNoOfOptions() -> Int {
        return options.count
    }
    
    func getAnswerIndex() -> Int {
        return answerIndex
    }
}
