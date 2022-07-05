import UIKit
import SnapKit

extension DiscoverCollectionViewSectionHeader: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
    }

    func createViews() {
        sectionTitleLabel = UILabel()
        addSubview(sectionTitleLabel)

        sectionButton = UIButton()
        addSubview(sectionButton)
    }

    func styleViews() {
        sectionTitleLabel.textColor = .primaryTitle
        sectionTitleLabel.font = .systemFont(ofSize: 25, weight: .bold)

        sectionButton.setTitleColor(.primaryTitle, for: .normal)
        sectionButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        sectionButton.setTitle("All news", for: .normal)
    }

    func defineLayoutForViews() {
        sectionTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.top.bottom.equalToSuperview()
        }

        sectionButton.snp.makeConstraints { make in
            make.leading.equalTo(sectionTitleLabel.snp.trailing)
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview().inset(15)
            make.width.equalTo(80)
        }
    }

}
