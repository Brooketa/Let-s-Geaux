import Foundation

struct NewsUseCaseModel {

    var imageURL: URL?
    var createdAt: Date
    var caption: String
    var title: String
    var description: String

    init(from model: NewsRepositoryModel) {
        imageURL = URL(string: model.imageURL)
        createdAt = Date(timeIntervalSince1970: TimeInterval(model.createdAt))
        caption = model.caption
        title = model.title
        description = model.description
    }

}
