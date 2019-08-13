//
//  GameBoardTests.swift
//  TicTacToeTests
//
//  Created by Dongwoo Pae on 8/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe  //because it this has a different target you need to import this here
/*
 (0, 0) (1, 0) (2, 0)
 (0, 1) (1, 1) (2, 1)
 (0, 2) (1, 2) (2, 2)
*/

class GameBoardTests: XCTestCase {
    
    func testCreatingEmptyBoard() {
        let board = GameBoard()
        
        for x in 0..<3 {
            for y in 0..<3 {
                XCTAssertNil(board[(x, y)])  // given x and y is equal to nil -> make sure you give a message
            }
        }
    }
    
    func testPlacingMarks() {
        var board = GameBoard()
        
        //writing to the board
        XCTAssertNoThrow(try board.place(mark: .o, on: (0, 0)))
        
        //if this coordinatate has an o mark
        XCTAssertEqual(board[(0, 0)], .o)
        
        //writing to the board
        XCTAssertNoThrow(try board.place(mark: .x, on: (2, 2)))
        
        //if this coordinatete has x mark
        XCTAssertEqual(board[(2, 2)], .x)
        
        for x in 0..<3 {
            for y in 0..<3 {
                if x == 0 && y == 0 {
                    continue
                }
                if x == 2 && y == 2 {
                    continue
                }
                XCTAssertNil(board[(x, y)])
            }
        
    }
        
        //make sure you can't change an already marked square
        XCTAssertThrowsError(try board.place(mark: .x, on: (0, 0))) { (error) in
            XCTAssertEqual(error as? GameBoardError, GameBoardError.invalidSquare)
        }
    }
    
    func testIsFull() {
        
        //testing if this fills all parts
        var board = GameBoard()
        
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (0, 1))
        try! board.place(mark: .x, on: (1, 0))
        try! board.place(mark: .o, on: (2, 0))
        try! board.place(mark: .x, on: (0, 2))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (2, 1))
        try! board.place(mark: .x, on: (1, 2))
        XCTAssertFalse(board.isFull)
        
        try! board.place(mark: .x, on: (2, 2))
        XCTAssertTrue(board.isFull)
    }
}

