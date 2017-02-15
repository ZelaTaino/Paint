//
//  colorButton.swift
//  Draw
//
//  Created by Glizela Taino on 2/15/17.
//  Copyright © 2017 Glizela Taino. All rights reserved.
//

import UIKit

class colorButton: UIButton {

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = self.frame.width/2
    }
    

}
