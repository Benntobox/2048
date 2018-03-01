//
//  Grid.swift
//  2048
//
//  Created by Benjamin Boyle on 2/27/18.
//  Copyright © 2018 Benjamin Boyle. All rights reserved.
//

import Foundation

struct Grid {
    private var matrix: [[GridSquare?]]
    private let size: Int
    
    init(_ size: Int) {
        self.size = size
        matrix = Array(repeatElement(Array(repeatElement(nil, count: size)), count: size))
    }
    
    subscript(x: Int, y: Int) -> GridSquare? {
        get {
            return matrix[y][x]
        }
        set {
            matrix[y][x] = newValue
        }
    }
    
    subscript(index: Position) -> GridSquare? {
        get {
            return matrix[index.y][index.x]
        }
        set {
            matrix[index.y][index.x] = newValue
        }
    }
    
    func getPosition(for value: Int) -> Position {
        return (value % size, value / size)
    }
        
    func getIndex(for position: Position) -> Int {
        return position.y * size + position.x
    }
    
    func moveDown(_ block: GridSquare) {
        
    }
    
    func move(_ block: GridSquare, in direction: Direction) -> Position {
        let position = block.position
        switch direction {
        case .up:
            return (position.x, position.y - 1)
        case .down:
            return (position.x, position.y + 1)
        case .left:
            return (position.x - 1, position.y)
        case .right:
            return (position.x + 1, position.y)
        }
    }
    
    func checkMove(for block: GridSquare, in direction: Direction) -> Bool {
        let newPosition = move(block, in: direction)
        let inBounds = matrix.indices.contains(getIndex(for: newPosition))
        let isNotFull = self[newPosition] == nil
        return inBounds && isNotFull 
    }
    
    func randomPosition() -> Position {
        return getPosition(for: Int(arc4random_uniform(UInt32(size * size))))
    }
    
    mutating func addBlock(at position: Position) {
        self[position] = GridSquare(value: 2, position: position)
    }
}

struct GridSquare {
    var value: Int
    var position: Position
    
    func compare(to square: GridSquare) -> Bool {
        return self.value == square.value
    }
}

typealias Position = (x: Int, y: Int)

enum Direction {
    case up
    case down
    case left
    case right
}
