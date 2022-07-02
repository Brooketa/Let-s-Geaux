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

    private func registerClients(in container: Resolver) {}

    private func registerDataSources(in container: Resolver) {}

    private func registerRepositories(in container: Resolver) {}

    private func registerUseCases(in container: Resolver) {}

    private func registerPresenters(in container: Resolver) {}

    private func registerViewControllers(in container: Resolver) {}

    private func registerAppRouter(in container: Resolver) {
        container
            .register {
                AppRouter(container: container)
            }
            .implements(AppRouterProtocol.self)
            .scope(.application)
    }

}
