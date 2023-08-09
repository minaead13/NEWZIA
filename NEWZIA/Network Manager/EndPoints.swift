//
//  EndPoints.swift
//  NEWZIA
//
//  Created by Mina on 03/08/2023.
//

import Foundation


class Endpoints: NSObject {
            
    // MARK: - Base url
     static let BASE_API_URL = "https://newsapi.org/v2/"
    
    // MARK: - EndPoints.
    static var everything:String {return BASE_API_URL + "everything"}
    static var top_headlines:String {return BASE_API_URL + "top-headlines"}
}
