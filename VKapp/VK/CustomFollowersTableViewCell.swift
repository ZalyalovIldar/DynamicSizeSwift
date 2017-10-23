//
//  CustomFollowersTableViewCell.swift
//  VK
//
//  Created by Elina on 18/09/2017.
//  Copyright © 2017 Elina. All rights reserved.
//

import UIKit

class CustomFollowersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var statusImageView: UIImageView!
    
    var space: String = " "
    
    func prepareCell(with user: User) {
        
        avatarImageView.image = user.avatar
        nameLabel.text = user.name + space + user.surname
        
        if user.status == "online (моб.)" {
            statusImageView.image = UIImage(assetName: .mobileIcon)
        }
        
        if user.status == "online" {
            statusImageView.image = UIImage(assetName: .point)
        }
        
        if user.status == "offline" {
            statusImageView.image = UIImage(assetName: .empty)
        }
    }
}
