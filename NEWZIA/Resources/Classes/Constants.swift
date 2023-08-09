//
//  Constants.swift
//  NEWZIA
//
//  Created by Mina on 03/08/2023.
//

import Foundation

class Constants {
    enum AssetsColor: String {
        case AccentColor
        case BackgroundColor
        case PrimaryColor
        case SecondaryColor
        case LynchColor
    }
    
    enum StoryBoardNames {
        static let main = "Main"
        static let home = "Home"
    }
    
    enum VCIdentifier {
        static let tabbar = "TabBar"
        static let homeVC = "HomeVC"
        static let detailsArticleVC = "DetailsArticlesVC"
        static let webKitVC = "WebKitVC"
        static let getStartedVC = "GetStartedVC"
        
    }
}
