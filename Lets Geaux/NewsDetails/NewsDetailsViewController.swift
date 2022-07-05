import UIKit
import Kingfisher

class NewsDetailsViewController: UIViewController {

    static let identifier = "NewsViewController"

    var scrollView: UIScrollView!
    var contentView: UIView!
    var newsImageView: UIImageView!
    var eventLabel: UILabel!
    var titleLabel: UILabel!
    var descriptionLabel: UILabel!
    var publishedLabel: UILabel!

    private var viewModel: NewsViewModel

    init(viewModel: NewsViewModel) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        buildViews()
    }

    override func viewWillAppear(_ animated: Bool) {
        setNewsInfo()
    }

    func setNewsInfo() {
        newsImageView.kf.setImage(with: viewModel.imageURL)
        eventLabel.text = "Event"
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        publishedLabel.text = "Published: \(viewModel.createdAt)"
    }

}
