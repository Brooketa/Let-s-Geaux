import UIKit
import Resolver

class AppRouter: AppRouterProtocol {

    private let container: Resolver
    
    private let tabBarController: UITabBarController?
    private let navigationController: UINavigationController?

    init(container: Resolver) {
        self.container = container
        self.tabBarController = UITabBarController()
        self.navigationController = UINavigationController()
    }

    func start(in window: UIWindow) {
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }

    private func configureTabBarController() {
        guard
            let tabBarController = tabBarController,
            let navigationController = navigationController
        else {
            return
        }

        let discoverViewController: DiscoverViewController = container.resolve()

        discoverViewController.tabBarItem = createTabBarItem(
            title: "Discover",
            selectedImageName: "star",
            deselectedImageName: "star")

        navigationController.setViewControllers([discoverViewController], animated: true)

        tabBarController.viewControllers = [navigationController]
        tabBarController.tabBar.isTranslucent = true
        tabBarController.tabBar.unselectedItemTintColor = .lightGray
        tabBarController.tabBar.backgroundColor = .tabBarBackground
    }

    private func createTabBarItem(
        title: String,
        selectedImageName: String,
        deselectedImageName: String
    ) -> UITabBarItem {
        guard
            let selectedImage = UIImage(systemName: selectedImageName)?.withTintColor(.accentColor, renderingMode: .alwaysOriginal),
            let deselectedImage = UIImage(systemName: deselectedImageName)
        else {
            return UITabBarItem()
        }

        let tabBarItem = UITabBarItem(title: title, image: deselectedImage, selectedImage: selectedImage)
        tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.accentColor], for: .normal)

        return tabBarItem
    }

    func showDiscover() {
        configureTabBarController()
    }

    func showNewsDetails(with viewModel: NewsViewModel) {
        guard let navigationController = navigationController else { return }

        let newsDetailsViewController: NewsDetailsViewController = container.resolve(args: viewModel)

        navigationController.pushViewController(newsDetailsViewController, animated: true)
    }

}
