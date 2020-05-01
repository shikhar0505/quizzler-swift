//
//  myCustomDesignable.swift
//  Quizzler
//
//  Created by Shikhar Kumar on 1/7/20.
//  Copyright © 2020 Shikhar Kumar. All rights reserved.
//

import UIKit

@IBDesignable class MyCustomDesignable: UIButton {

    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
           layer.borderColor = borderColor.cgColor
        }
    }

    @IBInspectable var borderWidth: CGFloat = 0 {
       didSet {
          layer.borderWidth = borderWidth
       }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
       didSet {
          layer.cornerRadius = cornerRadius
       }
    }
}
