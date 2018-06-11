//
//  ViewController.swift
//  Quiz
//
//  Created by Eric Liu on 6/11/18.
//  Copyright © 2018 Eric Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var questionLable: UILabel! 

    @IBOutlet weak var answerLabel: UILabel!
    
    let questions: [String] = ["What is the best mobile OS?",
                               "What is 7 + 7?",
                               "What is the 'R' in RGB"]
    
    let answers: [String] = [
                            "Android",
                            "14",
                            "Red"
                            ]
    
    var currentQuestionIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLable.text = questions[currentQuestionIndex]
    }
    
    @IBAction func showNextQuestion(_ sender: UIButton){
        currentQuestionIndex += 1
        
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0;
        }
        
        let question = questions[currentQuestionIndex]
        questionLable.text = question
        answerLabel.text = "???"
    }
    
    
    @IBAction func showAnswers(_ sender: UIButton) {
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
}

