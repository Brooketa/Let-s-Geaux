import Combine
import Foundation

class NewsRepository: NewsRepositoryProtocol {

    private let newsDataSource: NewsDataSourceProtocol

    init(newsDataSource: NewsDataSourceProtocol) {
        self.newsDataSource = newsDataSource
    }

    func fetchNews() -> AnyPublisher<[NewsRepositoryModel], Error> {
        newsDataSource
            .fetchNews()
            .map { $0.map { NewsRepositoryModel(from: $0) } }
            .eraseToAnyPublisher()
    }

}
