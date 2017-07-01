//
//  CircularProgress.Swift
//  CircularProgress
//
//  Created by Muhammad Umer on 29/06/2017.
//  Copyright © 2017 Fractalbyte. All rights reserved.
//

import UIKit

@IBDesignable
class CircularProgress: UIView {
    
    // MARK - DesignableProperties
    
    @IBInspectable var innerFillColor: UIColor = .white {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var outerFillColor: UIColor = .red {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var ratio: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var clockwise: Bool = true {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var duration: Int = 2 {
        didSet {
            self.durationForAnimation = Double(duration)
        }
    }
    
    var durationForAnimation: Double = 0
    
    func setRatio(ratio: CGFloat) {
        self.ratio = ratio
    }
    
    func calculateRatio(done: CGFloat, total: CGFloat) {
        if done != 0 && total != 0 {
            ratio = (done / total) * 100
        }
    }
    
    // MARK - UIView
    
    override func draw(_ rect: CGRect) {
        drawPie()
    }
    
    // MARK - DrawPie
    
    func drawPie() {
        let π = CGFloat.pi
        
        var angle: CGFloat
        var startAngle: CGFloat
        var endAngle: CGFloat
        
        if clockwise {
            angle = 90 - ratio * 360
            startAngle = -90 * π / 180
            endAngle = -angle * π / 180
        } else {
            angle = 90 + ratio * 360
            startAngle = -angle * π / 180
            endAngle = -90 * π / 180
        }
        
        let width = self.frame.width
        let height = self.frame.height
        
        let ovalPath = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: width, height: height))
        innerFillColor.setFill()
        ovalPath.fill()
        
        
        let oval2Rect = CGRect(x: 1, y: 1, width: width - 2, height: height - 2)
        let oval2Path = UIBezierPath()
        oval2Path.addArc(withCenter: CGPoint(x: oval2Rect.midX, y: oval2Rect.midY), radius: oval2Rect.width / 2, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        oval2Path.addLine(to: CGPoint(x: oval2Rect.midX, y: oval2Rect.midY))
        oval2Path.close()
        
        outerFillColor.setFill()
        oval2Path.fill()
    }
    
    // MARK - Private Methods
    
    private var timeInterval: CGFloat {
        let interval = CGFloat(durationForAnimation / 4)
        
        var intervals: CGFloat = interval
        
        if ratio > 0 && ratio <= 0.25 {
            intervals = interval
        } else if ratio > 0.25 && ratio <= 0.5 {
            intervals = 2 * interval
        } else if ratio > 0.5 && ratio <= 0.75 {
            intervals = 3 * interval
        } else if ratio > 0.75 && ratio <= 1 {
            intervals = 4 * interval
        }
        
        return intervals
    }
    
    func animatePie() {
        if ratio > 0 {
            animateFillWithDuration(timeInterval)
        }
    }
    
    var originalRatio: CGFloat = 0
    
    var counter = 0
    var timer = Timer()
    
    @objc private func updateRatio() {
        let endTime = Int(originalRatio * 100)
        
        counter += 1
        
        if counter > endTime {
            timer.invalidate()
        } else {
            
            let steps = CGFloat(counter)
            
            if steps > 0.0 {
                let value = steps / 100
                
                setRatio(ratio: value)
            }
        }
    }
    
    private func animateFillWithDuration(_ time: CGFloat) {
        self.originalRatio = self.ratio
        
        setRatio(ratio: 0)
        
        self.timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.updateRatio), userInfo: nil, repeats: true)
        
        timer.fire()
    }
}
