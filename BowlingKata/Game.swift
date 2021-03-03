//
//  Game.swift
//  BowlingKata
//
//  Created by Максим Казаков on 03.03.2021.
//

import Foundation

class Game {
    
    private var currentScore = 0
    
    func score() -> Int {
        return currentScore
    }
    
    func roll(_ pins: Int) {
        currentScore = pins
    }
}
