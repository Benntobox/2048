//
//  Grid.swift
//  2048
//
//  Created by Benjamin Boyle on 2/27/18.
//  Copyright © 2018 Benjamin Boyle. All rights reserved.
//

import Foundation

struct Grid {
    var matrix: [[GridSquare]]
    
    init() {
        matrix = Array(repeatElement(Array(repeatElement(GridSquare(), count: 4)), count: 4))
    }
    
    subscript(x: Int, y: Int) -> GridSquare {
        return matrix[y][x]
    }
    
    func moveBlocks(in direction: Direction) {
        for block in matrix {
            
        }
    }
}

struct GridSquare {
    let value: Int = 0
    
    func compare(to square: GridSquare) -> Bool {
        return self.value == square.value
    }
}

enum Direction {
    case up
    case down
    case left
    case right
}
