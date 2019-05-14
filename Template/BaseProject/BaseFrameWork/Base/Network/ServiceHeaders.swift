//
//  ServiceHeaders.swift
//  Created by Shujaat Ali Khan 
//  Copyright © 2016 Muzamil Hassan. All rights reserved.
//

import UIKit
import Foundation

var SIGNIN:String           = "User/Login"
var SIGNUP:String           = "User/Insert"

var VERIFY_CODE:String      = "User/VerifyEmailAddress"
var FORGOT_PASS:String      = "User/ForgetPasswordEmailSend"
var VERIFY_FORGOT_CODE      = "User/ForgertPasswordValidateCode"
var RESET_PASS:String       = "User/ForgertPasswordChangePassword"
var CHANGE_PASS:String      = "User/ChangePassword"
var RESEND_CODE:String      = "User/ResendEmailVerification"
var ABOUTUS:String          = "Admin/GetStaticContentByTypeId"
var EDIT_PROFILE:String     = "User/EditProfile"
var USER_SETTING:String     = "User/EditUserSetting"
var LOGOUT:String           = "User/Logout"

var CONTACT_US:String       = "Customer/InsertContactUsForm"
var GET_CONTACTUS:String    = "Admin/GetAppDetail"
var SALON_LIST:String       = "Salon/GetAllSalonList"
var SALON_DETAIL:String     = "Salon/GetSalonBySalonId"
var FEATURED_NEAR_SALON:String = "Salon/FeaturedAndNearSalon"
var GET_TIME_SLOTS:String   = "Appointment/GetTimeSlotsForAppointment"
var ADD_ADDRESS: String     = "User/InsertUpdateUserAddress"
var DELETE_ADDRESS: String  = "User/RemoveUserAddress"
var ALL_ADDRESSES: String   = "User/GetUserAddressList"
var ADD_APPOINMENT: String  = "Appointment/InsertAppointmentInCart"
var GET_USER_CART: String   = "Appointment/GetUserCart"
var DELETE_ITEM_FROM_CART:String = "Appointment/DeleteAppointmentDetail"
var BOOK_APPOINMENT:String  = "Appointment/BookAppointmentFromCart"
var GET_USER_BOOKING:String = "Appointment/GetUserBooking"
var GET_USER_BOOKING_DETAIL:String = "Appointment/GetUserBookingDetail"
var CANCEL_BOOKING:String = "Appointment/UpdateAppointmentStatus"

