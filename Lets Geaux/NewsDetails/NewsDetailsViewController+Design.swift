import UIKit
import SnapKit

extension NewsDetailsViewController: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {
        scrollView = UIScrollView()
        view.addSubview(scrollView)
        
        contentView = UIView()
        scrollView.addSubview(contentView)

        newsImageView = UIImageView()
        contentView.addSubview(newsImageView)

        eventLabel = UILabel()
        contentView.addSubview(eventLabel)

        titleLabel = UILabel()
        contentView.addSubview(titleLabel)

        descriptionLabel = UILabel()
        contentView.addSubview(descriptionLabel)

        publishedLabel = UILabel()
        contentView.addSubview(publishedLabel)
    }
    
    func styleViews() {
        view.backgroundColor = .primaryBackground

        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItems = nil
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: UIBarButtonItem.Style.plain, target: self, action: nil)

        scrollView.alwaysBounceVertical = true
        scrollView.alwaysBounceHorizontal = false
        scrollView.isDirectionalLockEnabled = true
        scrollView.showsVerticalScrollIndicator = false

        contentView.backgroundColor = .primaryBackground

        newsImageView.contentMode = .scaleAspectFill
        newsImageView.clipsToBounds = true

        eventLabel.textColor = .accentColor
        eventLabel.font = .systemFont(ofSize: 17, weight: .semibold)

        titleLabel.textColor = .primaryTitle
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        titleLabel.numberOfLines = 0

        descriptionLabel.textColor = .text
        descriptionLabel.font = .systemFont(ofSize: 13)
        descriptionLabel.numberOfLines = 0

        publishedLabel.textColor = .greyText
        publishedLabel.font = .systemFont(ofSize: 14, weight: .medium)
    }

    func defineLayoutForViews() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        contentView.snp.makeConstraints { make in
            make.top.bottom.equalTo(self.scrollView)
            make.left.right.equalTo(self.view)
            make.width.equalTo(self.scrollView)
            make.height.greaterThanOrEqualTo(self.scrollView)
        }

        newsImageView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(200)
        }

        eventLabel.snp.makeConstraints { make in
            make.top.equalTo(newsImageView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().inset(15)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(eventLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().inset(15)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().inset(15)
        }

        publishedLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().inset(15)
            make.bottom.equalTo(contentView.snp.bottom).inset(20).priority(.low)
        }
    }

}
