//
//	UserResult.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import Realm
import RealmSwift

class UserResult : Object, Decodable {

	@objc dynamic var cityId : Int = 0
	@objc dynamic var contactNo : String?
    @objc dynamic var contactCode : String?
	@objc dynamic var createdBy : String?
	@objc dynamic var creationDate : String?
	@objc dynamic var email : String?
	@objc dynamic var gender : String?
    @objc dynamic var isActive : Bool = false
	@objc dynamic var lastUpdateDate : String?
	@objc dynamic var name : String?
	@objc dynamic var password : String?
	@objc dynamic var phoneVerificationCode : Int = 0
	@objc dynamic var phoneVerificationCodeSendDate : String?
	@objc dynamic var phoneVerifiedDate : String?
	@objc dynamic var salonUserAssociation : String?
	@objc dynamic var updateBy : Int = 0
	@objc dynamic var userIP : String?
	@objc dynamic var userId : Int = 0
	@objc dynamic var userStatusId : Int = 0
	@objc dynamic var userType : UserType?
	@objc dynamic var userTypeId : Int = 0
    @objc dynamic var imageUrl : String?
    @objc dynamic var userSetting : UserSetting?
    
    @objc dynamic var accessToken : String = ""


	enum CodingKeys: String, CodingKey {
		case cityId = "cityId"
		case contactNo = "contactNo"
        case contactCode = "contactCode"
		case createdBy = "createdBy"
		case creationDate = "creationDate"
		case email = "email"
		case gender = "gender"
		case isActive = "isActive"
		case lastUpdateDate = "lastUpdateDate"
		case name = "name"
		case password = "password"
		case phoneVerificationCode = "phoneVerificationCode"
		case phoneVerificationCodeSendDate = "phoneVerificationCodeSendDate"
		case phoneVerifiedDate = "phoneVerifiedDate"
		case salonUserAssociation = "salonUserAssociation"
		case updateBy = "updateBy"
		case userIP = "userIP"
		case userId = "userId"
		case userStatusId = "userStatusId"
		case userType = "userType"
		case userTypeId = "userTypeId"
        case imageUrl = "imageURL"
        case userSetting = "userSetting"
        
	}
    
    override static func primaryKey() -> String? { return "userId" }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        
		let values = try decoder.container(keyedBy: CodingKeys.self)
		cityId = try values.decodeIfPresent(Int.self, forKey: .cityId) ?? Int()
		contactNo = try values.decodeIfPresent(String.self, forKey: .contactNo) ?? String()
        contactCode = try values.decodeIfPresent(String.self, forKey: .contactCode) ?? String()
		createdBy = try values.decodeIfPresent(String.self, forKey: .createdBy) ?? String()
		creationDate = try values.decodeIfPresent(String.self, forKey: .creationDate) ?? String()
		email = try values.decodeIfPresent(String.self, forKey: .email) ?? String()
		gender = try values.decodeIfPresent(String.self, forKey: .gender) ?? String()
		isActive = try values.decodeIfPresent(Bool.self, forKey: .isActive) ?? Bool()
		lastUpdateDate = try values.decodeIfPresent(String.self, forKey: .lastUpdateDate) ?? String()
		name = try values.decodeIfPresent(String.self, forKey: .name) ?? String()
		password = try values.decodeIfPresent(String.self, forKey: .password) ?? String()
		phoneVerificationCode = try values.decodeIfPresent(Int.self, forKey: .phoneVerificationCode) ?? Int()
		phoneVerificationCodeSendDate = try values.decodeIfPresent(String.self, forKey: .phoneVerificationCodeSendDate) ?? String()
		phoneVerifiedDate = try values.decodeIfPresent(String.self, forKey: .phoneVerifiedDate) ?? String()
		salonUserAssociation = try values.decodeIfPresent(String.self, forKey: .salonUserAssociation) ?? String()
		updateBy = try values.decodeIfPresent(Int.self, forKey: .updateBy) ?? Int()
		userIP = try values.decodeIfPresent(String.self, forKey: .userIP) ?? String()
		userId = try values.decodeIfPresent(Int.self, forKey: .userId) ?? Int()
		userStatusId = try values.decodeIfPresent(Int.self, forKey: .userStatusId) ?? Int()
		userType = try values.decodeIfPresent(UserType.self, forKey: .userType)  //?? UserType()
		userTypeId = try values.decodeIfPresent(Int.self, forKey: .userTypeId) ?? Int()
        imageUrl = try values.decodeIfPresent(String.self, forKey: .imageUrl) ?? String()
        userSetting = try values.decodeIfPresent(UserSetting.self, forKey: .userSetting)
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
