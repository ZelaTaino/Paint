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
    var penColor: UIColor!
    var aLine: LineView?
    var aPen: Pen!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchPoint = touches.first?.location(in: self) else { return }
        lineBegins = touchPoint
        let frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        aLine = LineView(frame: frame, pen: aPen)
        aLine?.linePoints.append(touchPoint)
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
            if v != self.subviews.first{
                v.removeFromSuperview()
            }
        }
    }
    
    func undo(){
        if self.subviews.last != self.subviews.first{
            self.subviews.last!.removeFromSuperview()
        }
    }


}
