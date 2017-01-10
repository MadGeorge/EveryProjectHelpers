//
//  ColorHelpers.swift
//  HRecipes
//
//  Created by MadGeorge on 10/12/2016.
//  Copyright © 2016 MadGeorge. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    /**
     Create UIcolor from color hex representation
     
     - Parameter hex: color hex string representation like #333333 or CCCCCC
     - Returns color from hex
     
     **Example:** 
       ```
       colorWithHexString("#333333")
       colorWithHexString("333333")
       colorWithHexString("CCCCCC")
       colorWithHexString("5f9eb7")
       ```
     */
    class func colorWithHexString (_ hex:String) -> UIColor {
        var cString: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased();
        
        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substring(from: 1)
        }
        
        if (cString.characters.count != 6) {
            return UIColor.gray
        }
        
        let rString = (cString as NSString).substring(to: 2)
        let gString = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
        let bString = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
    }
    
    /// Retutns default tint color #007AFF
    class func defaultTintColor() -> UIColor {
        // #007AFF
        return UIColor(red: 0.0, green: 122.0/255.0, blue: 1.0, alpha: 1.0)
    }
}
