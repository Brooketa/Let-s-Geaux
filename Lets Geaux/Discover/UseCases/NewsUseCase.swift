import Combine
import Foundation

class NewsUseCase: NewsUseCaseProtocol {

    private let newsRepository: NewsRepositoryProtocol

    init(newsRepository: NewsRepositoryProtocol) {
        self.newsRepository = newsRepository
    }

    func fetchNews() -> AnyPublisher<[NewsUseCaseModel], Error> {
        newsRepository
            .fetchNews()
            .map { $0.map { NewsUseCaseModel(from: $0) } }
            .eraseToAnyPublisher()
    }

}
