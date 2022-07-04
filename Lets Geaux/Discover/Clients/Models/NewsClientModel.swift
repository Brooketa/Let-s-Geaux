import Foundation

struct NewsClientModel: Codable {

    var imageURL:String
    var createdAt: Int
    var caption: String
    var title: String
    var description: String

    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
        case createdAt = "created_at"
        case caption = "caption"
        case title = "title"
        case description = "description"
    }

}
