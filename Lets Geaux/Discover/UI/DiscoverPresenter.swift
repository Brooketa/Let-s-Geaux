import Combine
import UIKit

class DiscoverPresenter {

    private let newsUseCase: NewsUseCaseProtocol
    private let appRouter: AppRouterProtocol

    private let formatter = DateFormatter()

    init(newsUseCase: NewsUseCaseProtocol, appRouter: AppRouterProtocol) {
        self.newsUseCase = newsUseCase
        self.appRouter = appRouter

        formatter.dateFormat = "dd.MM.yyyy"
    }

    func fetchNews() -> AnyPublisher<[NewsViewModel], Error> {
        newsUseCase
            .fetchNews()
            .map {
                $0.compactMap { [weak self] model in
                    guard let self = self else { return nil }

                return NewsViewModel(imageURL: model.imageURL,
                              createdAt: self.getFormattedDate(date: model.createdAt),
                              caption: model.caption,
                              title: model.title,
                              description: model.description)
                }
            }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }

    private func getFormattedDate(date: Date) -> String {
        return formatter.string(from: date)
    }

    func showNewsDetails(viewModel: NewsViewModel) {
        appRouter.showNewsDetails(with: viewModel)
    }

}
