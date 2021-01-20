//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    var questionIndex: Int = 0
    struct Question {
        var question: String
        var answer: Bool
    }
    var questions : [Question] = []
    let q1 = Question(question: "Do Gabriel likes programming?", answer: true)
    let q2 = Question(question: "Will rain?", answer: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        questions = [q1, q2]
        questionIndex = 0
        questionLabel.text = questions[questionIndex].question
    }

    @IBAction func touchButton(_ sender: UIButton) {
        let selected = (sender.titleLabel!.text! == "True") ? true : false
        let real = questions[questionIndex].answer
        sender.layer.cornerRadius = 20
        sender.layer.borderWidth = 5
        let borderColor:CABasicAnimation = CABasicAnimation(keyPath: "borderColor")
        borderColor.fromValue = UIColor.white.cgColor
        borderColor.duration = 0.5
        if selected == real {
            borderColor.toValue = UIColor.green.cgColor
        } else {
            borderColor.toValue = UIColor.red.cgColor
        }
        sender.layer.add(borderColor, forKey: "borderColor")
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { timer in
            sender.layer.borderWidth = 0
            self.questionIndex += 1
            if self.questionIndex >= self.questions.count {
                self.questionIndex = 0
            }
            self.questionLabel.text = self.questions[self.questionIndex].question
        })
    }
    
}

