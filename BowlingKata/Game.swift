//
//  Game.swift
//  BowlingKata
//
//  Created by Максим Казаков on 03.03.2021.
//

import Foundation

struct Constants {
    static let maxNumberOfFrames = 10
    static let rollPerFrame = 2
}

class Game {
    
    private var currentRoll = 0
    private var pins: [Int] = []
    
    func score() -> Int {
        var currentScore = 0
        
        /*
         r1 = 10 // score = 10
         r2 = -
         
         r3 = 10 // score = 10 + 10*2
         r4 = -
         
         r5 = 3 // score = 10 + 10*2 + 3*3
         r6 = 4 // score = 10 + 10*2 + 3*3 + 4*2
         
         r7 = 5 // score = 10 + 10*2 + 3*3 + 4*2 + 5
         r8
         */
        
        var currentRollInFrame = 0 // 0 or 1
        var currentFrame = 0 // from 0 to 9
        var isSpare = false
        
        for (idx, currentPins) in pins.enumerated() {
            if isSpare {
                currentScore += currentPins * 2
                isSpare = false
            } else {
                currentScore += currentPins
            }
            
            if currentRollInFrame == 0 {
                currentRollInFrame = 1
            } else {
                currentRollInFrame = 0
                currentFrame += 1
                let pinsInFrame = currentPins + pins[idx - 1]
                isSpare = pinsInFrame == 10
            }
            
        }
        return currentScore
    }
    
    func roll(_ pins: Int) {
        let maxNumberOfRolls = Constants.maxNumberOfFrames * Constants.rollPerFrame
        guard currentRoll < maxNumberOfRolls else { return }
        currentRoll += 1
        self.pins.append(pins)
    }
}
