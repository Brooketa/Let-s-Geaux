import UIKit

class DiscoverCollectionViewSectionHeader: UICollectionReusableView {

    static let identifier = String(describing: DiscoverCollectionViewSectionHeader.self)

    var sectionTitleLabel: UILabel!
    var sectionButton: UIButton!

    override init(frame: CGRect) {
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

    public func set(sectionTitle: String) {
        sectionTitleLabel.text = sectionTitle
    }

}
