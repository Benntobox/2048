//
//  ViewController.swift
//  2048
//
//  Created by Benjamin Boyle on 2/27/18.
//  Copyright © 2018 Benjamin Boyle. All rights reserved.
//

import UIKit

let gridSize = 4

class ViewController: UIViewController {
    
    var game = Game(size: gridSize)

    var imageViews: [[UIView]] = {
        var arrayOfArrays = [[UIView]]()
        for _ in 0..<gridSize {
            var array = [UIView]()
            for _ in 0..<gridSize {
                array.append(UIView())
            }
            arrayOfArrays.append(array)
        }
        return arrayOfArrays
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for row in 0..<gridSize {
            for col in 0..<gridSize {
                let v = UIView()
                v.layer.borderWidth = 1
                v.layer.borderColor = UIColor.black.cgColor
                view.addSubview(v)
                imageViews[col][row] = v
            }
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        var gameRect = view.bounds
        gameRect.size.height -= 50
        
        let edge = gameRect.width / CGFloat(gridSize)
        
        for row in 0..<gridSize {
            for col in 0..<gridSize {
                let rect = CGRect(x: edge * CGFloat(col),
                                  y: edge * CGFloat(row),
                                  width: edge,
                                  height: edge)
                imageViews[col][row].frame = rect
            }
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

