import Foundation

struct APIConstants {
    static let venueRequestURL = "https://api.ajmo.hr/v3/venue/dashboard"
    static let eventRequestURL = "https://api.ajmo.hr/v3/event/dashboard"
    static let promotedNewsRequestURL = "https://api.ajmo.hr/v3/news/index?isPromoted=1"
    static let newsRequestURL = "https://api.ajmo.hr/v3/news/index?isPromoted=0&amp;page=1&amp;perPage=10"
}

class WebService {
    
    static func fetchNews(completion: @escaping ([News]?, Error?) -> Void) {
        
        guard let newsURL = URL(string: APIConstants.newsRequestURL) else { return }
        
        Network.request(url: newsURL, completion: { data, error in
            
            if let error = error {
                print("Finished with error: \(error.localizedDescription)")
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, nil)
                return
            }
            
            guard let newsData = data["data"] as? [[String:Any]] else {
                completion(nil, nil)
                return
            }
            
            var newsArray:[News] = [News]()
            
            for news in newsData {
                newsArray.append(News(with: news))
            }
            completion(newsArray, nil)
        })
    }
}
