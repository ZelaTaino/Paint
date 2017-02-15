//
//  DrawingPad.swift
//  Draw
//
//  Created by Glizela Taino on 2/15/17.
//  Copyright © 2017 Glizela Taino. All rights reserved.
//

import UIKit

class DrawingPad: UIView {
    
    var lineBegins = CGPoint.zero
    var lineThickness: CGFloat!
    var penColor: UIColor!
    var aLine: LineView?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("\(aLine?.lineThickness)")
        guard let touchPoint = touches.first?.location(in: self) else { return }
        print("\(touchPoint)")
        
        lineBegins = touchPoint
        let frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        aLine = LineView(frame: frame, thickness: lineThickness, color: penColor)
        aLine?.linePoints.append(touchPoint)
        //aLine?.lineThickness = 10
        self.addSubview(aLine!)
        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchPoint = touches.first?.location(in: self) else { return }
        aLine?.linePoints.append(touchPoint)
        aLine?.setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchPoint = touches.first?.location(in: self) else { return }
        aLine?.linePoints.append(touchPoint)
    }
    
    func clear(){
        for v in self.subviews{
            v.removeFromSuperview()
        }
    }
    
    func undo(){
        self.subviews.last!.removeFromSuperview()
    }
    
    func adjustThickness(thickness: CGFloat){
        lineThickness = thickness
    }
    
    func changeColor(color: UIColor){
        penColor = color
    }


}
