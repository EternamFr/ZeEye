//
//  HumanView.swift
//  ZeEye
//
//  Created by David Christy on 27/09/2015.
//  Copyright © 2015 David Christy. All rights reserved.
//

import Foundation
import UIKit

public class HumanView : UIView {
    override public func drawRect(rect: CGRect) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()
        
        //// Color Declarations
        let fillColor5 = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
        
        //// Shadow Declarations
        let shadow2 = NSShadow()
        shadow2.shadowColor = UIColor.blackColor().colorWithAlphaComponent(0.6)
        shadow2.shadowOffset = CGSizeMake(2.1, 2.1)
        shadow2.shadowBlurRadius = 4
        
        //// Group
        CGContextSaveGState(context)
        CGContextSetShadowWithColor(context, shadow2.shadowOffset, shadow2.shadowBlurRadius, (shadow2.shadowColor as! UIColor).CGColor)
        CGContextBeginTransparencyLayer(context, nil)
        
        
        //// Oval 12 Drawing
        let oval12Path = UIBezierPath(ovalInRect: CGRectMake(17.93, 2.9, 7.39, 5.39))
        fillColor5.setFill()
        oval12Path.fill()
        
        
        //// Bezier 8 Drawing
        let bezier8Path = UIBezierPath()
        bezier8Path.moveToPoint(CGPointMake(29.33, 16.33))
        bezier8Path.addCurveToPoint(CGPointMake(24.64, 9.78), controlPoint1: CGPointMake(29, 10.67), controlPoint2: CGPointMake(26.7, 10.2))
        bezier8Path.addLineToPoint(CGPointMake(21.69, 9.78))
        bezier8Path.addLineToPoint(CGPointMake(18.68, 9.78))
        bezier8Path.addCurveToPoint(CGPointMake(13.92, 16.33), controlPoint1: CGPointMake(16.84, 10.24), controlPoint2: CGPointMake(14.25, 10.67))
        bezier8Path.addCurveToPoint(CGPointMake(13.92, 23.43), controlPoint1: CGPointMake(13.59, 21.99), controlPoint2: CGPointMake(13.92, 23.43))
        bezier8Path.addCurveToPoint(CGPointMake(16.43, 23.43), controlPoint1: CGPointMake(13.92, 23.43), controlPoint2: CGPointMake(15.01, 25.6))
        bezier8Path.addCurveToPoint(CGPointMake(16.47, 17.38), controlPoint1: CGPointMake(16.47, 22.73), controlPoint2: CGPointMake(16.47, 17.38))
        bezier8Path.addCurveToPoint(CGPointMake(17.35, 13.85), controlPoint1: CGPointMake(16.47, 17.38), controlPoint2: CGPointMake(16.47, 13.65))
        bezier8Path.addCurveToPoint(CGPointMake(17.47, 36.45), controlPoint1: CGPointMake(18.22, 14.04), controlPoint2: CGPointMake(17.47, 36.45))
        bezier8Path.addCurveToPoint(CGPointMake(21.44, 36.45), controlPoint1: CGPointMake(17.47, 36.45), controlPoint2: CGPointMake(19.42, 39.18))
        bezier8Path.addLineToPoint(CGPointMake(21.44, 22.57))
        bezier8Path.addLineToPoint(CGPointMake(21.69, 22.57))
        bezier8Path.addLineToPoint(CGPointMake(21.94, 22.57))
        bezier8Path.addLineToPoint(CGPointMake(21.94, 36.45))
        bezier8Path.addCurveToPoint(CGPointMake(25.84, 36.45), controlPoint1: CGPointMake(23.93, 39.18), controlPoint2: CGPointMake(25.84, 36.45))
        bezier8Path.addCurveToPoint(CGPointMake(25.97, 13.85), controlPoint1: CGPointMake(25.84, 36.45), controlPoint2: CGPointMake(25.1, 14.04))
        bezier8Path.addCurveToPoint(CGPointMake(26.83, 17.38), controlPoint1: CGPointMake(26.83, 13.65), controlPoint2: CGPointMake(26.83, 17.38))
        bezier8Path.addCurveToPoint(CGPointMake(26.87, 23.43), controlPoint1: CGPointMake(26.83, 17.38), controlPoint2: CGPointMake(26.83, 22.73))
        bezier8Path.addCurveToPoint(CGPointMake(29.34, 23.43), controlPoint1: CGPointMake(28.27, 25.6), controlPoint2: CGPointMake(29.34, 23.43))
        bezier8Path.addCurveToPoint(CGPointMake(29.33, 16.33), controlPoint1: CGPointMake(29.34, 23.43), controlPoint2: CGPointMake(29.66, 21.99))
        bezier8Path.closePath()
        bezier8Path.miterLimit = 4;
        
        fillColor5.setFill()
        bezier8Path.fill()
        
        
        CGContextEndTransparencyLayer(context)
        CGContextRestoreGState(context)

    }
}