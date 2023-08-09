//
//  BaseModel.swift
//  NEWZIA
//
//  Created by Mina on 03/08/2023.
//

struct BaseModel<T: Decodable>: Decodable {
    
    let status : String?
    let code : String?
    let message : String?
    let totalResults : Int?
    let data : T?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case code = "code" //
        case message = "message"
        case totalResults = "totalResults" //
        case data = "articles"
    }

}
