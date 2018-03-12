//
//  DisplayTimer.swift
//  AnimationDemo
//
//  Created by Tallium on 12.03.18.
//

import QuartzCore
import Animation

final class DisplayTimer {
    
    init(displaylink: CADisplayLink) {
        self.displaylink = displaylink
    }
    
    let displaylink: CADisplayLink
    
    deinit {
        displaylink.invalidate()
    }
    
}

// MARK: - RunLoopTimer

extension DisplayTimer: RunLoopTimer {
    
    convenience init(with trigger: @escaping Trigger) {
        let target = DisplayLinkTarget(handler: trigger)
        let link = CADisplayLink(target: target, selector: #selector(DisplayLinkTarget.handle(displaylink:)))
        self.init(displaylink: link)
    }
    
    var last: CFTimeInterval {
        return displaylink.timestamp
    }
    
    var next: CFTimeInterval {
        return displaylink.targetTimestamp
    }
    
    var isTimeAvailable: Bool {
        return displaylink.targetTimestamp > CACurrentMediaTime()
    }
    
    func add(to runloop: RunLoop, for mode: RunLoopMode) {
        displaylink.add(to: runloop, forMode: mode)
    }
    
    func invalidate() {
        displaylink.invalidate()
    }
    
}
