//
//  LGNews.swift
//  Let's Geaux
//
//  Created by Brooketa on 12.04.2021..
//

import Foundation

struct LGNews {
    var imageURL:String
    var createdAt: Date
    var caption: String
    var title: String
    var description: String
    
    init(with data:[String:Any]) {
        self.imageURL = data["image_url"] as? String ?? ""
        
        let dateInt = data["created_at"] as? Int ?? 0
        
        self.createdAt = Date(timeIntervalSince1970: TimeInterval(dateInt))
        
        self.caption = data["caption"] as? String ?? ""
        
        self.title = data["title"] as? String ?? ""
        
        self.description = data["description"] as? String ?? ""
    }
}
