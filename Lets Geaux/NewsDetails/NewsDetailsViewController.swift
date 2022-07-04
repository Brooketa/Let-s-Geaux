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

    var model: News? = nil

    init() {
        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        buildViews()
        set()
    }

    func set() {
        newsImageView.kf.setImage(with: URL(string: model!.imageURL))
        eventLabel.text = "Event"
        titleLabel.text = model!.title
        descriptionLabel.text = model!.description
        publishedLabel.text = "Published: \(model!.createdAt)"
    }

}
