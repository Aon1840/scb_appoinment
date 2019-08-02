//
//  CreateVacationViewController.swift
//  AppointmentApp
//
//  Created by Attapon Peungsook on 29/7/2562 BE.
//  Copyright © 2562 SCB. All rights reserved.
//

import UIKit

class CreateVacationViewController: UIViewController{
    
    @IBOutlet weak var m1:UIView!
    @IBOutlet weak var m2:UIView!
    @IBOutlet weak var m3:UIView!
    @IBOutlet weak var m4:UIView!
    @IBOutlet weak var m5:UIView!
    @IBOutlet weak var m2_header:UIView!
    @IBOutlet weak var m3_header:UIView!
    @IBOutlet weak var mButtonEdit:UIButton!
    @IBOutlet weak var mButtonDelete:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        m1.cardTopic()
        m2.cardTopic()
        m3.cardTopic()
        m4.cardTopic()
        m5.cardTopic()
        mButtonEdit.cardTopic()
        mButtonDelete.cardTopic()
        
        mButtonDelete.backgroundColor = UIColor.red
        
        
        
        m2_header.roundCorners([.topLeft, .topRight], radius: 10)
        m2_header.layer.borderWidth = 0.2
        m2_header.layer.borderColor = UIColor.gray.cgColor
        
        
        //        m2_header = UIView.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        //        m2_header.backgroundColor = .red
        //        m2_header.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        let bottomView = CGRect(x: 0,y: 1,width: m2_header.frame.size.width,height: 1)
        //        bottomView.backgroundColor = UIColor.darkGrayColor
        //        m2_header.addSubView(bottomView)
        
        //        self.layer.cornerRadius = 10
        //        self.layer.shadowColor = UIColor.black.cgColor
        //        self.layer.shadowOpacity = 0.3
        //        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        //        self.layer.shadowRadius = 5
        
        //        self.m1.roundCorners([.bottomLeft, .bottomRight], radius: 40)
        //        //        self.mImage = UIImage(named: "dog") as? UIImageView
        //        self.m1.makeCircle()
        //        self.m1.layer.cornerRadius = 10
        //        self.m1.layer.borderWidth = 0.2
        //        self.m1.layer.borderColor = UIColor.gray.cgColor
        
        //        self.m1.layer.cornerRadius = 13.0
        //        self.m1.layer.shadowColor = UIColor.lightGray.cgColor
        //        self.m1.layer.shadowOpacity = 0.5
        //        self.m1.layer.shadowRadius = 10.0
        //        self.m1.layer.shadowOffset = .zero
        //        self.m1.layer.shadowPath = UIBezierPath(rect: self.m1.bounds).cgPath
        //        self.m1.layer.shouldRasterize = true
        
    }
    
    
}
