//
//  AvailableFeed.swift
//  TestCardView
//
//  Created by Attapon Peungsook on 24/7/2562 BE.
//  Copyright © 2562 SCB. All rights reserved.
//

import Foundation
import Alamofire

class FeedData {
    
    func feedAvailable(url:String, completion:@escaping ([DataClass]) -> ()) {
        AF.request(URL(string: url)!, method: .get).responseJSON { (response) in
            switch response.result {
            case .success:
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(AvailableLeaveResponse.self, from: response.data!)
                    completion(result.data)
                    break
                } catch {
                    
                }
            case .failure(let error):
                break
            }
        }
    }
    
    func feedVacationPage(url:String, completion:@escaping ([Vacation]) -> ()){
        AF.request(URL(string: url)!, method: .get).responseJSON { (response) in
            switch response.result {
            case .success:
                do{
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(VacationPageResponse.self, from: response.data!)
                    completion(result.data)
//                    print("------ \(result.data[0])")
                    break
                }catch{
                    
                }
            case .failure(let error):
                break
            }
        }
    }
    
    func feedVacationHistoryPage(url:String, completion:@escaping ([VacationHistory]) -> ()){
        
        AF.request(URL(string: url)!, method: .get).responseJSON { (response) in
//            print(response.result)
            switch response.result {
            case .success:
                do{
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(VacationPageHistoryResponse.self, from: response.data!)
                    completion(result.data)
                    //                    print("------ \(result.data[0])")
                    break
                }catch(let error){
                    print(error)
                }
            case .failure(let error):
                print(error)
                break
            }
        }
    }

    

    }
    
    //    func feedTestLoadmore(url:String, completion:@escaping ([Datum]) -> ()){
    //        AF.request(URL(string: url)!, method: .get).response { (response) in
    //            switch response.result {
    //            case .success:
    //                do {
    //                    let decoder = JSONDecoder()
    //                    let result = try decoder.decode(VacationFutureResponse.self, from: response.data!)
    //                    let youtubeBean = result.data
    //                                    print("---- youtubeBean: \(youtubeBean)")
    //                    completion(youtubeBean)
    //                    break
    //                } catch {
    //
    //                }
    //            case .failure(let error):
    //                break
    //            }
    //
    //        }
    //    }
    
    
    //    func feedAvailable(url:String, completion:@escaping (DataClass) -> ()) {
    //        AF.request(URL(string: url)!, method: .get).responseJSON { (response) in
    //            switch response.result {
    //            case .success:
    //                do {
    //                    let decoder = JSONDecoder()
    //                    let result = try decoder.decode(AvailableResponse.self, from: response.data!)
    //                    completion(result.data)
    //                    print("------ \(result)")
    //                    break
    //                } catch {
    //
    //                }
    //            case .failure(let error):
    //                break
    //            }
    //        }
    //    }
    

    

