//
//  LGNewsViewController.swift
//  Lets Geaux
//
//  Created by Brooketa on 15.04.2021..
//

import UIKit
import SDWebImage

class LGNewsViewController: LGViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var publishedLabel: UILabel!
    
    var news:LGNews?
    var newsImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        
        scrollView.alwaysBounceVertical = true
        scrollView.alwaysBounceHorizontal = false
        scrollView.isDirectionalLockEnabled = true
    }
    
    override func viewDidLayoutSubviews() {
        displayNewsData()
        scrollView.contentSize = CGSize(width: 0, height: scrollView.contentSize.height)
    }
    
    func displayNewsData() {
        guard let news = self.news else { return }

        newsImageView.sd_setImage(with: URL(string: news.imageURL), placeholderImage: nil, options: SDWebImageOptions.highPriority, completed: nil)
        
        titleLabel.text = news.title
        descriptionLabel.text = news.description
        publishedLabel.text = "Published: \(news.createdAt)"
    }


}
