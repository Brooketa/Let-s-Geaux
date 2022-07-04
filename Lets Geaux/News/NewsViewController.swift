import UIKit
import Kingfisher

class NewsViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var publishedLabel: UILabel!
    
    static let identifier = "NewsViewController"
    
    var news:News?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItems = nil
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: UIBarButtonItem.Style.plain, target: self, action: nil)
        
        scrollView.alwaysBounceVertical = true
        scrollView.alwaysBounceHorizontal = false
        scrollView.isDirectionalLockEnabled = true
    }
    
    override func viewDidLayoutSubviews() {
        loadNewsData()
    }
    
    func loadNewsData() {
        guard let news = self.news else { return }

        newsImageView.kf.setImage(with: URL(string: news.imageURL)!)
        
        titleLabel.text = news.title
        descriptionLabel.text = news.description
        publishedLabel.text = "Published: \(news.createdAt)"
    }
}
