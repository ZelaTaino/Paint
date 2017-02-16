//
//  Pen.swift
//  DrawCircles
//
//  Created by Glizela Taino on 2/15/17.
//  Copyright © 2017 Todd Sproull. All rights reserved.
//

import UIKit

class Pen{
    private var color:UIColor
    private var thickness:CGFloat
    
    init(penColor: UIColor, penThickness:CGFloat) {
        color = penColor
        thickness = penThickness
    }
    
    func changeColor(penColor: UIColor){
        color = penColor
    }
    
    func adjustThickness(penThickness: CGFloat){
        thickness = penThickness
    }
    
    func getColor() -> UIColor {
        return color
    }
    
    func getThickness() -> CGFloat {
        return thickness
    }
}
