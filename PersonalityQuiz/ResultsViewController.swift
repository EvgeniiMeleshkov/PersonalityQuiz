//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Евгений Мелешков on 26.09.2021.
//

import UIKit


class ResultsViewController: UIViewController {
    var responses: [Answer]
    init?(coder: NSCoder, responses: [Answer]) {
        self.responses = responses
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultDefinitionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
    }
    
    func calculatePersonalityResult() {
      let frequencyOfAnswers = responses.reduce(into: [:]) {
        (counts, answer) in
            counts[answer.type, default: 0] += 1
        }
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 >
           $1.1 }.first!.key
        
        resultAnswerLabel.text = "You are a\(mostCommonAnswer.rawValue)!"
        
        resultDefinitionLabel.text = mostCommonAnswer.definition
    }
    
    
    
}
