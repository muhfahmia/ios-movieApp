//
//  UIView.swift
//  MyMovie
//
//  Created by Muh Fahmi Ardiyanto on 21/02/24.
//

import Foundation
import UIKit

extension UIView {
    
    @IBInspectable var layerCornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.masksToBounds = true
            layer.cornerRadius = abs(CGFloat(Int(newValue * 100)) / 100)
        }
    }
    
    @discardableResult
        func anchor(
            top: NSLayoutYAxisAnchor? = nil,
            left: NSLayoutXAxisAnchor? = nil,
            bottom: NSLayoutYAxisAnchor? = nil,
            right: NSLayoutXAxisAnchor? = nil,
            topConstant: CGFloat = 0,
            leftConstant: CGFloat = 0,
            bottomConstant: CGFloat = 0,
            rightConstant: CGFloat = 0,
            widthConstant: CGFloat = 0,
            heightConstant: CGFloat = 0) -> [NSLayoutConstraint] {
                
            translatesAutoresizingMaskIntoConstraints = false

            var anchors = [NSLayoutConstraint]()

            if let top = top {
                anchors.append(topAnchor.constraint(equalTo: top, constant: topConstant))
            }

            if let left = left {
                anchors.append(leftAnchor.constraint(equalTo: left, constant: leftConstant))
            }

            if let bottom = bottom {
                anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant))
            }

            if let right = right {
                anchors.append(rightAnchor.constraint(equalTo: right, constant: -rightConstant))
            }

            if widthConstant > 0 {
                anchors.append(widthAnchor.constraint(equalToConstant: widthConstant))
            }

            if heightConstant > 0 {
                anchors.append(heightAnchor.constraint(equalToConstant: heightConstant))
            }

            NSLayoutConstraint.activate(anchors)

            return anchors
        }
    
}
