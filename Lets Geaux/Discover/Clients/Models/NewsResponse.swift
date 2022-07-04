import Foundation

struct NewsResponse: Codable {

    var response: [NewsClientModel]

    enum CodingKeys: String, CodingKey {
        case response = "data"
    }

}
