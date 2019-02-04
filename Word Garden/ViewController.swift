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
    var wordToGuess = "CODE"
    var lettersGuessed = ""
    let maxNumberOfWrongGuesses = 8
    var wrongGuessesRemaining = 8
    var guessCount = 0
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatUserGuessLabel()
        playAgainButton.isHidden = true
        guessLetterButton.isEnabled = false
    }
    
    func updateUIAfterGuess(){
        guessedLetterField.resignFirstResponder()
        guessedLetterField.text = ""
    }
    
    func formatUserGuessLabel(){
        var revealedWord = ""
        lettersGuessed += guessedLetterField.text!
        
        for letter in wordToGuess {
            if lettersGuessed.contains(letter) {
                revealedWord = revealedWord + " \(letter)"
            } else {
                revealedWord += " _"
            }
        }
        revealedWord.removeFirst()
        userGuessLabel.text = revealedWord
    }

    @IBAction func guessedLetterFieldChanged(_ sender: UITextField) {
        if let letterGuessed = guessedLetterField.text?.last {
            guessedLetterField.text = "\(letterGuessed)"
            guessLetterButton.isEnabled = true
        }else{
            guessLetterButton.isEnabled = false
        }
        
    }
    
    //
    func guessALetter(){
        formatUserGuessLabel()
        guessCount += 1
        let currentGuessedLetter = guessedLetterField.text!
        if !wordToGuess.contains(currentGuessedLetter){
            wrongGuessesRemaining = wrongGuessesRemaining - 1
            flowerView.image = UIImage(named: "flower\(wrongGuessesRemaining)")
        }
        
        let revealedWord = userGuessLabel.text!
        if wrongGuessesRemaining == 0 {
            playAgainButton.isHidden = false
            guessedLetterField.isEnabled = false
            guessLetterButton.isEnabled = false
            guessCountLabel.text = "So Sorry, You Are All Out of Guesses. Try Again?"
        } else if !revealedWord.contains("_"){
            playAgainButton.isHidden = false
            guessedLetterField.isEnabled = false
            guessLetterButton.isEnabled = false
            guessCountLabel.text = "You've got it! It took you \(guessCount) guesses to guess the word!"
        }else{
            let guess = ( guessCount == 1 ? "Guess" : "Guesses")
                
            guessCountLabel.text = "You made \(guessCount) \(guess)"
        }
    }
    
    //
    
    @IBAction func doneKeyPress(_ sender: UITextField) {
        guessALetter()
        updateUIAfterGuess()
        
    }
    @IBAction func guessButtonPressed(_ sender: UIButton) {
        guessALetter()
        updateUIAfterGuess()
    }
    

    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        playAgainButton.isHidden = true
        guessedLetterField.isEnabled = true
        guessLetterButton.isEnabled = false
        flowerView.image = UIImage(named: "flower8")
        wrongGuessesRemaining = maxNumberOfWrongGuesses
        lettersGuessed = ""
        formatUserGuessLabel()
        guessCountLabel.text = "You've Made 0 Guesses"
        guessCount = 0
    }
}

