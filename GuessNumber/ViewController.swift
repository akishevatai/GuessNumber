//
//  ViewController.swift
//  GuessNumber
//
//  Created by Atai Akishev on 2/19/21.
//

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet weak var easyButton: UIButton!
    
    @IBOutlet weak var hardButton: UIButton!
    
    var easyViewController: EasyViewController?
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        performSegue(withIdentifier: "easy", sender: sender)
        easyViewController?.title = "Hard level"
        easyViewController?.view.backgroundColor = UIColor.blue
    }
    
            
}




/*
 Create game-app:
  two buttons (Easy - Hard) -> Easy (10 lives), hard (5 lives)
  create random number 1...100 -> 45
  textField 60 -> “Too high” lives 9 :heart:
  textField 50 -> “Too high” lives 8
  textField 30 -> “Too low” lives 7
  textField 40 -> “Too low” lives 6
  textField 45 -> “Win!” lives 6
  Alert(“WIN!“) Restart? Yes -> Easy (10 lives), hard (5 lives)
 */

