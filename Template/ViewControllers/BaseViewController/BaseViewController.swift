//
//  BaseViewController.swift
//

import UIKit
import SwiftMessages

class BaseViewController: UIViewController {
    
    var storedOffsets = [Int: CGFloat]()
    var topSafeArea:CGFloat = 0.0
    var yPostion:CGFloat = 0.0
    
    var segmentController = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let window = UIApplication.shared.keyWindow

        if #available(iOS 11.0, *) {
            topSafeArea = (window?.safeAreaInsets.top)!
            //    bottomSafeArea = view.safeAreaInsets.bottom
        } else {
            topSafeArea = topLayoutGuide.length
            //     bottomSafeArea = bottomLayoutGuide.length
        }
        
        topSafeArea = (topSafeArea < 1) ? 20 : topSafeArea
        
        if topSafeArea > 20 {
            yPostion = DesignUtility.getValueFromRatio(45)
        }else{
           yPostion = DesignUtility.getValueFromRatio(34)
        }
 
        createBackBtn()
      //  createSideMenuBtn()
        setUpNavBottomImage()
        //self.setupAppDefaultNavigationBar()
        self.hideKeyboardWhenTappedAround()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    

    func setUpNavBottomImage(){
        var imageView = UIImageView(image: UIImage(named: "navbar_bottom"))
        
        
        imageView.frame = CGRect(x: 30, y: 300, width: DesignUtility.getValueFromRatio(30), height: DesignUtility.getValueFromRatio(30))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(imageView)
        
        if #available(iOS 11, *) {
            imageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0.0).isActive = true
        } else {
            imageView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 0.0).isActive = true
        }

        if segmentController{
            imageView.image = UIImage(named: "earn_header")
            imageView.heightAnchor.constraint(equalToConstant: DesignUtility.getValueFromRatio(46)).isActive = true
        }
        
        imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0.0).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0.0).isActive = true
    }
    
    func setTitle(title:String){
        let font = UIFont.init(name: FontManager.constant(forKey: "fontRegular")!, size: CGFloat(FontManager.style(forKey: "sizeLarge")))
        
        let lblTitle = UILabel()
        lblTitle.text = title
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.numberOfLines = 1
        lblTitle.textAlignment = .center
        lblTitle.textColor = UIColor.white
        lblTitle.font = font
        
        lblTitle.backgroundColor = UIColor.red
        
        self.view.addSubview(lblTitle)
        lblTitle.heightAnchor.constraint(equalToConstant: 30).isActive = true
        lblTitle.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 250).isActive = true
        lblTitle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        
    }

    func betaMessage() -> Void {
        let info = MessageView.viewFromNib(layout: .cardView)
        info.configureTheme(.info)
        info.button?.isHidden = true
        info.configureContent(title: "Info", body: "Will be implemented in beta")
        var infoConfig = SwiftMessages.defaultConfig
        infoConfig.presentationStyle = .bottom
        infoConfig.presentationContext = .window(windowLevel: UIWindow.Level.normal)
        infoConfig.duration = .seconds(seconds: 0.7)
        SwiftMessages.show(config: infoConfig, view: info)
    }
    
    //Mark : Customizing navigation bar, adding bar buttons and custom title view
    func setupAppDefaultNavigationBar()  {
        
        //Setting navigation bar background color, its font and title color
        let barBgColor = UIColor.init(hexString: "#707070")
        let titleFont = UIFont.init(name: "FuturaStd-Medium", size: DesignUtility.getFontSize(fSize: 18))
        
        //self.navigationController?.navigationBar.setCustomNavigationBarWith(navigationBarTintColor: barBgColor, navigationBarTitleFont: titleFont!, navigationBarForegroundColor: UIColor.white)
        
//        self.navigationController?.view.backgroundColor = UIColor.white
        self.navigationItem.hidesBackButton = true
        //If navigation controller have more than 1 view controller then add backbutton
        if self.navigationController != nil{
            
//            self.setupSideButton()
        }
    }
    
    func createBackBtn(){
        if (self.navigationController?.viewControllers.count)! > 1{
            //Adding bar button items with given image and its position inside navigation bar and its selector
            let img = UIImage.init(named: "back-icon")
            self.addBarButtonItemWithImage(img ?? UIImage(), .BarButtonItemPositionLeft, self, #selector(self.popViewController))
        }
        
    }
    
//    func createSideMenuBtn(){
//        if (self.navigationController?.viewControllers.count)! == 1{
//            //Adding bar button items with given image and its position inside navigation bar and its selector
//            let img = UIImage.init(named: "sideMenu")
//            self.addBarButtonItemWithImage(img ?? UIImage(), .BarButtonItemPositionLeft, self, #selector(SideMenuController.showLeftViewAnimated(_:)))
//        }
//
//    }
    
    //Pop view controller
    @objc func popViewController() {
        self.navigationController?.popViewController(animated: true)
    }
    
    //Adding bar button items with given image and its position inside navigation bar and its selector
    func addBarButtonItemWithImage(_ image:UIImage,_ postion: CustomBarButtonItemPosition, _ target:UIViewController, _ selector:Selector) {
        
        let btn1 = UIButton(type: .custom)
        btn1.setImage(image, for: .normal)
        btn1.frame = CGRect(x: 0, y: 0, width: DesignUtility.getValueFromRatio(44), height: DesignUtility.getValueFromRatio(44))
        btn1.addTarget(self, action: selector, for: .touchUpInside)
        
        let item1 = UIBarButtonItem(customView: btn1)
        
        
        if let postion = postion as? CustomBarButtonItemPosition {
            
            switch postion {
            case .BarButtonItemPositionLeft:
                
                if self.navigationItem.leftBarButtonItem != nil{
                    
                    if (self.navigationItem.leftBarButtonItems?.count)! > 0{
                        
                        self.navigationItem.leftBarButtonItems?.append(item1)
                    }
                }
                else{
                    
                    self.navigationItem.leftBarButtonItem = item1
                }
                
            case .BarButtonItemPositionRight:
                
                if self.navigationItem.rightBarButtonItem != nil{
                    
                    if (self.navigationItem.rightBarButtonItems?.count)! > 0{
                        
                        self.navigationItem.rightBarButtonItems?.append(item1)
                    }
                }
                else{
                    
                    self.navigationItem.rightBarButtonItem = item1
                }
            }
        }
    }
    
    // Adding custom title view for navigation bar
    func addCustomTitleView(_ tileView:UIView) {
        
        // tileView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        //tileView.heightAnchor.constraint(equalToConstant: 33).isActive = true
        
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        tileView.frame = titleView.bounds
        self.navigationItem.titleView = tileView
    }
    
    
    @objc func slideCell(cell : UITableViewCell) {
        
        Animations.slideView(view: cell)
    }
    
    func setLeftPaddingTextField(_ textfield : BaseUITextField) {
        
        let leftView =  UILabel(frame: CGRect(x: 0, y: 0, width: DesignUtility.getValueFromRatio(15), height: textfield.frame.size.height))
        leftView.backgroundColor = UIColor.clear
        
        textfield.leftView = leftView
        textfield.leftViewMode = .always
        textfield.contentVerticalAlignment = .center
    }
}

