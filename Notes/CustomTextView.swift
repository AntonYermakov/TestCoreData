//
//  CustomTextView.swift
//  Notes
//
//  Created by Yermakov Anton on 22.09.17.
//  Copyright © 2017 Yermakov Anton. All rights reserved.
//

import UIKit
@IBDesignable

class CustomTextView: UITextView {

    @IBInspectable public var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
}
