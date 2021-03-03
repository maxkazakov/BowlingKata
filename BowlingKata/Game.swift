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
         
         r3 = 4 // score = 10 + 4*2
         r4 = 3 // score = 10 + 4*2 + 3*2
         
         r5 = 3 // score = 10 + 10*2 + 3*3
         r6 = 4 // score = 10 + 10*2 + 3*3 + 4*2
         
         r7 = 5 // score = 10 + 10*2 + 3*3 + 4*2 + 5
         r8
         */
        
        var currentRollInFrame = 0 // 0 or 1
        var multipliers = pins.map { _ in 1 }
        
        for (idx, currentPins) in pins.enumerated() {
            currentScore += currentPins * multipliers[idx]
            
            if currentRollInFrame == 0 {
                if currentPins == 10 {
                    strike(idx: idx, multipliers: &multipliers)
                    currentRollInFrame = 0
                } else {
                    currentRollInFrame = 1
                }
            } else {
                currentRollInFrame = 0
                let pinsInFrame = currentPins + pins[idx - 1]
                if pinsInFrame == 10 {
                    spare(idx: idx, multipliers: &multipliers)
                }
            }
        }
        return currentScore
    }
    
    private func spare(idx: Int, multipliers: inout [Int]) {
        let nextIdx = idx + 1
        if nextIdx < multipliers.count {
            multipliers[nextIdx] += 1
        }
    }
    
    private func strike(idx: Int, multipliers: inout [Int]) {
        let nextIdx = idx + 1
        if nextIdx < multipliers.count {
            multipliers[nextIdx] += 1
        }
        let nextNextIdx = idx + 2
        if nextNextIdx < multipliers.count {
            multipliers[nextNextIdx] += 1
        }
    }
    
    func roll(_ pins: Int) {
        let maxNumberOfRolls = Constants.maxNumberOfFrames * Constants.rollPerFrame
        guard currentRoll < maxNumberOfRolls else { return }
        currentRoll += 1
        self.pins.append(pins)
    }
}
