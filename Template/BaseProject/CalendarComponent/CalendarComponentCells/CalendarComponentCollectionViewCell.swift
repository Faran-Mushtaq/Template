//
//  CalendarComponentCollectionViewCell.swift
//  SalonDesBeaute
//
//  Created by High- Sierra 13.6 on 07/12/2018.
//  Copyright © 2018 High- Sierra 13.6. All rights reserved.
//

import UIKit

class CalendarComponentCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var lblDate: BaseUILabel!
    @IBOutlet weak var lblDay: BaseUILabel!
    @IBOutlet weak var imgBgSelected: UIImageView!
    
    var whiteColor = UIColor.white
    var defaultColor = UIColor.init(hexString: "#7C7795")
    var purpleColor = UIColor.init(hexString: "#322251")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       // self.lblDate.textColor = purpleColor
      //  self.lblDay.textColor = purpleColor
        self.imgBgSelected.isHidden = true
    }
    
    override var isSelected: Bool{
        didSet{
            
            if self.isSelected{
              
                self.lblDate.fontColorTheme = "white" //ColorManager.color(forKey: "white")
                 self.lblDay.fontColorTheme = "white" //ColorManager.color(forKey: "white")
                self.imgBgSelected.isHidden = false
                
            }else{
                self.lblDate.fontColorTheme = "darkPurpleButton"//ColorManager.color(forKey: "purpleText")
                self.lblDay.fontColorTheme = "darkPurpleButton" // ColorManager.color(forKey: "purpleText")
                
               
                self.imgBgSelected.isHidden = true
            }
        }
    }
 

}
