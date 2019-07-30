//
//  AnnualHistoryViewController.swift
//  TestCardView
//
//  Created by Attapon Peungsook on 23/7/2562 BE.
//  Copyright © 2562 SCB. All rights reserved.
//

import UIKit

class SickHistoryViewController: UIViewController {

    @IBOutlet weak var mHeader:UIView!
    @IBOutlet weak var mImage:UIImageView!
    @IBOutlet weak var mContainerName:UIView!
    @IBOutlet weak var mAvailableDay:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("start")
        self.mHeader.roundCorners([.bottomLeft, .bottomRight], radius: 40)
//        self.mImage = UIImage(named: "dog") as? UIImageView
        self.mImage.makeCircle()
        self.mContainerName.layer.cornerRadius = 10
        self.mContainerName.layer.borderWidth = 0.2
        self.mContainerName.layer.borderColor = UIColor.gray.cgColor
    }
    

    

}
