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
    
    init() {
        grid = Grid()
    }
    
    func move(_ direction: Direction) {
        grid.moveBlocks(in: direction)
    }
}
