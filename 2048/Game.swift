//
//  Game.swift
//  2048
//
//  Created by Benjamin Boyle on 2/27/18.
//  Copyright © 2018 Benjamin Boyle. All rights reserved.
//

import Foundation

class Game {
    var grid: Grid
    
    init(size: Int) {
        grid = Grid(size)
    }
    
    func move(_ direction: Direction) {
        //grid.moveBlocks(in: direction)
    }
    
    func newBlock() {
        var randomPosition = grid.randomPosition()
        while grid[randomPosition] != nil {
            randomPosition = grid.randomPosition()
        }
        grid[randomPosition] = GridSquare(value: 2, position: randomPosition)
        
    }
}
