import UIKit
import SDWebImage

class WhatsUpCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var publishedLabel: UILabel!
    
    static let cellIdentifier = "WhatsUpCollectionViewCell"
    
    let eventAttributes = [NSAttributedString.Key.foregroundColor : AppearanceUtils.turquoise, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 13)]

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "WhatsUpCollectionViewCell", bundle: nil)
    }
    
    public func configure(with news: News) {
        newsImageView.sd_setImage(with: URL(string: news.imageURL), placeholderImage: nil, options: SDWebImageOptions.highPriority, completed: nil)
        titleLabel.text = news.title
        captionLabel.text = news.caption
        publishedLabel.attributedText = publishedLabelAttributedText(date: "published: \(news.createdAt)")
        configureAppearance()
    }
    
    private func publishedLabelAttributedText(date:String) -> NSAttributedString {
        let attributedEventText = NSMutableAttributedString(string: "Event", attributes: eventAttributes)
        let attributedDate = NSMutableAttributedString(string: "  •  \(date)")
        attributedEventText.append(attributedDate)
        
        return attributedEventText
    }
    
    private func configureAppearance() {
        self.contentView.layer.cornerRadius = 10.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 5.0)
        self.layer.shadowRadius = 10.0
        self.layer.shadowOpacity = 0.1
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius - 5).cgPath
    }
}
