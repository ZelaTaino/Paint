//
//  LineView.swift
//  Draw
//
//  Created by Glizela Taino on 2/15/17.
//  Copyright © 2017 Glizela Taino. All rights reserved.
//

import UIKit

class LineView: UIView {

    var linePoints = [CGPoint]()
    
    var aPen: Pen!
    
    init(frame: CGRect, pen: Pen) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        aPen = pen
    }
    
    
    override func draw(_ rect: CGRect) {
        
        var path = UIBezierPath()
        
        drawDot(center: linePoints[0])
        
        if linePoints.count > 2{
            path = createQuadPath(points: linePoints)
            path.move(to: linePoints[0])
            path.close()
            path.lineWidth = aPen.getThickness()
            aPen.getColor().set()
            path.stroke()
            
        }
        
        drawDot(center: linePoints[linePoints.count-1])

    }
    
    private func drawDot(center: CGPoint) {
        aPen.getColor().setFill()
        
        let path = UIBezierPath()
        path.addArc(withCenter: center, radius: aPen.getThickness()/2, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true)
        path.fill()
    }
    
    
    func createQuadPath(points: [CGPoint]) -> UIBezierPath {
        let path = UIBezierPath()
        if points.count < 2 { return path }
        let firstPoint = points[0]
        let secondPoint = points[1]
        let firstMidpoint = Functions.midpoint(first: firstPoint, second: secondPoint)
        path.move(to: firstPoint)
        path.addLine(to: firstMidpoint)
        for index in 1 ..< points.count-1 {
            let currentPoint = points[index]
            let nextPoint = points[index + 1]
            let midPoint = Functions.midpoint(first: currentPoint, second: nextPoint)
            path.addQuadCurve(to: midPoint, controlPoint: currentPoint)
        }
        guard let lastLocation = points.last else { return path }
        path.addLine(to: lastLocation)
        return path
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
