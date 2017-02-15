//
//  ViewController.swift
//  Draw
//
//  Created/Users/glizelataino/School/cse438/Draw/Draw/CircleView.swift by Glizela Taino on 2/15/17.
//  Copyright © 2017 Glizela Taino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var circleCenter = CGPoint.zero
    var aCircle: CircleView?

    var lineBegins = CGPoint.zero
    var aLine: LineView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchPoint = touches.first?.location(in: self.view) else { return }
        print("\(touchPoint)")
//        //make a dot
//        circleCenter = touchPoint
//        
//        //create a frame
//        let frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
//        //create circle object
//        aCircle = CircleView(frame: frame)
//        //set circle properties
//        aCircle?.aCircle = Circle(center: touchPoint, radius: 10)
//        //add to subview
//        view.addSubview(aCircle!)
        
        lineBegins = touchPoint
        let frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        aLine = LineView(frame: frame)
        aLine?.linePoints.append(touchPoint)
        aLine?.aCircle = Circle(center: touchPoint, radius: 10)
        view.addSubview(aLine!)

        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchPoint = touches.first?.location(in: view) else { return }
        aLine?.linePoints.append(touchPoint)
        aLine?.setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchPoint = touches.first?.location(in: view) else { return }
        aLine?.linePoints.append(touchPoint)
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

