import UIKit
import SnapKit

extension DiscoverTableViewSectionHeader: ConstructViewsProtocol {

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
        contentView.backgroundColor = AppearanceUtils.lightGrey

        sectionTitleLabel.textColor = .black
        sectionTitleLabel.font = .systemFont(ofSize: 25, weight: .bold)

        sectionButton.setTitleColor(.black, for: .normal)
        sectionButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
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
