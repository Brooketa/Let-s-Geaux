import UIKit
import Kingfisher

class NewsDetailsViewController: UIViewController {

    var scrollView: UIScrollView!
    var contentView: UIView!
    var newsImageView: UIImageView!
    var eventLabel: UILabel!
    var titleLabel: UILabel!
    var descriptionLabel: UILabel!
    var publishedLabel: UILabel!

    static let identifier = "NewsViewController"

    init() {
        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        buildViews()
    }

    func set(with viewModel: NewsViewModel) {
        newsImageView.kf.setImage(with: viewModel.imageURL)
        eventLabel.text = "Event"
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        publishedLabel.text = "Published: \(viewModel.createdAt)"
    }

}
