//
//  AnnualHistoryViewController.swift
//  TestCardView
//
//  Created by Attapon Peungsook on 23/7/2562 BE.
//  Copyright © 2562 SCB. All rights reserved.
//

import UIKit

class OtherHistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var mFeed: FeedData!
    var mDataArray: [VacationHistory] = []
    var mPageIndex:Int = 1
    var mPageSize:Int = 10
    @IBOutlet weak var mHeader:UIView!
    @IBOutlet weak var mImage:UIImageView!
    @IBOutlet weak var mContainerName:UIView!
    @IBOutlet weak var mAvailableDay:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mFeed = FeedData()
        
        self.mHeader.roundCorners([.bottomLeft, .bottomRight], radius: 40)
        self.mImage.makeCircle()
        self.mContainerName.layer.cornerRadius = 10
        self.mContainerName.layer.borderWidth = 0.2
        self.mContainerName.layer.borderColor = UIColor.gray.cgColor
        
//        feedVacationHistory(true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        return mDataArray.count
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "otherCell") as? VacationTableViewCell
        
        return cell!
    }
    
    func feedVacationHistory(_ isLoadMore:Bool) {

    }
    

}
