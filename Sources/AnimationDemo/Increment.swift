//
//  Increment.swift
//  AnimationDemo
//
//  Created by Tallium on 12.03.18.
//

import Animation

struct Increment<TimingCurve: Transformation>: Animation where TimingCurve.Value == Double {
    
    init(by delta: Double, with timing: TimingCurve) {
        self.delta = delta
        self.timing = timing
    }
    
    let delta: Double
    
    let timing: TimingCurve
    
    func transform(value: Double) -> Double {
        return value + delta
    }
    
}
