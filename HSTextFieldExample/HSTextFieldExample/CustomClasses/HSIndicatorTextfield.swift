//
//  KHTextfield.swift
//  Khabarchin-App
//
//  Created by Hasan Sedaghat on 10/21/19.
//  Copyright © 2019 Hasan Sedaghat. All rights reserved.
//

import UIKit

class HSIndicatorTextfield: UITextField {
    
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
    
    @IBInspectable var selectedIndicatorFirstColor : UIColor = .clear
    @IBInspectable var selectedIndicatorSecondColor : UIColor = .clear
    @IBInspectable var placeholderTextColor : UIColor = .clear
    @IBInspectable var placeholderFontSize : CGFloat = 15
    @IBInspectable var unselectedTextColor : UIColor = .white
    
    private var IndicatorView = UIView()
    private let gradientLayer = CAGradientLayer()
    private var selectedColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    
    override func awakeFromNib() {
        self.borderStyle = .none
        IndicatorView.frame.size = CGSize(width: self.frame.size.width, height: indicatorHeight)
        IndicatorView.frame.origin = CGPoint(x: 0, y: self.frame.size.height - self.IndicatorView.frame.size.height)
        IndicatorView.backgroundColor = indicatorColor
        let placeholderFont = UIFont(name: self.font!.fontName, size: placeholderFontSize) ?? UIFont.systemFont(ofSize: placeholderFontSize)
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : placeholderTextColor,NSAttributedString.Key.font: placeholderFont])
        selectedColor = self.textColor! 
        self.addTarget(self, action: #selector(textFieldDidBeginEditing(_:)), for: .editingDidBegin)
        self.addTarget(self, action: #selector(textFieldDidEndEditing(_:)), for: .editingDidEnd)
        
        self.assignSelectedColor()
        self.addSubview(IndicatorView)
    
    }
    
    override func caretRect(for position: UITextPosition) -> CGRect {
        var rect = super.caretRect(for: position)
        rect.size.height = rect.size.height - 5
        return rect
    }
    
    private func assignSelectedColor() {
        self.gradientLayer.frame.size = CGSize(width: 0, height: self.IndicatorView.frame.size.height)
        self.gradientLayer.frame.origin = CGPoint(x: self.IndicatorView.frame.size.width / 2, y: self.IndicatorView.bounds.origin.y)
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.colors = [self.selectedIndicatorFirstColor.cgColor, selectedIndicatorSecondColor.cgColor]
        self.IndicatorView.layer.addSublayer(self.gradientLayer)
    }
    
    @objc private func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            self.gradientLayer.frame =  self.IndicatorView.bounds
            self.textColor = self.selectedColor
        }, completion: nil)
    }
    
    @objc private func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            self.gradientLayer.frame.size = CGSize(width: 0, height: self.IndicatorView.frame.size.height)
            self.gradientLayer.frame.origin = CGPoint(x: self.IndicatorView.frame.size.width / 2, y: self.IndicatorView.bounds.origin.y)
            self.textColor = self.unselectedTextColor
        }, completion: nil)
    }

    
}
