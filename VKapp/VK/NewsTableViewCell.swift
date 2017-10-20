//
//  NewsTableViewCell.swift
//  VK
//
//  Created by Elina on 08/10/2017.
//  Copyright © 2017 Elina. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var usersAvatarImage: UIImageView!
    
    @IBOutlet weak var usersName: UILabel!
    @IBOutlet weak var countOfLikes: UILabel!
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var newsLabel: UILabel!
    
    @IBOutlet weak var newsPicture: UIImageView!
    
    func prepare(with text: String, picture: UIImage, userName: String, usersAvatar: UIImage) {
        newsLabel.text = text
        newsPicture.image = picture
        usersName.text = userName
        usersAvatarImage.image = usersAvatar
    }
    
    func prepare(with text: String, userName: String, usersAvatar: UIImage) {
        newsLabel.text = text
        usersName.text = userName
        usersAvatarImage.image = usersAvatar
    }
}