//Mark : - Custom delegate for accessing diferrent properties of navigation bar
//protocol CustomNavBarProtocol { }
//
//enum CustomNavBarEnum: CustomNavBarProtocol {
//
//    enum CustomBarButtonItemPosition: Int, CustomNavBarProtocol {
//
//        case  BarButtonItemPositionRight = 1
//        case  BarButtonItemPositionLeft = 2
//    }
//}

enum CustomBarButtonItemPosition: Int {
    
    case  BarButtonItemPositionRight = 1
    case  BarButtonItemPositionLeft = 2
}

//Customzing default navigation bar appearence
extension UINavigationBar
{
    
    func setCustomNavigationBarWith(navigationBarTintColor color:UIColor, navigationBarTitleFont titleFont:UIFont, navigationBarForegroundColor foregroundColor:UIColor)
    {
        
        //165    77    52
        barTintColor = color
        let titleDict: NSDictionary = [NSAttributedString.Key.foregroundColor: foregroundColor, NSAttributedString.Key.font: titleFont]
        titleTextAttributes = (titleDict as! [NSAttributedString.Key : Any])
    }
}

//Mark : - Delegate for pressing navigation controller toolbar buttons
protocol DelegateToolbarButtons {
    
    func chatButtonPressed()
    func forwardButtonPressed()
}

