//
//  ColorSchemes.swift
//  LiveProgress
//
//  Created by Olga Vorona on 15/12/2018.
//  Copyright © 2018 Olga Vorona. All rights reserved.
//

import UIKit

enum standardScheme {
    static let first = UIColor(hexString: "2ab7ca")
    static let second = UIColor(hexString: "00a2ad")
    static let third = UIColor(hexString: "f9f7f6")
    static let forth = UIColor(hexString: "fdd65d")
    static let last = UIColor(hexString: "fed766")
}

extension UIColor {
    
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
    
    var contrastColor: UIColor {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: nil)
        red = red * 255
        green = green * 255
        blue = blue * 255
        
        // Counting the perceptive luminance - human eye favors green color...
        let a: CGFloat = 1 - ( 0.299 * red + 0.587 * green + 0.114 * blue) / 255
        
        if a < 0.5 {
            return .black
        } else {
            return .white;
        }
    }
}
