//
//  LGDiscoverTableViewSectionHeader.swift
//  Lets Geaux
//
//  Created by Brooketa on 15.04.2021..
//

import UIKit

class LGDiscoverTableViewSectionHeader: UIView {
    
    @IBOutlet weak var sectionTitleLabel: UILabel!
    @IBOutlet weak var sectionButton: UIButton!
    
    public func configure(sectionTitleName: String, buttonTitleName: String?) {
        self.backgroundColor = LGAppearanceUtils.lightGrey

        sectionTitleLabel.text = sectionTitleName
        
        if buttonTitleName != nil {
            sectionButton.setTitle(buttonTitleName!, for: .normal)
            sectionButton.isHidden = false
        }
    }
    
    static func nibName() -> String {
        return "LGDiscoverTableViewSectionHeader"
    }
    
}
