//
//  ViewController.swift
//  Word Garden
//
//  Created by 18ericz on 2/3/19.
//  Copyright © 2019 18ericz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userGuessLabel: UILabel!
    @IBOutlet weak var guessedLetterField: UITextField!
    @IBOutlet weak var guessLetterButton: UIButton!
    @IBOutlet weak var guessCountLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var flowerView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func updateUIAfterGuess(){
        guessedLetterField.resignFirstResponder()
        guessedLetterField.text = ""
    }

    @IBAction func guessedLetterFieldChanged(_ sender: UITextField) {
        updateUIAfterGuess()
    }
    
    @IBAction func doneKeyPress(_ sender: UITextField) {
        updateUIAfterGuess()
        
    }
    @IBAction func guessButtonPressed(_ sender: UIButton) {
        updateUIAfterGuess()
    }
    

    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
    }
}

