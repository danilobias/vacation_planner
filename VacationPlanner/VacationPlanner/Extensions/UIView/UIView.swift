//
//  UIView.swift
//  VacationPlanner
//
//  Created by Danilo on 25/07/2018.
//  Copyright © 2018 Danilo Bias Lago. All rights reserved.
//

import UIKit

extension UIView {
    
    // MARK: Corner
    func cornerRadius(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    func circleView() {
        let halfWidth = self.layer.frame.size.height/2
        cornerRadius(radius: halfWidth)
    }
    
    // MARK: Border
    func border(withColor color: UIColor, andWidth width: CGFloat) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }

    
    // MARK: Shadow
    func shadow(color: UIColor) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 0.8
        
        self.layer.masksToBounds = false
    }


}
