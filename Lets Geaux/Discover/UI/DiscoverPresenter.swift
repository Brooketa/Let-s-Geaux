import Combine
import UIKit

class DiscoverPresenter {

    private let newsUseCase: NewsUseCaseProtocol
    private let appRouter: AppRouterProtocol

    let dateFormatter = DateFormatter()

    init(newsUseCase: NewsUseCaseProtocol, appRouter: AppRouterProtocol) {
        self.newsUseCase = newsUseCase
        self.appRouter = appRouter
    }

    func fetchNews() -> AnyPublisher<[NewsViewModel], Error> {
        newsUseCase
            .fetchNews()
            .map { $0.map { NewsViewModel(from: $0) } }
            .eraseToAnyPublisher()
    }
}
