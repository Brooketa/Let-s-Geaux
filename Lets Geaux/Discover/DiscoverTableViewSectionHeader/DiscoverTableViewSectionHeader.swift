import UIKit

class DiscoverTableViewSectionHeader: UIView {
    
    @IBOutlet weak var sectionTitleLabel: UILabel!
    @IBOutlet weak var sectionButton: UIButton!
    
    public func configure(sectionTitleName: String, buttonTitleName: String?) {
        self.backgroundColor = AppearanceUtils.lightGrey

        sectionTitleLabel.text = sectionTitleName
        
        if buttonTitleName != nil {
            sectionButton.setTitle(buttonTitleName!, for: .normal)
            sectionButton.isHidden = false
        }
    }
    
    static func nibName() -> String {
        return "DiscoverTableViewSectionHeader"
    }
    
}
