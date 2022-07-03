import Foundation
import UIKit

struct AppearanceUtils {
    static let turquoise = UIColor(red: 69/255, green: 163/255, blue: 177/255, alpha: 1.0)
    static let lightGrey = UIColor(red: 238/255, green: 239/255, blue: 243/255, alpha: 1.0)
    static let darkGrey = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1.0)

    static let eventTextAttributes = [NSAttributedString.Key.foregroundColor : AppearanceUtils.turquoise, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 13)]

}
