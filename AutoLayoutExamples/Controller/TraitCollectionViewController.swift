//
//  TraitCollectionViewController.swift
//  AutoLayoutAnchorsExample
//
//  Created by Ralf Ebert on 04.09.19.
//

import UIKit

extension UIUserInterfaceIdiom: CustomStringConvertible {
    public var description: String {
        switch(self) {
        case .unspecified:
            return "unspecified"
        case .phone:
            return "phone"
        case .pad:
            return "pad"
        case .tv:
            return "pad"
        case .carPlay:
            return "carPlay"
        @unknown default:
            return "unknown"
        }
    }
}

extension UIUserInterfaceSizeClass: CustomStringConvertible {
    public var description: String {
        switch(self) {
        case .unspecified:
            return "unspecified"
        case .compact:
            return "compact"
        case .regular:
            return "regular"
        @unknown default:
            return "unknown"
        }
    }
}

extension UIDisplayGamut: CustomStringConvertible {
    public var description: String {
        switch(self) {
        case .unspecified:
            return "unspecified"
        case .SRGB:
            return "SRGB"
        case .P3:
            return "P3"
        @unknown default:
            return "unknown"
        }
    }
}

extension UIForceTouchCapability: CustomStringConvertible {
    public var description: String {
        switch(self) {
        case .unknown:
            return "unknown"
        case .unavailable:
            return "unavailable"
        case .available:
            return "available"
        @unknown default:
            return "unknown"
        }
    }
}

extension UITraitEnvironmentLayoutDirection: CustomStringConvertible {
    public var description: String {
        switch(self) {
        case .unspecified:
            return "unspecified"
        case .leftToRight:
            return "leftToRight"
        case .rightToLeft:
            return "rightToLeft"
        @unknown default:
            return "unknown"
        }
    }
}

@available(iOS 12.0, *)
extension UIUserInterfaceStyle: CustomStringConvertible {
    public var description: String {
        switch(self) {
        case .unspecified:
            return "unspecified"
        case .light:
            return "light"
        case .dark:
            return "dark"
        @unknown default:
            return "unknown"
        }
    }
}

@available(iOS 13.0, *)
extension UIAccessibilityContrast: CustomStringConvertible {
    public var description: String {
        switch(self) {
        case .unspecified:
            return "unspecified"
        case .normal:
            return "normal"
        case .high:
            return "high"
        @unknown default:
            return "unknown"
        }
    }
}

@available(iOS 13.0, *)
extension UILegibilityWeight: CustomStringConvertible {
    public var description: String {
        switch(self) {
        case .unspecified:
            return "unspecified"
        case .regular:
            return "regular"
        case .bold:
            return "bold"
        @unknown default:
            return "unknown"
        }
    }
}

@available(iOS 13.0, *)
extension UIUserInterfaceLevel: CustomStringConvertible {
    public var description: String {
        switch(self) {
        case .unspecified:
            return "unspecified"
        case .base:
            return "base"
        case .elevated:
            return "elevated"
        @unknown default:
            return "unknown"
        }
    }
}

class TraitCollectionViewController : UIViewController {
    
    @IBOutlet weak var traitsLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateTraitsLabel()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        debugPrint("traitCollectionDidChange")
        updateTraitsLabel()
    }
    
    func updateTraitsLabel() {
        var text = """
            userInterfaceIdiom: \(self.traitCollection.userInterfaceIdiom)
            horizontalSizeClass: \(self.traitCollection.horizontalSizeClass)
            verticalSizeClass: \(self.traitCollection.verticalSizeClass)
            displayGamut: \(self.traitCollection.displayGamut)
            displayScale: \(self.traitCollection.displayScale)
            forceTouchCapability: \(self.traitCollection.forceTouchCapability)
            layoutDirection: \(self.traitCollection.layoutDirection)
            preferredContentSizeCategory: \(self.traitCollection.preferredContentSizeCategory.rawValue)
        """
        text += "\n"

        if #available(iOS 12.0, *) {
            print(self.traitCollection.userInterfaceStyle)
            text += """
                userInterfaceStyle: \(self.traitCollection.userInterfaceStyle)
            """
            text += "\n"
        }

        if #available(iOS 13.0, *) {
            text += """
                accessibilityContrast: \(self.traitCollection.accessibilityContrast)
                legibilityWeight: \(self.traitCollection.legibilityWeight)
                userInterfaceLevel: \(self.traitCollection.userInterfaceLevel)
            """
        }
        
        traitsLabel.text = text
    }
    
}
