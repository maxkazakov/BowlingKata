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
    
    func test_whenAllSpares() {
        
        for _ in 0..<10 {
            sut.roll(4)
            sut.roll(6)
        }
        
        let score = sut.score()
        XCTAssertEqual(score, (4 + 6) + (4 * 2 + 6) * 9)
    }
    
    func test_whenAllStrikes() {
        
        for _ in 0..<5 {
            sut.roll(10)
        }
        
        let score = sut.score()
        XCTAssertEqual(score, 10 + (10 * 2) + (10 * 3) + (10 * 3) + (10 * 3))
    }
    
    func test_whenOneStrike_andThenOneSpare() {
        
        sut.roll(10)
                
        sut.roll(4)
        sut.roll(6)
        
        sut.roll(6)
        sut.roll(1)
        
        let score = sut.score()
        XCTAssertEqual(score, 10 + (4 + 4 + 6 + 6) + (6 + 6) + 1)
    }
    
    func test_whenOneStrike_andOneRollAfterStrike() {
        
        sut.roll(10)
                
        sut.roll(4)
        
        let score = sut.score()
        XCTAssertEqual(score, 10 + (4 + 4))
    }
    
    func test_whenTwoStrikesInRow() {
        sut.roll(10)
        
        sut.roll(10)
                
        sut.roll(4)
        sut.roll(3)
        
        let score = sut.score()
//        XCTAssertEqual(score, (10 + 10 + 4) + (10 + 4 + 3) + (4 + 3))
        XCTAssertEqual(score, 10 + (10 + 10) + (4 + 4 + 4) + (3 + 3))
    }

    
    func test_whenOneStrike() {
        sut.roll(10)
        
        sut.roll(4)
        sut.roll(3)
        
        let score = sut.score()
//        XCTAssertEqual(score, (10 + 4 + 3) + 4 + 3)
        XCTAssertEqual(score, 10 + 4 + 4 + 3 + 3)
    }
    
    func test_WhenSpareInOtherFrames_thenScoreIsCorrect() {
        sut.roll(3)
        sut.roll(4)
        sut.roll(6)
        
        sut.roll(1)
        
        let score = sut.score()
        XCTAssertEqual(score, 3 + 4 + 6 + 1)
    }
    
    func test_WhenOneSpare_thenScoreIsCorrect() {
        sut.roll(3)
        sut.roll(7)
        
        sut.roll(5)
        
        let score = sut.score()
        XCTAssertEqual(score, 3 + 7 + 5 * 2)
    }
    
    func test_WhenCallRollMaxNumberOfFrames_thenScoreIsNotChanged() {
        // Arrange
        let maxNumberOfRolls = Constants.maxNumberOfFrames * Constants.rollPerFrame
        for _ in 0..<maxNumberOfRolls {
            sut.roll(1)
        }
        
        //Act
        sut.roll(5)
        
        //Assert
        let score = sut.score()
        XCTAssertEqual(score, 1 * maxNumberOfRolls)
    }
    
    func test_WhenCallRollTwice_thenScoreIsCorrect() {
        // Arrange
        
        // Act
        sut.roll(5)
        sut.roll(5)
        
        // Assert
        let score = sut.score()
        XCTAssertEqual(score, 10)
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
