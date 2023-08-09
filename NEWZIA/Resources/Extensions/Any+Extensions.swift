//
//  Any+Extensions.swift
//  NEWZIA
//
//  Created by Mina on 03/08/2023.
//

import Foundation
import UIKit


extension String {

    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
  
}


extension UIColor {
    static func appColor(_ name: Constants.AssetsColor) -> UIColor? {
       return UIColor(named: name.rawValue)
    }
}

extension UIWindow {
    func topViewController() -> UIViewController? {
        var top = self.rootViewController
        while true {
            if let presented = top?.presentedViewController {
                top = presented
            } else if let nav = top as? UINavigationController {
                top = nav.visibleViewController
            } else if let tab = top as? UITabBarController {
                top = tab.selectedViewController
            } else {
                break
            }
        }
        return top
    }
}


extension String? {
    var orEmpty: String {
        self ?? ""
    }
}

extension Double? {
    var orEmpty: Any {
        self ?? 0.0
    }
}

extension Int? {
    var orEmpty: Any {
        self ?? 0
    }
}
