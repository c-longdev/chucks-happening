//
//  MaterialTextField.swift
//  Chucks-Happening
//
//  Created by Chandler on 9/9/16.
//  Copyright © 2016 c-longdev. All rights reserved.
//

import UIKit

class MaterialTextField: UITextField {

    override func awakeFromNib() {
        layer.cornerRadius = 2.0
        layer.borderColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.1).cgColor
        layer.borderWidth = 1.0
        layer.backgroundColor = UIColor.lightGray.cgColor
    }

}
    
