//
//  LGWebService.swift
//  Let's Geaux
//
//  Created by Brooketa on 12.04.2021..
//

import Foundation



struct APIConstants {
    static let venueRequestURL = "https://api.ajmo.hr/v3/venue/dashboard"
    static let eventRequestURL = "https://api.ajmo.hr/v3/event/dashboard"
    static let promotedNewsRequestURL = "https://api.ajmo.hr/v3/news/index?isPromoted=1"
    static let newsRequestURL = "https://api.ajmo.hr/v3/news/index?isPromoted=0&amp;page=1&amp;perPage=10"
}

class LGWebService {
    
    static func fetchNews(completion: @escaping ([LGNews]?, Error?) -> Void) {
        
        guard let newsURL = URL(string: APIConstants.newsRequestURL) else { return }
        
        LGNetwork.request(url: newsURL, completion: { data, error in
            
            if let error = error {
                print("Finished with error: \(error.localizedDescription)")
                completion(nil, error)
            }
            
            guard let data = data else { return }
            
            guard let newsData = data["data"] as? [[String:Any]] else { return }
            
            var newsArray:[LGNews] = [LGNews]()
            
            for news in newsData {
                newsArray.append(LGNews(with: news))
            }
            completion(newsArray, nil)
        })
    }
}
