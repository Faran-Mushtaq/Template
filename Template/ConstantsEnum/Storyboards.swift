//
//  Storyboards.swift
//  Test
//
//  Created Waqas Ali on 6/12/18.
//  Copyright © 2018 Waqas ali. All rights reserved.
//

import Foundation
import UIKit

public enum Storyboards : String {
    
    // As enum is extends from String then its case name is also its value
    case main = "Main"
    case userModule = "UserModule"
    case registeration = "Registeration"
    case home = "HomeModule"
    case bookingModule = "BookingModule"
    case setting = "Settings"
    case sideMenu = "SideMenu"
    case dashboard = "Dashboard"
    case myParlour = "MyParlour"
    case myEarnings = "MyEarnings"
   
    
}

enum Navigation {
    static var currentNavigation  : UINavigationController?  = nil
}


