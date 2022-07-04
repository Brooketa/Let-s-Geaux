import UIKit
import SnapKit

extension DiscoverCollectionViewCell: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
    }

    func createViews() {
        newsImageView = UIImageView()
        contentView.addSubview(newsImageView)

        textWrapperStackView = UIStackView()
        contentView.addSubview(textWrapperStackView)

        titleLabel = UILabel()
        textWrapperStackView.addArrangedSubview(titleLabel)

        captionAndPublishedTextStackView = UIStackView()
        textWrapperStackView.addArrangedSubview(captionAndPublishedTextStackView)

        captionLabel = UILabel()
        captionAndPublishedTextStackView.addArrangedSubview(captionLabel)

        publishedLabel = UILabel()
        captionAndPublishedTextStackView.addArrangedSubview(publishedLabel)
    }

    func styleViews() {
        contentView.backgroundColor = .white
        addRoundedCornerAndShadow()

        newsImageView.contentMode = .scaleAspectFill
        newsImageView.clipsToBounds = true

        textWrapperStackView.backgroundColor = .white
        textWrapperStackView.distribution = .fillEqually
        textWrapperStackView.alignment = .fill
        textWrapperStackView.axis = .vertical

        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        titleLabel.numberOfLines = 0

        captionAndPublishedTextStackView.distribution = .fillProportionally
        captionAndPublishedTextStackView.alignment = .fill
        captionAndPublishedTextStackView.axis = .vertical
        captionAndPublishedTextStackView.spacing = 5

        captionLabel.textColor = AppearanceUtils.darkGrey
        captionLabel.font = .systemFont(ofSize: 16, weight: .regular)
        captionLabel.numberOfLines = 0

        publishedLabel.textColor = AppearanceUtils.darkGrey
        publishedLabel.font = .systemFont(ofSize: 13, weight: .regular)
    }

    func defineLayoutForViews() {
        newsImageView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(self.snp.height).multipliedBy(0.6)
        }

        textWrapperStackView.snp.makeConstraints { make in
            make.top.equalTo(newsImageView.snp.bottom)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().inset(15)
        }
    }

    private func addRoundedCornerAndShadow() {
        contentView.layer.cornerRadius = 10.0
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 5.0)
        layer.shadowRadius = 10.0
        layer.shadowOpacity = 0.1
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius - 5).cgPath
    }

}
