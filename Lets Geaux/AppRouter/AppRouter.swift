import Resolver

class AppRouter: AppRouterProtocol {

    private let container: Resolver

    init(container: Resolver) {
        self.container = container
    }

}
