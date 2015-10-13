//
//  StadiumChart.swift
//  ZeEye
//
//  Created by David Christy on 08/10/2015.
//  Copyright © 2015 David Christy. All rights reserved.
//

import Foundation
import UIKit

public class DiscChart : UIView {
    
    private var data = [NameableAndCountable]()

    // hex to float converter:
    // http://www.corecoding.com/utilities/rgb-or-hex-to-float.php
    // implementer la d3.scale.category20c()
    // category10 colors from d3 - https://github.com/mbostock/d3/wiki/Ordinal-Scales
    public static let colors: [UIColor] = [
        UIColor(red: 0.121569, green: 0.466667, blue: 0.705882, alpha: 1),
        UIColor(red: 1, green: 0.498039, blue: 0.054902, alpha: 1),
        UIColor(red: 0.172549, green: 0.627451, blue: 0.172549, alpha: 1),
        UIColor(red: 0.839216, green: 0.152941, blue: 0.156863, alpha: 1),
        UIColor(red: 0.580392, green: 0.403922, blue: 0.741176, alpha: 1),
        UIColor(red: 0.54902, green: 0.337255, blue: 0.294118, alpha: 1),
        UIColor(red: 0.890196, green: 0.466667, blue: 0.760784, alpha: 1),
        UIColor(red: 0.498039, green: 0.498039, blue: 0.498039, alpha: 1),
        UIColor(red: 0.737255, green: 0.741176, blue: 0.133333, alpha: 1),
        UIColor(red: 0.0901961, green: 0.745098, blue: 0.811765, alpha: 1)
    ]
    
    func renderData(d: [NameableAndCountable]) {
        data = d
        self.setNeedsDisplay()
    }
    
    override public func drawRect(rect: CGRect) {
        //UIColor.blackColor().setStroke()

//        let path = UIBezierPath()
//        path.moveToPoint(CGPoint(x: 50, y: 50))
//        path.addLineToPoint(CGPoint(x: 100, y: 100))
//        
//        path.stroke()
        //Important constants for circle
        let fullCircle = 2.0 * CGFloat(M_PI)
        var start:CGFloat = 0.25 * fullCircle
        var end:CGFloat = -0.25 * fullCircle
        
        let arcWidth: CGFloat = 50.0
        //find the centerpoint of the rect
        let centerPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect))
        
        //define the radius by the smallest side of the view
        var radius:CGFloat = 0.0
        if CGRectGetWidth(rect) > CGRectGetHeight(rect){
            radius = (CGRectGetHeight(rect) - arcWidth) / 2.0
        }else{
            radius = (CGRectGetWidth(rect) - arcWidth) / 2.0
        }

//        let centeredRec = CGRectMake(centerPoint.x - radius / 2, centerPoint.y - radius / 2, radius, radius)
        
        let sum = self.data.map({$0.GetCount()}).reduce(0, combine: +)
        let proportions = self.data.map({CGFloat($0.GetCount()) / CGFloat(sum)})
        
        for (index, element) in data.enumerate() {
            start = end
            end = end + fullCircle * proportions[index]
            
            // define arc
            let arc = CAShapeLayer()
            arc.frame = self.bounds
            arc.lineWidth = arcWidth
            arc.path = UIBezierPath(arcCenter: centerPoint, radius: radius, startAngle: start, endAngle: end, clockwise: true).CGPath
            arc.strokeColor = DiscChart.colors[index].CGColor
            arc.fillColor = UIColor.clearColor().CGColor
            arc.strokeStart = 0
            arc.strokeEnd = 1.0
            
            self.layer.addSublayer(arc)
            
            // animate arc drawing
            let anim = CABasicAnimation(keyPath: "strokeEnd")
            anim.duration = 0.8
            anim.fromValue = 0
            anim.toValue = 1
            arc.addAnimation(anim, forKey: "strokeEnd")
            
            // display count if not less than around 10 degree
            if (end - start) < 0.17 {
                continue
            }
            let middleAngle = (start + end) / 2.0
            let opposite = sin(middleAngle) * radius
            let adjacent = cos(middleAngle) * radius
            
            let labelCenter = CGPointMake(centerPoint.x + self.getDeltaX(middleAngle,adjacent: adjacent), centerPoint.y + self.getDeltaY(middleAngle,opposite: opposite))
            
            let lbl = UILabel(frame: CGRectMake(labelCenter.x - 20, labelCenter.y - 20, 40, 40))
            lbl.textAlignment = .Center
            lbl.text = "\(element.GetCount())"
            lbl.alpha = 0.0
            
            UIView.animateWithDuration(0.8, delay: 0.5, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                lbl.alpha = 1.0
            }, completion: nil)
            
            self.insertSubview(lbl, aboveSubview: self)
        }
    }
    
    private func getDeltaX(angle: CGFloat, adjacent: CGFloat) -> CGFloat {
        switch angle {
        case CGFloat(M_PI_2)...3 * CGFloat(M_PI_2):
            return -abs(adjacent)
            default:
            return abs(adjacent)
        }
    }
    
    private func getDeltaY(angle: CGFloat, opposite: CGFloat) -> CGFloat {
        switch angle {
        case 0...CGFloat(M_PI):
            return abs(opposite)
        default:
            return -abs(opposite)
        }
    }
    
}

//http://jamesonquave.com/blog/fun-with-cashapelayer/
//http://makeapppie.com/2015/03/10/swift-swift-basic-core-graphics-for-the-ring-graph/#comment-15340