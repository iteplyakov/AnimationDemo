//
//  DisplayLinkTarget.swift
//  AnimationDemo
//
//  Created by Tallium on 12.03.18.
//

import QuartzCore

class DisplayLinkTarget {
    
    typealias Handler = (CFTimeInterval) -> Void
    
    init(handler: Handler? = nil) {
        self.handler = handler
    }
    
    private var handler: Handler?
    
    @objc func handle(displaylink: CADisplayLink) {
        handler?(displaylink.timestamp)
    }
    
}
