//
//  PresentsTableViewCell.swift
//  MyVK
//
//  Created by Дамир Зарипов on 24.09.17.
//  Copyright © 2017 itisioslab. All rights reserved.
//

import UIKit

class PresentsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var scrollViewPresents: UIScrollView!
    @IBOutlet weak var numberOfPresentsLabel: UILabel!
    
    let scrollWidth: CGFloat = 1000
    
    func prepareCell(with item: InfoViewModelPresentsItem) {
        scrollViewPresents.contentSize = CGSize(width: scrollWidth, height: scrollViewPresents.frame.size.height)
        numberOfPresentsLabel.text = item.presentsNumbers
        numberOfPresentsLabel.sizeToFit()
    }
    

}
