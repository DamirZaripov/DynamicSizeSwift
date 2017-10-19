//
//  NewsTableViewCell.swift
//  MyVK
//
//  Created by itisioslab on 19.10.17.
//  Copyright © 2017 itisioslab. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var imageInNewsImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    let radiusRoundCorner: CGFloat = 50
    @IBOutlet weak var textInNewsLabel: UILabel!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var repostButton: UIButton!
    @IBOutlet weak var newsImageView: UIImageView!
    
    func prepare(with newsModel: News) {
        textInNewsLabel.text = newsModel.text
        newsImageView.image = newsModel.image
        nameLabel.text = newsModel.name
        surnameLabel.text = newsModel.surname
        dataLabel.text = newsModel.date
        likeButton.setTitle(newsModel.numberOfLikes, for: .normal)
        commentButton.setTitle(newsModel.numberOfComments, for: .normal)
        repostButton.setTitle(newsModel.numberOfReposts, for: .normal)
        avatarImageView.image = newsModel.avatar
        avatarImageView.roundCorners([.bottomLeft, .bottomRight, .topLeft, .topRight], radius: radiusRoundCorner)
    }
    
}
