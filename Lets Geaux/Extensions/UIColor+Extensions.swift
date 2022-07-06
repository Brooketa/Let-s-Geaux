import UIKit

public extension UIColor {

    static let turquoise = UIColor(rgb: 0x45A3B1)
    static let lightPurple = UIColor(rgb: 0xB36BE1)
    static let lightGrey = UIColor(rgb: 0xEEEFF3)
    static let mediumDarkGrey = UIColor(rgb: 0x4A4A4A)
    static let darkGrey = UIColor(rgb: 0x202020)
    static let veryDarkGrey = UIColor(rgb: 0x0C0C0C)

    static var primaryBackground: UIColor {
        .resolveColor(forLightMode: .lightGrey, forDarkMode: .veryDarkGrey)
    }

    static var tabBarBackground: UIColor {
        .resolveColor(forLightMode: .white, forDarkMode: .darkGrey)
    }

    static var navigationTitle: UIColor {
        .resolveColor(forLightMode: .white, forDarkMode: .black)
    }

    static var primaryTitle: UIColor {
        .resolveColor(forLightMode: .black, forDarkMode: .white)
    }

    static var cellTitle: UIColor {
        .resolveColor(forLightMode: .black, forDarkMode: .white)
    }

    static var cellBackgroundColor: UIColor {
        .resolveColor(forLightMode: .white, forDarkMode: .darkGrey)
    }

    static var text: UIColor {
        .resolveColor(forLightMode: .darkGrey, forDarkMode: .lightGrey)
    }

    static var accentColor: UIColor {
        resolveColor(forLightMode: .turquoise, forDarkMode: .lightPurple)
    }

    static var greyText: UIColor {
        .resolveColor(forLightMode: .mediumDarkGrey, forDarkMode: .lightGrey)
    }

    private convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF)
    }

    private static func resolveColor(
        forLightMode lightModeColor: UIColor,
        forDarkMode darkModeColor: UIColor
    ) -> UIColor {
        UIColor { (uiTraitCollection: UITraitCollection) -> UIColor in
            switch uiTraitCollection.userInterfaceStyle {
            case .dark:
                return darkModeColor
            case .unspecified, .light:
                return lightModeColor
            @unknown default:
                return lightModeColor
            }
        }
    }

}
