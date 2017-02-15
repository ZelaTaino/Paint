//
//  ViewController.swift
//  Draw
//
//  Created/Users/glizelataino/School/cse438/Draw/Draw/CircleView.swift by Glizela Taino on 2/15/17.
//  Copyright © 2017 Glizela Taino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    var circleCenter = CGPoint.zero
//    var aCircle: CircleView?
//
//    var lineBegins = CGPoint.zero
//    var aLine: LineView?
    
    
    
    
    @IBOutlet weak var drawPad: DrawingPad!
    @IBOutlet weak var thicknessSlider: UISlider!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        drawPad.adjustThickness(thickness: CGFloat(thicknessSlider.value))
        drawPad.changeColor(color: UIColor.init(red: 20/255, green: 160/255, blue: 220/255, alpha: 1))
        
    }
    
    @IBAction func colorPressed(_ sender: UIButton) {
        drawPad.changeColor(color: sender.backgroundColor!)
    }
    
    
    
    @IBAction func clearPressed(_ sender: UIButton) {
        drawPad.clear()
    }
    
    
    @IBAction func undoPressed(_ sender: UIButton) {
        drawPad.undo()
    }
    
    
    @IBAction func thicknessChanged(_ sender: UISlider) {
        drawPad.adjustThickness(thickness: CGFloat(sender.value));
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

