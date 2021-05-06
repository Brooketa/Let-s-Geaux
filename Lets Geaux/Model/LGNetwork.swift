//
//  LGNetwork.swift
//  Let's Geaux
//
//  Created by Brooketa on 12.04.2021..
//

import Foundation
import Alamofire

class LGNetwork {
    static func request(url:URL, completion: @escaping ([String:Any]?, Error?) -> Void) {
        
        AF.request(url).validate().responseJSON(completionHandler: { response in
            switch response.result {
            case .success(let responseData):
                guard let data = responseData as? [String:Any] else {
                    completion(nil,nil)
                    return
                }
                completion(data,nil)
                break
            case .failure(let error):
                completion(nil, error)
                print("\(error)")
                break
            }
        })
        
    }
}
