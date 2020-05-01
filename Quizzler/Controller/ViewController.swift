//
//  ViewController.swift
//  Quizzler
//
//  Created by Shikhar Kumar on 1/6/20.
//  Copyright © 2020 Shikhar Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var answerOption1: UIButton!
    @IBOutlet weak var answerOption2: UIButton!
    @IBOutlet weak var answerOption3: UIButton!
    @IBOutlet weak var answerOption4: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizBrain: QuizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateDisplay()
    }
    
    func updateDisplay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.displayQuestion()
            self.updateScoreLabel()
            self.updateProgressBar()
        }
    }
    
    func displayQuestion() {
        questionText.text = quizBrain.getQuestion().getQuestionText()
        
        setAnswerButton(answerOption1, 0)
        setAnswerButton(answerOption2, 1)
        setAnswerButton(answerOption3, 2)
        setAnswerButton(answerOption4, 3)
    }
    
    func setAnswerButton(_ button: UIButton, _ optionIndex: Int) {
        if (quizBrain.getQuestion().getOptions(forIndex: optionIndex) != nil) {
            button.setTitle(quizBrain.getQuestion().getOptions(forIndex: optionIndex), for: .normal)
            button.isHidden = false
        } else {
            button.setTitle("", for: .normal)
            button.isHidden = true
        }
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let optionSelected = sender.tag
        if (quizBrain.checkAnswer(optionSelected)) {
            quizBrain.incrementScore()
            changeButtonColor(sender, UIColor.green)
        } else {
            changeButtonColor(sender, UIColor.red)
        }
        
        quizBrain.incrementQuestion()
        updateDisplay()
    }
    
    func changeButtonColor(_ sender: UIButton, _ color: UIColor) {
        sender.backgroundColor = color
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.backgroundColor = UIColor.clear
        }
    }
    
    func updateScoreLabel() {
        scoreLabel.text = "Score: \(quizBrain.currentScore)"
    }
    
    func updateProgressBar() {
        progressBar.progress = Float(quizBrain.currentScore + 1) / Float(quizBrain.quiz.count)
    }
    
}

