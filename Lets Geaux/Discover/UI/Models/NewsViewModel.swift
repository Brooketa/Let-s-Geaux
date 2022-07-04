import Foundation

struct NewsViewModel {

    var imageURL: URL?
    var createdAt: Date
    var caption: String
    var title: String
    var description: String

    init(from model: NewsUseCaseModel) {
        imageURL = model.imageURL
        createdAt = model.createdAt
        caption = model.caption
        title = model.title
        description = model.description
    }

}
