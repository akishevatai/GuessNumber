//
//  EasyViewController.swift
//  GuessNumber
//
//  Created by Atai Akishev on 2/19/21.
//

import UIKit

class EasyViewController: UIViewController {

        @IBOutlet weak var rangeLbl: UILabel!
        @IBOutlet weak var numberTextField: UITextField!
        @IBOutlet weak var messageLabel: UILabel!
        @IBOutlet weak var numGuessesLbl: UILabel!
        @IBOutlet weak var showLivesLabel: UILabel!
    
    var viewController: ViewController?

    
    enum Compare {
        case Lower
        case Higher
        case Equals
    }
    
    var lowerBound = 0
    var upperBound = 100
    var numberGuesses = 0
    var secretNumber = 0
    
    var lives = 10
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        numberTextField.becomeFirstResponder()
        reset()
        
      
    }
    
    

    @IBAction func okButtonPressed(_ sender: UIButton) {
        print(numberTextField.text!)
        
        let number = numberTextField.text
        
        if let number = number {
            selectedNumber(number: Int(number)!)
        } else {
            let alert = UIAlertController(title: nil, message: "Enter a number to guess", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func selectedNumber(number: Int) {
        
        switch compareNumber(number: number, differentNumber: secretNumber) {
        case .Equals:
            let alert = UIAlertController(title: nil, message: "Congrats you won in \(numberGuesses) guesses", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (_) in
                self.reset()
                self.numberTextField.text = ""
                
            }))
            
        present(alert, animated: true, completion: nil)
        case .Lower:
            lowerBound = max(lowerBound, number)
            messageLabel.text = "Too Low"
            numberTextField.text = ""
            numberGuesses += 1
            rangeLbl.text = "\(lowerBound) .... \(upperBound)"
            numGuessesLbl.text = "Number of Guesses: \(numberGuesses)"
            showLivesLabel.text = "You have \(String(describing: incrementBy(forIncrement: 1))) ❤️"
            
            
        case .Higher:
            upperBound = min(lowerBound, number)
            messageLabel.text = "Too High"
            numberTextField.text = ""
            numberGuesses += 1
            rangeLbl.text = "\(lowerBound) .... \(upperBound)"
            numGuessesLbl.text = "Number of Guesses: \(numberGuesses)"
            showLivesLabel.text = "You have \(lives += 1) ❤️"
        }
        
    }
    
    
    
    
    func compareNumber(number: Int, differentNumber: Int) -> Compare {
       
        if number < differentNumber {
            return .Lower
        } else if number > differentNumber {
            return .Higher
        }
        
        return .Equals
    }
    
    
    func reset() {
        
        lowerBound = 0
        upperBound = 100
        numberGuesses = 0
        lives = 10
        messageLabel.text = ""
        
        
        rangeLbl.text = "\(lowerBound) .... \(upperBound)"
        
        numGuessesLbl.text = "Number Of Guesses: \(numberGuesses)"
        
        
        let difference = upperBound - lowerBound
        let randomNumber = Int(arc4random_uniform(UInt32(difference)))
        secretNumber = randomNumber + Int(lowerBound)
    }
    
    func incrementBy(forIncrement amount: Int) -> () -> Int {
        var runningTotal = 0
        
        func increment() -> Int {
            runningTotal -= amount
            return runningTotal
        }
        return increment
    }
    
    
    
}


