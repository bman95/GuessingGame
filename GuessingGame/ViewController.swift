//
//  ViewController.swift
//  GuessingGame
//
//  Created by Brendon Crowe on 12/7/22.
//

import UIKit

class ViewController: UIViewController {
    
    // Mark:- properties and outlets
    
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    
    // guessingGameModel is an instance(also object) of GuessingGameModel which has access to all GuessingGameModel properties, values, methods.
    
    let guessingGameModel = GuessingGameModel()
    var enteredGuesses: Set<String> = []
    
    
    // Mark:- life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // the viewController is assigned as delegate (received from inputTextField) and is listening for changes and will update accordingly
        inputTextField.delegate = self

    }
    
    func checkGuess() {
        let userInput = inputTextField.text ?? ""
        enteredGuesses.insert(userInput)
        let guessNumber = Int(userInput) ?? 0
        let result = guessingGameModel.userGuessed(number: guessNumber)
        messageLabel.text = result == .correct ? "Correct guess 🙌🏻" : "Incorrect guess 👎🏼"
        messageLabel.textColor = .black
    }
}


// Mark:- UITextFieldDelegate methods
extension ViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldBeginEditing")
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // differentiation between multiple text fields
//        if textField == inputTextField {
//        }
       
        guard let text = textField.text else { return false }
        let currentText = text + string
        
        if enteredGuesses.contains(currentText) {
            messageLabel.text = "Already guessed \(currentText)"
            messageLabel.textColor = .red
            
            // clears text field
            textField.text = ""
            
            // prevents user from continuing to type
            return false
        }
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // dismiss keyboard as first responder
        textField.resignFirstResponder()
        // The first responder is whatever UIcontrol is currently ready to respond to actions.
        
        checkGuess()
      
        // Clears text field
        textField.text = ""
        
        return true
    }
        
}
