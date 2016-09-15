//
//  ButtonShadows.swift
//  Chucks-Happening
//
//  Created by Chandler on 9/13/16.
//  Copyright © 2016 c-longdev. All rights reserved.
//

import UIKit

class ButtonShadows: UIButton  {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GREY, green: SHADOW_GREY, blue: SHADOW_GREY, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        
    }
    
}
