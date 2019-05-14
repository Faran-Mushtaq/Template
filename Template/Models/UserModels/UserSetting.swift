//
//	UserSetting.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import Realm
import RealmSwift

class UserSetting : Object, Decodable {

	@objc dynamic var isNotificationOn : Bool = true
	@objc dynamic var isReminderOn : Bool = true
	@objc dynamic var userId : Int = 0
	@objc dynamic var userSettingId : Int = 0


	enum CodingKeys: String, CodingKey {
		case isNotificationOn = "isNotificationOn"
		case isReminderOn = "isReminderOn"
		case userId = "userId"
		case userSettingId = "userSettingId"
	}
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        
		let values = try decoder.container(keyedBy: CodingKeys.self)
		isNotificationOn = try values.decodeIfPresent(Bool.self, forKey: .isNotificationOn) ?? Bool()
		isReminderOn = try values.decodeIfPresent(Bool.self, forKey: .isReminderOn) ?? Bool()
		userId = try values.decodeIfPresent(Int.self, forKey: .userId) ?? Int()
		userSettingId = try values.decodeIfPresent(Int.self, forKey: .userSettingId) ?? Int()
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
