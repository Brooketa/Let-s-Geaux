import Combine
import Foundation

class NewsDataSource: NewsDataSourceProtocol {

    private let newsClient: NewsClientProtocol

    init(newsClient: NewsClientProtocol) {
        self.newsClient = newsClient
    }

    func fetchNews() -> AnyPublisher<[NewsDataModel], Error> {
        newsClient
            .fetchNews()
            .map { $0.map { NewsDataModel(from: $0) } }
            .eraseToAnyPublisher()
    }

}
