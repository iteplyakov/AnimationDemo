//
//  ViewController.swift
//  AnimationDemo
//
//  Created by Tallium on 12.03.18.
//

import UIKit
import Animation

class ViewController: UIViewController {

    @IBOutlet weak var blueSquare: UIView!
    
    @IBAction func animateSquare(_ button: UIButton) {
        verticallyMove(view: blueSquare, by: button.isSelected ? .defaultDistance : -.defaultDistance)
        button.isSelected.toggle()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        coordinator.timer.add(to: .main, for: .defaultRunLoopMode)
    }
    
    private lazy var coordinator = AnimationCoordinator<Double, DisplayTimer>()
    
    private func verticallyMove(view: UIView, by delta: Double) {
        let animator = TimeDrivenAnimator(
            animation: Increment(by: delta, with: Spring()),
            interface: blueSquare,
            keyPath: \.center.y.native,
            duration: .defaultDuration
        )
        coordinator.add(animator: animator)
    }

}

// MARK: - Constants

extension Double {
    
    static var defaultDistance: Double {
        return 200
    }

}

extension TimeInterval {
    
    static var defaultDuration: TimeInterval {
        return 1
    }
    
}
