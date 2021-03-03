//
//  GameTests.swift
//  BowlingKataTests
//
//  Created by Максим Казаков on 03.03.2021.
//

import XCTest
@testable import BowlingKata

class GameTests: XCTestCase {
    var sut: Game!
    
    override func setUp() {
        sut = Game()
    }
    
    
    
    func test_WhenCallRollOnce_thenScoreIsCorrect() {
        // Arrange
        
        // Act
        sut.roll(5)
        
        // Assert
        let score = sut.score()
        XCTAssertEqual(score, 5)
    }
    
    func test_BeforeGameScoreIsZero() {
        // Arrange
        
        // Act
        let score = sut.score()
        
        // Assert
        XCTAssertEqual(score, 0)
    }
    
    override func tearDown() {
        sut = nil
    }
}
