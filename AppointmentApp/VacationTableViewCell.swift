//
//  VacationTableViewCell.swift
//  TestCardView
//
//  Created by Attapon Peungsook on 22/7/2562 BE.
//  Copyright © 2562 SCB. All rights reserved.
//

import UIKit

class VacationTableViewCell: UITableViewCell {

    @IBOutlet weak var mCard:UIView!
    @IBOutlet weak var mCardLeft:UIView!
    @IBOutlet weak var mCardRigh:UIView!
    @IBOutlet weak var mTopicLabel:UILabel!
    @IBOutlet weak var mDescriptionLabel:UILabel!
    @IBOutlet weak var mTime:UILabel!
    @IBOutlet weak var mDate:UILabel!
    @IBOutlet weak var mMonthYear:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.mCard.layer.cornerRadius = 10
        self.mCard.layer.shadowColor = UIColor.black.cgColor
        self.mCard.layer.shadowOpacity = 0.5
        self.mCard.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.mCard.layer.shadowRadius = 5
        
        self.mCardLeft.roundCorners([.topLeft, .bottomLeft], radius: 10)
        self.mCardRigh.roundCorners([.topRight, .bottomRight], radius: 10)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
