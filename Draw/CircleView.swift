//
//  CircleView.swift
//  Draw
//
//  Created by Glizela Taino on 2/15/17.
//  Copyright © 2017 Glizela Taino. All rights reserved.
//

import UIKit

class CircleView: UIView {

    var aCircle: Circle?{
        didSet{
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        UIColor.blue.setFill()
        
        let path = UIBezierPath()
        
        path.addArc(withCenter: aCircle!.center, radius: aCircle!.radius, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true)
        path.fill()
        
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
