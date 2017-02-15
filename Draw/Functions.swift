//
//  Functions.swift
//  Draw
//
//  Created by Glizela Taino on 2/15/17.
//  Copyright © 2017 Glizela Taino. All rights reserved.
//

import UIKit

class Functions {
    static func midpoint(first: CGPoint, second: CGPoint) -> CGPoint {
        let x = (first.x + second.x)/2
        let y = (first.y + second.y)/2
        return CGPoint(x: x, y: y)
    }
}

