import Foundation

struct NewsRepositoryModel {

    var imageURL: String
    var createdAt: Int
    var caption: String
    var title: String
    var description: String

    init(from model: NewsDataModel) {
        imageURL = model.imageURL
        createdAt = model.createdAt
        caption = model.caption
        title = model.title
        description = model.description
    }

}
