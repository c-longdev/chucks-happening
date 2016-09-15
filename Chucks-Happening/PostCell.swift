//
//  PostCell.swift
//  Chucks-Happening
//
//  Created by Chandler on 9/12/16.
//  Copyright © 2016 c-longdev. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    var post: Post!
    
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var postedImg: UIImageView!
    @IBOutlet weak var caption: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var dislikesLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(post: Post) {
        self.post = post
        self.caption.text = post.caption
        self.likesLabel.text = "\(post.likes!)"
        
    }

}
