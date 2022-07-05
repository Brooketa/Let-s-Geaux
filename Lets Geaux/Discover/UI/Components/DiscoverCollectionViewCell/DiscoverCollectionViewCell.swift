import UIKit
import Kingfisher

class DiscoverCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: DiscoverCollectionViewCell.self)

    var newsImageView: UIImageView!
    var textWrapperStackView: UIStackView!
    var titleLabel: UILabel!
    var captionAndPublishedTextStackView: UIStackView!
    var captionLabel: UILabel!
    var publishedLabel: UILabel!

    public override init(frame: CGRect) {
        super.init(frame: frame)

        buildViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func didMoveToSuperview() {
        super.didMoveToSuperview()

        defineLayoutForViews()
    }

    public func set(with viewModel: NewsViewModel) {
        newsImageView.kf.setImage(with: viewModel.imageURL)
        titleLabel.text = viewModel.title
        captionLabel.text = viewModel.caption
        publishedLabel.attributedText = publishedLabelAttributedText(date: viewModel.createdAt.description)
    }

    private func publishedLabelAttributedText(date:String) -> NSAttributedString {
        let attributedEventText = NSMutableAttributedString(string: "Event", attributes: AppearanceUtils.eventTextAttributes)
        let attributedDate = NSMutableAttributedString(string: "  • published: \(date)")
        attributedEventText.append(attributedDate)

        return attributedEventText
    }

}
