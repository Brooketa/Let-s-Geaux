//
//  LGNews.swift
//  Let's Geaux
//
//  Created by Brooketa on 12.04.2021..
//

import Foundation

struct LGNews {
    var imageURL:String
    var createdAt: String
    var caption: String
    var title: String
    var description: String
    
    init(with data:[String:Any]) {
        self.imageURL = data["image_url"] as? String ?? ""
        
        let dateInt = data["created_at"] as? Int ?? 0
        
        let date = Date(timeIntervalSince1970: TimeInterval(dateInt))
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        
        self.createdAt = dateFormatter.string(from: date)
        
        self.caption = data["caption"] as? String ?? ""
        
        self.title = data["title"] as? String ?? ""
        
        let desc = data["description"] as? String ?? ""
        
        self.description = String(htmlEncodedString: desc)!
    }
}
