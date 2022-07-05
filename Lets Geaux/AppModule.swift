import UIKit
import Resolver

class AppModule {

    private lazy var container: Resolver = {
        let container = Resolver()
        registerDependencies(in: container)
        return container
    }()

    private lazy var appRouter: AppRouter = {
        container.resolve()
    }()

    func start(in window: UIWindow) {
        appRouter.start(in: window)
        appRouter.showDiscover()
    }

}

private extension AppModule {

    func registerDependencies(in container: Resolver) {
        registerClients(in: container)
        registerDataSources(in: container)
        registerRepositories(in: container)
        registerUseCases(in: container)
        registerPresenters(in: container)
        registerViewControllers(in: container)
        registerAppRouter(in: container)
    }

    private func registerClients(in container: Resolver) {
        container
            .register { NewsClient() }
            .implements(NewsClientProtocol.self)
            .scope(.application)
    }

    private func registerDataSources(in container: Resolver) {
        container
            .register { NewsDataSource(newsClient: container.resolve()) }
            .implements(NewsDataSourceProtocol.self)
            .scope(.application)
    }

    private func registerRepositories(in container: Resolver) {
        container
            .register { NewsRepository(newsDataSource: container.resolve()) }
            .implements(NewsRepositoryProtocol.self)
            .scope(.application)
    }

    private func registerUseCases(in container: Resolver) {
        container
            .register { NewsUseCase(newsRepository: container.resolve()) }
            .implements(NewsUseCaseProtocol.self)
            .scope(.application)
    }

    private func registerPresenters(in container: Resolver) {
        container
            .register { DiscoverPresenter(newsUseCase: container.resolve(), appRouter: container.resolve()) }
            .scope(.unique)
    }

    private func registerViewControllers(in container: Resolver) {
        container
            .register { DiscoverViewController(presenter: container.resolve()) }
            .scope(.unique)

        container
            .register { (_, arg) in
                NewsDetailsViewController(viewModel: arg())
            }
    }

    private func registerAppRouter(in container: Resolver) {
        container
            .register {
                AppRouter(container: container)
            }
            .implements(AppRouterProtocol.self)
            .scope(.application)
    }

}
