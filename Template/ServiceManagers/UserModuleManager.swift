
//  UserModuleManager


import Foundation
import Alamofire

class UserModuleManager {
    
    
    func apiRegister(param:[String:Any],completion: @escaping (UserBase) -> Void){
        
        let headers: [String : String] = [:]

        let param = AFParam(endpoint: SIGNUP, params: param, headers: headers, method: .post, parameterEncoding: JSONEncoding.default, images: [])
        
        AFNetwork.shared.apiGeneric(param, modelType:UserBase.self ) { (res) in
            if res.statusCode == 200 {
                completion(res)
            }else{
                print(res.message!)
                Alert.showAlertToast(msg: res.message!)
            }
            
        }
        
    }
    
    func apiLogin(param:[String:Any],completion: @escaping (UserBase) -> Void){
        
        let headers: [String : String] = [:]
        
        let param = AFParam(endpoint: SIGNIN, params: param, headers: headers, method: .post, parameterEncoding: JSONEncoding.default, images: [])
        
        AFNetwork.shared.apiGeneric(param, modelType:UserBase.self ) { (res) in
            if res.statusCode == 200 {
                completion(res)
            }else{
                print(res.message!)
                Alert.showAlertToast(msg: res.message!)
            }
            
        }
        
    }

    func apiChangePass(endPoint:String,param:[String:Any], header:[String:String] ,completion: @escaping (ChangePasswordBase) -> Void){
        
        
        let params = AFParam(endpoint: endPoint, params: param, headers: header, method: .post, parameterEncoding: JSONEncoding.default, images: [])
        
        AFNetwork.shared.apiGeneric(params, modelType:ChangePasswordBase.self ) { (res) in
            if res.statusCode == 200 {
                completion(res)
            }else{
                print(res.message!)
                Alert.showAlertToast(msg: res.message!)
            }
            
        }
        
    }
    
    func postApis(endPoint:String,param:[String:Any],header:[String : String],completion: @escaping (UserBase) -> Void){
        
        let param = AFParam(endpoint: endPoint, params: param, headers: header, method: .post, parameterEncoding: JSONEncoding.default, images: [])
       
        AFNetwork.shared.apiGeneric(param, modelType:UserBase.self ) { (res) in
            if res.statusCode == 200 {
                completion(res)
            }else{
                print(res.message!)
                Alert.showAlertToast(msg: res.message!)
            }
            
        }
        
    }
    
  /*  func getAboutus(endPoint:String,param:[String:Any],completion: @escaping (AboutUsBase) -> Void){
        
        let headers: [String : String] = [:]
        
        let param = AFParam(endpoint: endPoint, params: param, headers: headers, method: .get, parameterEncoding: URLEncoding.default, images: [])
        
        AFNetwork.shared.apiGeneric(param, modelType:AboutUsBase.self ) { (res) in
            
            if res.statusCode == 200 {
                completion(res)
            }else{
                print(res.message!)
                Alert.showAlertToast(msg: res.message!)
            }
            
        }
        
    }  */
    
    
    func apiEditProfile(param:[String:Any],image:[UIImage],completion: @escaping (UserBase) -> Void){
        
        let headers: [String : String] = ["Authorization":"Bearer "+(User.accessToken)!]
        
        print(headers)
        
        let params = AFParam(endpoint: EDIT_PROFILE, params: param, headers: headers, method: .put, parameterEncoding: JSONEncoding.default, images:image)
        
//        self.apiGeneric(params, modelType:UserBase.self) { (res) in
//            if res.statusCode == 200 {
//                completion(res)
//            }else{
//                print(res.message!)
//                Alert.showAlertToast(msg: res.message!)
//            }
//
//        }
        
        AFNetwork.shared.apiRequestUpload(params, isSpinnerNeeded: true, success: { (response) in
            guard let data = response else { return }
            
            do
            {
                let decoder = JSONDecoder()
                let result = try decoder.decode(UserBase.self, from: data)
                
                if result.statusCode == 200 {
                    completion(result)
                }else{
                    print(result.message!)
                    Alert.showAlertToast(msg: result.message!)
                }
                
            }
            catch let error
            {
                print("Error: ", error)
            }
        }) { (error) in
            print("Error: ", error)
        }

        
    }
    
    
 /*   func getContactDetail(param:[String:Any],completion: @escaping (ContactUsBase) -> Void){
        
        let headers: [String : String] = [:]
        
        let param = AFParam(endpoint: GET_CONTACTUS, params: param, headers: headers, method: .get, parameterEncoding: URLEncoding.default, images: [])
        
        AFNetwork.shared.apiGeneric(param, modelType:ContactUsBase.self ) { (res) in
            
            if res.statusCode == 200 {
                completion(res)
            }else{
                print(res.message!)
                Alert.showAlertToast(msg: res.message!)
            }
            
        }
        
    }  */
}




