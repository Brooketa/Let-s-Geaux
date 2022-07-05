import UIKit

extension UIViewController {

    func defaultNavigationAppearance() {
        navigationItem.largeTitleDisplayMode = .always
        let favouritesButton = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        let profileButton = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        navigationItem.rightBarButtonItems = [ profileButton, favouritesButton]
        
        let largeTitleAppearance = UINavigationBarAppearance()
        
        largeTitleAppearance.configureWithOpaqueBackground()
        largeTitleAppearance.backgroundImage = UIImage(named: "background_gradient_image.png")
        largeTitleAppearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        largeTitleAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
        navigationController?.navigationBar.standardAppearance = largeTitleAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = largeTitleAppearance
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
    }

}
