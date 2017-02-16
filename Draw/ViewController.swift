//
//  ViewController.swift
//  Draw
//
//  Created/Users/glizelataino/School/cse438/Draw/Draw/CircleView.swift by Glizela Taino on 2/15/17.
//  Copyright © 2017 Glizela Taino. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    var pen:Pen!
    let imagePicker = UIImagePickerController()
    @IBOutlet weak var drawPad: DrawingPad!
    @IBOutlet weak var thicknessSlider: UISlider!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var loadButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pen = Pen(penColor: UIColor.init(red: 20/255, green: 160/255, blue: 220/255, alpha: 1), penThickness: CGFloat(thicknessSlider.value))
        drawPad.aPen = pen
        imagePicker.delegate = self
        imageView.isHidden = true
    }
    
    @IBAction func clearPressed(_ sender: UIButton) {
        drawPad.clear()
    }
    
    
    @IBAction func undoPressed(_ sender: UIButton) {
        drawPad.undo()
    }
    
        @IBAction func colorPressed(_ sender: UIButton) {
        pen.changeColor(penColor: sender.backgroundColor!)
    }
    
    @IBAction func thicknessChanged(_ sender: UISlider) {
        pen.adjustThickness(penThickness: CGFloat(sender.value));
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake{
            drawPad.clear()
        }
    }
    
    @IBAction func loadPressed(_ sender: UIButton) {
        if sender.titleLabel?.text == "Load"{
            sender.setTitle("Remove", for: .normal)
            imageView.isHidden = false
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .camera
            imagePicker.cameraCaptureMode = .photo
            imagePicker.modalPresentationStyle = .fullScreen
            present(imagePicker, animated: true, completion: nil)
        }else{
            sender.setTitle("Load", for: .normal)
            imageView.isHidden = true
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
        loadPressed(loadButton)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

