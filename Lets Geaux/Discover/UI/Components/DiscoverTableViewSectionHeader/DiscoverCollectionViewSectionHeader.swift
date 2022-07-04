import UIKit

class DiscoverCollectionViewSectionHeader: UITableViewHeaderFooterView {

    static let identifier = String(describing: DiscoverCollectionViewSectionHeader.self)

    var sectionTitleLabel: UILabel!
    var sectionButton: UIButton!

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        buildViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func didMoveToSuperview() {
        super.didMoveToSuperview()

        defineLayoutForViews()
    }

    public func configure(sectionTitleName: String, buttonTitleName: String?) {
        sectionTitleLabel.text = sectionTitleName

        if buttonTitleName != nil {
            sectionButton.setTitle(buttonTitleName!, for: .normal)
            sectionButton.isHidden = false
        }
    }

}
