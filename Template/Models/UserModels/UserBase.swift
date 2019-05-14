//
//	UserBase.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class UserBase : Decodable {

    let isBlocked : Bool?
    let message : String?
    let result : UserResult?
    let statusCode : Int?
    let token : String

    enum CodingKeys: String, CodingKey {
        case isBlocked = "isBlocked"
        case message = "message"
        case result = "result"
        case statusCode = "statusCode"
        case token = "token"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        isBlocked = try values.decodeIfPresent(Bool.self, forKey: .isBlocked) ?? Bool()
        message = try values.decodeIfPresent(String.self, forKey: .message) ?? String()
        result = try values.decodeIfPresent(UserResult.self, forKey: .result)  //?? UserResult()
        statusCode = try values.decodeIfPresent(Int.self, forKey: .statusCode) ?? Int()
        token = try values.decodeIfPresent(String.self, forKey: .token) ?? String()
    }

}
