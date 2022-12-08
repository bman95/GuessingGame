//
//  GuessingGameModel.swift
//  GuessingGame
//
//  Created by Brendon Crowe on 12/7/22.
//

import Foundation


enum GameResult {
    case incorrect
    case correct
}

class GuessingGameModel {
    // properties here
    
    // private is an access control modifier. Others are public, internal, filePrivate, open, etc. Public is set on all properties by default
    private let winningNumber: Int
    
    // initializers under properties
    
    init() {
        winningNumber = Int.random(in: 18...21)
    }
    
    // methods under initializers
    
    func userGuessed(number: Int) -> GameResult {
        
        return number == winningNumber ? .correct : .incorrect
    }
    
}
