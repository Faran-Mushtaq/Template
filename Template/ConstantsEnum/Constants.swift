//
//  Constants.swift
//  Test
//
//  Created Waqas Ali on 6/12/18.
//  Copyright © 2018 Waqas ali. All rights reserved.
//

import UIKit

enum Constants {
    static let minimumLengthName = 3
    static let maximumLengthName = 30
    static let maximumLengthNumber = 20
    static let minimumLengthNumber = 8
    static let maximumLengthText = 50
    static let minimumLengthPwd = 6
    static let maximumLengthPwd = 20
    static let maximumLengthTextView = 500
    static let networkSessionToken  = ""
    static let selectedColor = UIColor(red: 198/255, green: 0/255, blue: 37/255, alpha: 1)
}



enum FP {
    static var emailUser = ""
    static var loginGuest  = false
}

enum CurrentUser{
    //static var data : User? = nil
    static var token : String = ""
    static var userType : UserKind = .registered
    static var selectedAddressID : Int = 0
    static var deviceToken : String = "123456"
   
}

enum Login {
    static let isLoggedIn : String = "isLoggedIn"
    static let userData : String = "userData"
    static let token : String = "token"
}


enum CartData {
    static var cartDict : [Int : (quantity : Int, amount: Float , item : String , section :Int)] = [:]
    static var totalAmount : Float  = 0
    static var totalQuantity : Int = 0
    static var params : [String : AnyObject] = [:]
    static var orderDetail : [[String : AnyObject]] = [[:]]
    static var instanceSurCharge : Float = 0.0
    static var amtFinal : Float = 0.0
    static var SD : SheduleData =  SheduleData()
}

enum GoogleMap{
    static let key : String = "AIzaSyBbm5LaMZF6g7RcATzFsVyz9BuaPrrefxM" // "AIzaSyD7sU52onvkEkZd0NwlFXGbOQ-C791LVh4"
    
}

enum ServiceCodes {
    static let successCode : Int = 200
}

enum UserDefaultKey {
    static let isConfigurationSaved = "isConfigurationSaved"
    static let selectedAddress = "selectedAddress"
    static let deviceToken = "deviceToken"
    static let cardData = "cardData"
}


enum UserKind{
    case registered
    case guest
    
}

enum OrderData{
    static var orderNotification : (type: String, id :Int) = ("", 0)
}

struct SheduleData {
    var isInstance  = false
    var selectedTimes : (String? , String?) = (nil, nil)
    var selectedDates : (Date? , Date?) = (nil, nil)
    var selectedAddress : (String? , String?) = (nil, nil)
}



enum CodeType {
    case signup , forgetPwd
}


enum ServiceType: String{
    case Services = "Services"
    case Promotions = "Promotions"
    case ParlourStuff = "Parlour Stuff"
    case AboutParlour = "About Parlour"
    case Reviews = "Reviews"
}


enum User {
    static var current : UserResult? = nil
    static var accessToken : String? = nil
    static var deviceToken = "abc123"
    static var isGuest : Bool = false
}


extension Notification.Name {
    static let setHomeOnLeftMenu = Notification.Name(rawValue: "setHomeOnLeftMenu")
}



