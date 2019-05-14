//
//  BaseVerticalButton.swift
//  SalonDesBeaute-Beautician
//
//  Created by High- Sierra 13.6 on 13/12/2018.
//  Copyright © 2018 teamingic. All rights reserved.
//

import UIKit

open class BaseVerticalButton: BaseUIButton {
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.alignTextBelow(spacing: DesignUtility.getValueFromRatio(3))
    }
}
