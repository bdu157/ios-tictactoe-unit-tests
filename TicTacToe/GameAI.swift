//
//  GameAI.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

func game(board: GameBoard, isWonBy player: GameBoard.Mark) -> Bool {
    
    //Check verticals
    for x in 0..<3 {
        var numMarks = 0
        for y in 0..<3 {
            if board[(x, y)] == player {
                numMarks += 1
            }
        }
        if numMarks == 3 {
            return true
        }
    }
    
    //checking horizontal - got this one right
    for y in 0..<3 {
        var numMarks = 0
        for x in 0..<3 {
            if board[(x, y)] == player {
                numMarks += 1
            }
        }
        if numMarks == 3 {
            return true
        }
    }
    
    // check diagonals
    //left to right
    let ltr: [Coordinate] = [(0 ,0), (1, 1), (2, 2)]
    var numMatches = 0
    for coord in ltr {
        if board[coord] == player {
            numMatches += 1
        }
    }
    if numMatches == 3 {return true}
    
    //right to left
    let rtl: [Coordinate] = [(2 ,0), (1, 1), (0, 2)]
    var numMatchess = 0
    for coord in rtl {
        if board[coord] == player {
            numMatchess += 1
        }
    }
    if numMatchess == 3 {return true}
    
    return false
}
