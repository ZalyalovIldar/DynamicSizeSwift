//
//  CustomTableViewCell.swift
//  DynamicSwift
//
//  Created by Ildar Zalyalov on 16.10.2017.
//  Copyright © 2017 Ildar Zalyalov. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var subtitleLabel: UILabel!
    
    @IBOutlet weak var imageViewButtomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var textView: UITextView!
    
    func configureCell(with image: UIImage, title: String, subtitile: String, text: String) {
        
        
        if text.isEmpty {
            textView.isHidden = true
            imageViewButtomConstraint.priority = UILayoutPriority.defaultHigh
            avatarImageView.isHidden = true
        }
        
        avatarImageView.image = image
        titleLabel.text = title
        subtitleLabel.text = subtitile
        textView.text = text
    }
}
