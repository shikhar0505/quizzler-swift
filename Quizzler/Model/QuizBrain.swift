//
//  QuizBrain.swift
//  Quizzler
//
//  Created by Shikhar Kumar on 1/8/20.
//  Copyright © 2020 Shikhar Kumar. All rights reserved.
//

import Foundation

class QuizBrain {
    var quiz = [
    Question("What is the day after Christman commonly known as?", ["Caroling Day", "Prayer Day", "Boxing Day"], 3),
    Question("Which animal is the tallest in the world?", ["Elephant", "Giraffe", "Zebra" , "kangaroo"], 2),
    Question("Are pirhanas reptiles?", ["True", "False"], 2),
    Question("In what year did World War 2 end?", ["1943", "1945", "1942"], 2),
    Question("How many dots are there on a six-sided die?", ["17", "19", "20", "21"], 4),
    ]
    
    var currentQuestionIndex = 0
    var currentScore = 0
    
    func getQuestion() -> Question {
        return quiz[currentQuestionIndex]
    }
    
    func incrementQuestion() {
        currentQuestionIndex += 1
        if (currentQuestionIndex >= quiz.count) {
            currentQuestionIndex = 0
            currentScore = 0
        }
    }
    
    func checkAnswer(_ optionSelected: Int) -> Bool {
        return quiz[currentQuestionIndex].getAnswerIndex() == optionSelected
    }
    
    func incrementScore() {
        currentScore += 1
    }
}
