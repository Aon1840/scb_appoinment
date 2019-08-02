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
import Alamofire

class DashboardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var mFeed: FeedData!
    var mDataArray: [Vacation] = []
    var mDataAvailable : [DataClass] = []
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
        
//        test()
    }
    
    func test() {
        AF.request("http://192.168.109.73:8080/api/vacation/create?userId=42232", method: .post, parameters: [
            "typeId": 4, "subject":"Subject","description": "headache","value": 1,"startDate": 1564160402,"endDate": 1564160402], encoding: JSONEncoding.default, headers: nil).responseJSON { (result) in
            switch result.result {
            case .success:
                print("----- test success")
                print(result)
            case .failure:
                print("----- test failure")
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? VacationTableViewCell
        let item = mDataArray[indexPath.row]
        
        switch item.typeID {
        case 1:
            cell?.mCardLeft.backgroundColor = UIColor(red: 154.0/255, green: 110.0/255, blue: 179.0/255, alpha: 1.0)
            break
        case 2:
            cell?.mCardLeft.backgroundColor = UIColor.init(red: 80.0/255, green: 151.0/255, blue: 213.0/255, alpha: 1.0)
            break
        case 3:
            cell?.mCardLeft.backgroundColor = UIColor.init(red: 101.0/255, green: 200.0/255, blue: 122.0/255, alpha: 1.0)
            break
        default:
            cell?.mCardLeft.backgroundColor = UIColor.init(red: 108.0/255, green: 128.0/255, blue: 156.0/255, alpha: 1.0)
            break
        }
        
        cell?.mTopicLabel.text = item.subject
        cell?.mDescriptionLabel.text = item.datumDescription
        
        let unixMiiliseconds: Int = Int(item.startDate * 1000)
        let date = Date.init(timeIntervalSince1970: Double(unixMiiliseconds/1000))

        let format1 = DateFormatter()
        let format2 = DateFormatter()
        format1.dateFormat = "MMM,yyyy"
        format2.dateFormat = "dd"
        let yearMonth = format1.string(from: date)
        let day = format2.string(from: date)
        cell?.mMonthYear.text = yearMonth
        cell?.mDate.text = day
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("----- Selected row: \(indexPath.row)")
//        mTableView.deselectRow(at: indexPath, animated: true)
//        
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let newViewController = storyBoard.instantiateViewController(withIdentifier: "create") as! CreateVacationViewController
//        self.present(newViewController, animated: true, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! HistoryViewController
        if segue.identifier == "historyAnnual" {
            destinationVC.availableDay = mAnnualAvailable.text!
            destinationVC.topic = "ANNUAL"
            destinationVC.typId = 3
            print("historyAnnual")
        } else if segue.identifier == "historyPersonal" {
            destinationVC.availableDay = mPersonalAvailable.text!
            destinationVC.topic = "PERSONAL"
            destinationVC.typId = 2
            print("historySick")
        } else if segue.identifier == "historySick" {
            destinationVC.availableDay = mSickAvailable.text!
            print("------ mSickAvailable: \(mSickAvailable.text)")
            destinationVC.topic = "SICK"
            destinationVC.typId = 1
            print("historyPersonal")
        } else {
            destinationVC.availableDay = mOtherAvailable.text!
            destinationVC.topic = "OTHER"
            destinationVC.typId = 4
            print("historyOther")
        }
    }
    
    
    func feedVacationData(_ isLoadMore:Bool){
//        let _url = "http://192.168.108.152:9999/apigateway/vacation/getAvailableLeaveDayByUserId?userId=9"
        let _url = "http://192.168.109.73:8080/api/vacation/getAvailableLeaveDayByUserId?userId=9"
        self.mFeed.feedAvailable(url: _url, completion: { (result) in
            print("result: \(result)")
            print("result: \(result[0].day)")
            self.mDataAvailable += result
            
            self.mAnnualAvailable.text = String(result[2].day)
            self.mSickAvailable.text = String(result[0].day)
            self.mPersonalAvailable.text = String(result[1].day)
            self.mOtherAvailable.text = String(result[3].day + result[4].day)
        })
        
//        let baseUrl = "http://192.168.108.152:9999/apigateway/vacation/getListByUserId?userId=9&pageNo=1"
        let baseUrl = "http://192.168.109.73:8080/api/vacation/getListByUserId?userId=9&pageNo=1"
//        let url = String(format: "%@?username=admin&password=password&page=%i&size=%i", arguments: [baseUrl, mPageIndex, mPageSize])
        self.mFeed.feedVacationPage(url: baseUrl) { (result) in
            do {
                if isLoadMore == true {
                    self.mDataArray.removeAll()
                }
                self.mDataArray += result
                
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
                print("catch: \(error)")
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

