//
//  Labels.swift
//  LiveProgress
//
//  Created by Olga Vorona on 19/01/2019.
//  Copyright © 2019 Olga Vorona. All rights reserved.
//

import UIKit

@IBDesignable
open class BaseLabel: UILabel {
    
    public override init(frame: CGRect)
    {
        super.init(frame: frame)
        prepareAppearance()
    }
    
    required public init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        prepareAppearance()
    }
    
    open override func prepareForInterfaceBuilder()
    {
        super.prepareForInterfaceBuilder()
        prepareAppearance()
    }
    
    final func prepareAppearance()
    {
        font = type(of: self).font()
    }
    
    open class func font() -> UIFont
    {
        return UIFont.systemFont(ofSize: UIFont.systemFontSize)
    }
}

class titleLabel: BaseLabel {
    override class func font() -> UIFont {
        return UIFont.titleFont!
    }
}

extension UIFont {
    class var titleFont: UIFont? {
        return UIFont(name: "Rajdhani-Bold", size: 25.0)
    }
    
}
