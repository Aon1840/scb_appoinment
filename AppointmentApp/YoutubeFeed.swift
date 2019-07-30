//
//  YoutubeFeed.swift
//  AppointmentApp
//
//  Created by Attapon Peungsook on 29/7/2562 BE.
//  Copyright © 2562 SCB. All rights reserved.
//

import Foundation
import Alamofire

class YoutubeFeed {
    
    func feed(url:String, completion:@escaping ([Youtube]) -> ()) {
        AF.request(URL(string: url)!, method: .get).responseJSON { (response) in
            switch response.result {
            case .success:
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(YoutubeResponse.self, from: response.data!)
                    completion(result.youtubes)
                    print("------ \(result)")
                    break
                } catch {
                    
                }
            case .failure(let error):
                break
            }
        }
    }
}
