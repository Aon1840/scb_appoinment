//
//  CornerCustom.swift
//  TestCardView
//
//  Created by Attapon Peungsook on 21/7/2562 BE.
//  Copyright © 2562 SCB. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.7
        self.layer.shadowOffset = CGSize(width: 10, height: 10)
        self.layer.shadowRadius = 50
    }
    
    func cardTopic() {
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowRadius = 5
    }
    
    func containerShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.1
        self.layer.shadowOffset = CGSize(width: 1, height: 2)
        self.layer.shadowRadius = 10
    }
    
    func makeCircle(_ radius:CGFloat? = nil){
        if let r = radius {
            self.layer.cornerRadius = r
        } else {
            self.layer.cornerRadius = self.frame.width / 2
        }
    }
    
}

//extension UIImageView {
//    func makeCircle2(_ radius:CGFloat? = nil){
//        if let r = radius {
//            self.layer.cornerRadius = r
//        } else {
//            self.layer.cornerRadius = self.frame.width / 2
//        }
//    }
//}
