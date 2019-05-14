//
//  Router.swift
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//


import UIKit

class Router  {
 
 
    typealias viewController  =  StoryBoardHandler & UIViewController
    
//    func goToSignup(from vc : viewController) {
//        vc.show(SignUpController.loadVC())
//    }
//    
//    func goToHomeAsRoot(from vc : viewController)
//    {
//    //let mainStoryboard: UIStoryboard = UIStoryboard(name: Storyboards.userModule.rawValue, bundle: nil)
//        
//       // let viewController = mainStoryboard.instantiateViewController(withIdentifier: "SideMenuController") as! SideMenuController
//    //    UIApplication.shared.keyWindow?.rootViewController = viewController
//           vc.navigationController?.setViewControllers([SideMenuController.loadVC()], animated: true)
//    }
//
//    func gotoWalkThrough() {
//        let mainStoryboard: UIStoryboard = UIStoryboard(name: Storyboards.userModule.rawValue, bundle: nil)
//        let navigationVC = mainStoryboard.instantiateViewController(withIdentifier: "LoginNavigation") as! UINavigationController
//        UIView.transition(with: (UIApplication.shared.keyWindow)!, duration: 0.5, options: .transitionFlipFromRight, animations: {
//            UIApplication.shared.keyWindow?.rootViewController = navigationVC
//        }, completion: nil)
//    }
//
    
    
//    func goToHome(from vc : viewController)
//    {
//        //let mainStoryboard: UIStoryboard = UIStoryboard(name: Storyboards.userModule.rawValue, bundle: nil)
//        
//        // let viewController = mainStoryboard.instantiateViewController(withIdentifier: "SideMenuController") as! SideMenuController
//        //    UIApplication.shared.keyWindow?.rootViewController = viewController
//        vc.navigationController?.setViewControllers([SideMenuController.loadVC()], animated: true)
//    }
//    
//    
//    func goToHomeAsRoot()
//    {
//        let mainStoryboard: UIStoryboard = UIStoryboard(name: Storyboards.sideMenu.rawValue, bundle: nil)
//         let viewController = mainStoryboard.instantiateViewController(withIdentifier: "SideMenuController") as! SideMenuController
//            UIApplication.shared.keyWindow?.rootViewController = viewController
//        UIView.transition(with: (UIApplication.shared.keyWindow)!, duration: 0.5, options: .transitionFlipFromRight, animations: nil, completion: nil)
//        
//    }
//    
//    func goToLoginAsRoot()
//    {
//        let mainStoryboard: UIStoryboard = UIStoryboard(name: Storyboards.userModule.rawValue, bundle: nil)
//        let navigationVC = mainStoryboard.instantiateViewController(withIdentifier: "LoginNavigation") as! BaseNavigationController
//        navigationVC.setViewControllers([SignInController.loadVC()], animated: false)
//        UIApplication.shared.keyWindow?.rootViewController = navigationVC
//        UIView.transition(with: (UIApplication.shared.keyWindow)!, duration: 0.5, options: .transitionFlipFromRight, animations: nil, completion: nil)
//        
//    }
//    
//    func splashToLoginAsRoot(){
//        let mainStoryboard: UIStoryboard = UIStoryboard(name: Storyboards.userModule.rawValue, bundle: nil)
//        let navigationVC = mainStoryboard.instantiateViewController(withIdentifier: "LoginNavigation") as! BaseNavigationController
//        navigationVC.setViewControllers([SignInController.loadVC()], animated: false)
//        UIApplication.shared.keyWindow?.rootViewController = navigationVC
//        UIView.transition(with: (UIApplication.shared.keyWindow)!, duration: 0.5, options: [.transitionCrossDissolve], animations: nil, completion: nil)
//    }
//
//    func goToLoginScreen(from vc : viewController) {
//        
//        vc.navigationController?.setViewControllers([SignInController.loadVC()], animated: true)
//    }
//
//  //--FM
//  /*  func goToVerifyCodeVC(from vc : viewController, fromSighUp : Bool) {
//        vc.show(VerifyCodeController.loadVC()) { (vc : VerifyCodeController) in
//            vc.fromSignUp = fromSighUp
//        }
//    }  */
//    
//    func goToVerifyCodeVC(from vc : viewController, fromSighUp : Bool, email:String) {
//        vc.show(VerifyCodeController.loadVC()) { (vc : VerifyCodeController) in
//            vc.fromSignUp = fromSighUp
//            vc.email = email
//        }
//    }


    
    /*
    func goToLoginScreen(from vc : viewController) {
        
         vc.navigationController?.setViewControllers([LoginViewController.loadVC()], animated: true)
    }
    
    
    func goToEnterCodeVC(from vc : viewController, codeType : CodeType) {
      vc.show(viewcontrollerInstance: EnterCodeViewController.loadVC()) { (vc : EnterCodeViewController) in
            vc.type = codeType
        }
    }
    
    func goToChangePwdVC(from vc : viewController)  {
        
        vc.show(viewcontrollerInstance: ChangePasswordViewController.loadVC())
    }
    
    func goToSettingsVC(from vc : viewController) {
        
          vc.show(viewcontrollerInstance: SettingViewController.loadVC())
   
    }
    
    func goToResetPwd(from vc : viewController) {
        vc.show(viewcontrollerInstance: ResetPasswordViewController.loadVC())
    }
    
    func goToTerms(from vc : viewController) {
        vc.show(viewcontrollerInstance: TermsConditionViewController.loadVC())
    }
    
*/
}
