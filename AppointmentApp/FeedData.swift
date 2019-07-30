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
    
    func feedAvailable(url:String, completion:@escaping (DataClass) -> ()) {
        AF.request(URL(string: url)!, method: .get).responseJSON { (response) in
            switch response.result {
            case .success:
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(AvailableResponse.self, from: response.data!)
                    completion(result.data)
                    print("------ \(result)")
                    break
                } catch {
                    
                }
            case .failure(let error):
                break
            }
        }
    }
    
    func feedVacation(url:String, completion:@escaping ([Datum]) -> ()){
        AF.request(URL(string: url)!, method: .get).responseJSON { (response) in
            switch response.result {
            case .success:
                do{
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(VacationResponse.self, from: response.data!)
                    completion(result.data)
                    print("------ \(result.data[0])")
                    break
                }catch{
                    
                }
            case .failure(let error):
                break
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
    
    func feedData(url:String, completion:@escaping ([Youtube]) -> ()){
        AF.request(URL(string: url)!, method: .get).responseData { (response) in
            switch response.result {
            case .success:
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(YoutubeResponse.self, from: response.data!)
                    let youtubeBean = result.youtubes
                    print("---- youtubeBean: \(youtubeBean)")
                    completion(youtubeBean)
                    break
                } catch {
                    
                }
            case .failure(let error):
                break
            }
            
        }

    }
    
    
    
}
    

