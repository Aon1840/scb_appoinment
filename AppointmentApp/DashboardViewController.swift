//
//  ViewController.swift
//  AppointmentApp
//
//  Created by Attapon Peungsook on 28/7/2562 BE.
//  Copyright © 2562 SCB. All rights reserved.
//

import UIKit
import SPStorkController
import MJRefresh

class DashboardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var mFeed: FeedData!
    var mDataArray: [Datum] = []
    var mDataYoutube: [Youtube] = []
    var mPageIndex:Int = 1
    var mPageSize:Int = 10
    let transitionDelegate = SPStorkTransitioningDelegate()
    
    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var mAnnualAvailable:UILabel!
    @IBOutlet weak var mSickAvailable:UILabel!
    @IBOutlet weak var mPersonalAvailable:UILabel!
    @IBOutlet weak var mOtherAvailable:UILabel!
    @IBOutlet weak var mViewAnnual:UIView!
    @IBOutlet weak var mViewSick:UIView!
    @IBOutlet weak var mViewPersonal:UIView!
    @IBOutlet weak var mViewOther:UIView!
    @IBOutlet weak var mContainer:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // inital FeedData
        self.mFeed = FeedData()
        
        // mContainer shadow
        self.mContainer.containerShadow()
        
        // mView corner radius
        mViewAnnual.cardTopic()
        mViewSick.cardTopic()
        mViewPersonal.cardTopic()
        mViewOther.cardTopic()
        
        // add plus symbol to right hader
        let editImage = UIImage(named: "add")!
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createVacation))
        navigationItem.rightBarButtonItems = [add]
        
        // inistal load more
        let header = MJRefreshGifHeader()
        header.setRefreshingTarget(self, refreshingAction: #selector(headerRefresh))
        self.mTableView.mj_header = header
        self.mTableView.mj_footer = MJRefreshAutoFooter()
        self.mTableView.mj_footer.setRefreshingTarget(self, refreshingAction: #selector(footerRefresh))
        
        // call function feedVacationData
        feedVacationData(true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mDataYoutube.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? VacationTableViewCell
//        let item = mDataArray[indexPath.row]
        
//        switch item.typeID {
//        case "1":
//            cell?.mCardLeft.backgroundColor = UIColor(red: 212.0/255, green: 139.0/255, blue: 128.0/255, alpha: 1.0)
//        case "2":
//            cell?.mCardLeft.backgroundColor = UIColor.init(red: 126.0/255, green: 162.0/255, blue: 193.0/255, alpha: 1.0)
//        case "3":
//            cell?.mCardLeft.backgroundColor = UIColor.init(red: 117.0/255, green: 188.0/255, blue: 169.0/255, alpha: 1.0)
//        default:
//            cell?.mCardLeft.backgroundColor = UIColor.init(red: 169.0/255, green: 147.0/255, blue: 183.0/255, alpha: 1.0)
//        }
        
//        cell?.mTopicLabel.text = item.subject
//        cell?.mDescriptionLabel.text = item.datumDescription
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? VacationTableViewCell
        let item = mDataYoutube[indexPath.row]
        cell?.mTopicLabel.text = item.title
        cell?.mDescriptionLabel.text = item.subtitle
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("----- Selected row: \(indexPath.row)")
        mTableView.deselectRow(at: indexPath, animated: true)
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "create") as! CreateVacationViewController
        self.present(newViewController, animated: true, completion: nil)
        
    }
    
    
    func feedVacationData(_ isLoadMore:Bool){
        let _url = "http://192.168.1.58:3000/api1"
        self.mFeed.feedAvailable(url: _url, completion: { (result) in
            self.mAnnualAvailable.text = String(result.vacationLeave)
            self.mSickAvailable.text = String(result.sickLeave)
            self.mPersonalAvailable.text = String(result.personalLeave)
            self.mOtherAvailable.text = String(result.other)
        })
        
        let baseUrl = "http://codemobiles.com/adhoc/youtubes/index.php"
        let url = String(format: "%@?username=admin&password=password&page=%i&size=%i", arguments: [baseUrl, mPageIndex, mPageSize])
        self.mFeed.feedData(url: url) { (result) in
            do {
                if isLoadMore == true {
                    self.mDataYoutube.removeAll()
                }
                self.mDataYoutube += result
                
                // update page index
                if (result.count > 0) {
                    self.mPageIndex += 1
                }
                
                self.mTableView.reloadData()
                self.mTableView.mj_header.endRefreshing()
                
                if result.count < self.mPageSize {
                    // no more data
                    self.mTableView.mj_footer.endRefreshingWithNoMoreData()
                } else {
                    // has more data
                    self.mTableView.mj_footer.endRefreshing()
                }
                
            } catch {
                
            }
        }
    }
    
    @objc
    func headerRefresh(){
        self.mPageIndex = 1
        self.feedVacationData(true)
    }
    
    @objc
    func footerRefresh(){
        self.feedVacationData(false)
    }
    
    @objc
    func createVacation() {
        let storyboard2 = UIStoryboard(name: "Main", bundle: nil)
        let modal = storyboard2.instantiateViewController(withIdentifier: "create")
        presentAsStork(modal)
        print("add")
    }
    
    


}

