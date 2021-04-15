//
//  LGViewController.swift
//  Lets Geaux
//
//  Created by Brooketa on 15.04.2021..
//

import UIKit

class LGViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //NavigationBar configuration
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
