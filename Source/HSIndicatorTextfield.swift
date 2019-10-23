//
//  KHTextfield.swift
//  Khabarchin-App
//
//  Created by Hasan Sedaghat on 10/21/19.
//  Copyright © 2019 Hasan Sedaghat. All rights reserved.
//

import UIKit


class HSIndicatorTextfield: UITextField {
    
    private let gradientLayer = CAGradientLayer()
    var IndicatorView = UIView()
    
    @IBInspectable var indicatorHeight : CGFloat  {
        get {
            return self.IndicatorView.frame.height
        }
        set {
            self.IndicatorView.bounds.size = CGSize(width: self.IndicatorView.bounds.size.width, height: newValue)
        }
    }

    
    @IBInspectable var indicatorColor : UIColor  {
        get {
            return IndicatorView.backgroundColor!
        }
        set {
            IndicatorView.backgroundColor = newValue
        }
    }
    
    @IBInspectable var selectedIndicatorFirstColor : UIColor  {
        get {
            return self.firstColor
        }
        set {
            self.firstColor = newValue
        }
    }
    
    @IBInspectable var selectedIndicatorSecondColor : UIColor  {
        get {
            return self.secondColor
        }
        set {
            self.secondColor = newValue
        }
    }
    
    @IBInspectable var placeholderText : String  {
        get {
            return placeholderString ?? ""
        }
        set {
            self.placeholderString = newValue
        }
    }
    
    @IBInspectable var placeholderTextColor : UIColor  {
        get {
            return placeholderColor
        }
        set {
            placeholderColor = newValue
        }
    }
    
    var firstColor = #colorLiteral(red: 0, green: 0.342538049, blue: 1, alpha: 1)
    var secondColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    var placeholderString:String?
    var placeholderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    var placeholderFont = UIFont.systemFont(ofSize: 15)
    
    override func awakeFromNib() {
        
        self.borderStyle = .none
        IndicatorView.frame.size = CGSize(width: self.frame.size.width, height: indicatorHeight)
        IndicatorView.frame.origin = CGPoint(x: 0, y: self.frame.size.height - self.IndicatorView.frame.size.height)
        IndicatorView.backgroundColor = indicatorColor
        self.placeholderFont = self.font!
        self.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor : placeholderColor,NSAttributedString.Key.font: placeholderFont])
        
        self.addTarget(self, action: #selector(textFieldDidBeginEditing(_:)), for: .editingDidBegin)
        self.addTarget(self, action: #selector(textFieldDidEndEditing(_:)), for: .editingDidEnd)
        
        self.assignSelectedColor()
        
        self.addSubview(IndicatorView)
    
    }
    
    func assignSelectedColor() {
        self.gradientLayer.frame.size = CGSize(width: 0, height: self.IndicatorView.frame.size.height)
        self.gradientLayer.frame.origin = CGPoint(x: self.IndicatorView.frame.size.width / 2, y: self.IndicatorView.bounds.origin.y)
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
        self.IndicatorView.layer.addSublayer(self.gradientLayer)
    }
    
    @objc func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            self.gradientLayer.frame.origin =  self.IndicatorView.bounds.origin
            self.gradientLayer.frame.size = self.IndicatorView.frame.size
        }, completion: nil)
    }
    
    @objc func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            self.gradientLayer.frame.size = CGSize(width: 0, height: self.IndicatorView.frame.size.height)
            self.gradientLayer.frame.origin = CGPoint(x: self.IndicatorView.frame.size.width / 2, y: self.IndicatorView.bounds.origin.y)
        }, completion: nil)
    }

    
}
