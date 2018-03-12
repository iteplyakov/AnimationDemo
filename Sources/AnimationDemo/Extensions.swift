//
//  Extensions.swift
//  AnimationDemo
//
//  Created by Tallium on 12.03.18.
//

import UIKit
import Animation

extension UIView: Interface {}

extension Bool {
    
    mutating func toggle() {
        self = !self
    }
    
}
