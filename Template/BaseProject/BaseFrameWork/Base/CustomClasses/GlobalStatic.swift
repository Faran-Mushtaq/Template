//
//  GlobalStatic.swift


import UIKit
open class GlobalStatic {
    
    static func getFormatedAddress(add: String) -> String {
        let addArr = add.components(separatedBy: "|")
        var addString = addArr[0]
        for i in 1..<addArr.count {
            if !addArr[i].isEmptyStr() {
            addString = addString + ", " + addArr[i]
            }
        }
        return addString
    }
    
    
    
   open class func getLocalizedString(_ key : String) -> String {
        return NSLocalizedString(key, comment: "")
    }
    
    
 
    
  class func createAttributedString(fullString: String, boldStringArray: [String]) -> NSMutableAttributedString
    {
        
        let boldFontAttribute = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 13.0)]
        
        let attributedString = NSMutableAttributedString(string:fullString)
        for ind in 0..<boldStringArray.count {
            
            let range = (fullString as NSString).range(of: boldStringArray[ind])
            attributedString.addAttributes(boldFontAttribute, range: range)
            
            
        }
        
        return attributedString
    }
    
   
    
    static func delay(delay:Double, closure:@escaping ()->())
    {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
    
    static func getHairCuttingImages() -> [String]{
        
        return ["list-newtalent-icon",
                "list-intermediate-icon",
                "list-senior-icon",
                "list-rebonding-icon",
                "list-haircolor-icon",
                "list-hairstraight-icon"]
    }
    
    
    static func getHairCuttingTitles() -> [String]{
        
        return ["New Talent",
                "Intermediate",
                "Senior",
                "Rebonding",
                "Hair Color",
                "Hair Straightening"]
    }
    
    
    static func getHairCuttingPrice() -> [String]{
        
        return ["Rs. 1,500",
                "Rs. 2,000",
                "Rs. 3,000",
                "Rs. 2,100",
                "Rs. 1,600",
                "Rs. 6,200"]
    }
    
    
    static func getServiceImage() -> [String]{
        
        return ["palr-service-icon",
                "palr-promotion-icon",
                "palr-staff-icon",
                "palr-aboutparlour-icon",
                "palr-reviews-icon"]
    }
    
    static func getServiceTitle() -> [String]{
        
        return ["Services",
                "Promotions",
                "Parlour Stuff",
                "About Parlour",
                "Reviews"]
    }
    
    static func getServiceListed() -> [String]{
        
        return ["Total Services Listed",
                "Total Promotions Listed",
                "Total Parlour Stuff",
                "Parlour Listed",
                "Total Reviews"]
    }
    
    static func getMostUsedService() -> [String]{
        
        return ["Most Used Services",
                "Most Availed Promotions",
                "Most Engaged Stuff",
                "Most Engaged Users",
                "Recently Reviwed By"]
    }
    
    static func getServiceNumber() -> [String]{
        
        return ["12",
                "16",
                "20",
                "01",
                "55"]
    }
    
    static func getColorForServices() -> [String]{
        
        return ["serviceDarkPurple",
                "serviceBlue",
                "serviceYellow",
                "serviceLightPurple",
                "serviceRed"]
    }
    
    static func getServices() -> [String]{
        
        return ["Hair Cutting",
                "Facials",
                "Make Up",
                "Styling",
                "Waxing"]
    }
    
    static func getPromotions() -> [String]{
        
        return ["Classic",
                "Deluxe",
                "Premium"]
    }
    
    static func getParlourStuff() -> [String]{
        
        return ["Rebert Dewney",
                "Jack Sparrow",
                "Alia Montana",
                "Ali"]
    }
    
    static func getAboutParlour() -> [String]{
        
        return ["Rebert Dewney",
                "Jack Sparrow",
                "Alia Montana",
                "Ali"]
    }
    
    static func getReview() -> [String]{
        
        return ["Rebert Dewney",
                "Jack Sparrow",
                "Alia Montana",
                "Ali"]
    }
    
    
    static func getPackages() -> [String]{
        
        return ["Classic Package",
                "Ultra Package",
                "Premium Package",
                "Winter Package",
                "Summer Package"]
    }
    
    
    static func getPackageColors() -> [String]{
        
        return ["#EF3363",
                "#3397F1",
                "#673ED8",
                "#9734E2",
                "#F9AB17"]
    }
    
    
    static func getPackageColorName() -> [String]{
        
        return ["packageRed",
                "packageBlue",
                "packagePurple",
                "packageLightPurple",
                "packageYellow"]
    }
    
}

extension UILabel {
    
    func colorString(text: String?, coloredText: String?, color: UIColor? = .red) {
        let boldFontAttribute = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: DesignUtility.getFontSize(fSize: 16))]
        let attributedString = NSMutableAttributedString(string: text!)
        let range = (text! as NSString).range(of: coloredText!)
        attributedString.setAttributes([NSAttributedString.Key.foregroundColor: color!],
                                       range: range)
         attributedString.addAttributes(boldFontAttribute, range: range)
        
        self.attributedText = attributedString
}
}


