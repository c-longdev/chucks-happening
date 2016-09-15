//
//  CircleView.swift
//  Chucks-Happening
//
//  Created by Chandler on 9/12/16.
//  Copyright © 2016 c-longdev. All rights reserved.
//

import UIKit

class CircleView: UIImageView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GREY, green: SHADOW_GREY, blue: SHADOW_GREY, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
    }
        
    override func layoutSubviews() {

    }
    
}

class ReadButtonRadius: UIImageView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GREY, green: SHADOW_GREY, blue: SHADOW_GREY, alpha: 0.6).cgColor
        layer.cornerRadius = 10.0
        clipsToBounds = true
    }
    
    override func layoutSubviews() {
        
    }
    
}

class UserProfileRadius: UIImageView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GREY, green: SHADOW_GREY, blue: SHADOW_GREY, alpha: 0.6).cgColor
        layer.cornerRadius = 35.0
        clipsToBounds = true
        layer.borderWidth = 3
        layer.borderColor = UIColor(red: 0x99, green: 0x00, blue: 0x00).cgColor
    }
    
    override func layoutSubviews() {
        
    }
    
}
    

