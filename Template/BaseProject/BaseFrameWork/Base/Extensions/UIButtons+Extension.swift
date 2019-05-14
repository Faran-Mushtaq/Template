//
//  UIButtons+Extension.swift
//  SalonDesBeaute
//
//  Created by High- Sierra 13.6 on 06/12/2018.
//  Copyright © 2018 High- Sierra 13.6. All rights reserved.
//

import UIKit

extension UIButton {
    func setImage( _ image : UIImage){
        self.setImage(image, for: .normal)
    }
    
    
    func setImage( _ imageName : String){
        self.setImage(UIImage.init(named: imageName), for: .normal)
    }
    
    
    func alignTextBelow(spacing: CGFloat = 6.0) {
        if let image = self.imageView?.image {
            let imageSize: CGSize = image.size
            self.titleEdgeInsets = UIEdgeInsets(top: spacing, left: -imageSize.width, bottom: -(imageSize.height), right: 0.0)
            let labelString = NSString(string: self.titleLabel!.text!)
            let titleSize = labelString.size(withAttributes: [NSAttributedString.Key.font: self.titleLabel!.font])
            self.imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + spacing), left: 0.0, bottom: 0.0, right: -titleSize.width)
        }
    }
}
