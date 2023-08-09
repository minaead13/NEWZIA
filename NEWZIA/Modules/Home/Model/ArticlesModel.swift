//
//  ArticlesModel.swift
//  NEWZIA
//
//  Created by Mina on 03/08/2023.
//

import Foundation

struct ArticlesModel : Codable {
    let source : SourceModel?
    let author : String?
    let title : String?
    let description : String?
    let url : String?
    let urlToImage : String?
    let publishedAt : String?
    let content : String?

    enum CodingKeys: String, CodingKey {

        case source = "source"
        case author = "author"
        case title = "title"
        case description = "description"
        case url = "url"
        case urlToImage = "urlToImage"
        case publishedAt = "publishedAt"
        case content = "content"
    }
}

//MARK: - Source Model.
struct SourceModel: Codable {
    let id : String?
    let name : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
    }
}
