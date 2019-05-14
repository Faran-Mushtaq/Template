//
//	UserType.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import Realm
import RealmSwift

class UserType : Object ,Decodable {

	@objc dynamic var createdBy : String?
	@objc dynamic var creationDate : String?
	@objc dynamic var isActive : Bool = false
	@objc dynamic var lastUpdateDate : String?
	@objc dynamic var updateBy : String?
	@objc dynamic var userIP : String?
	@objc dynamic var userTypeId : Int = 0
	@objc dynamic var userTypeName : String?


	enum CodingKeys: String, CodingKey {
		case createdBy = "createdBy"
		case creationDate = "creationDate"
		case isActive = "isActive"
		case lastUpdateDate = "lastUpdateDate"
		case updateBy = "updateBy"
		case userIP = "userIP"
		case userTypeId = "userTypeId"
		case userTypeName = "userTypeName"
	}
    required convenience init(from decoder: Decoder) throws {
        self.init()
        
		let values = try decoder.container(keyedBy: CodingKeys.self)
		createdBy = try values.decodeIfPresent(String.self, forKey: .createdBy) ?? String()
		creationDate = try values.decodeIfPresent(String.self, forKey: .creationDate) ?? String()
		isActive = try values.decodeIfPresent(Bool.self, forKey: .isActive) ?? Bool()
		lastUpdateDate = try values.decodeIfPresent(String.self, forKey: .lastUpdateDate) ?? String()
		updateBy = try values.decodeIfPresent(String.self, forKey: .updateBy) ?? String()
		userIP = try values.decodeIfPresent(String.self, forKey: .userIP) ?? String()
		userTypeId = try values.decodeIfPresent(Int.self, forKey: .userTypeId) ?? Int()
		userTypeName = try values.decodeIfPresent(String.self, forKey: .userTypeName) ?? String()
	}


    required init() {
        super.init()
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
}
