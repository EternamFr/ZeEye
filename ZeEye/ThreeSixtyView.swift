//
//  ThreeSixtyView.swift
//  ZeEye
//
//  Created by David Christy on 27/09/2015.
//  Copyright © 2015 David Christy. All rights reserved.
//

import Foundation
import UIKit

public class ThreeSixtyView : UIView {
    override public func drawRect(rect: CGRect) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()
        
        //// Color Declarations
        let fillColor5 = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
        
        //// Shadow Declarations
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.blackColor()
        shadow.shadowOffset = CGSizeMake(2.1, 2.1)
        shadow.shadowBlurRadius = 4
        
        //// Group
        CGContextSaveGState(context)
        CGContextSetShadowWithColor(context, shadow.shadowOffset, shadow.shadowBlurRadius, (shadow.shadowColor as! UIColor).CGColor)
        CGContextBeginTransparencyLayer(context, nil)
        
        
        //// Group 2
        //// Bezier 4 Drawing
        let bezier4Path = UIBezierPath()
        bezier4Path.moveToPoint(CGPointMake(10.96, 23.6))
        bezier4Path.addCurveToPoint(CGPointMake(13.66, 21.12), controlPoint1: CGPointMake(11.43, 22.69), controlPoint2: CGPointMake(12.32, 21.86))
        bezier4Path.addLineToPoint(CGPointMake(15.66, 20.01))
        bezier4Path.addCurveToPoint(CGPointMake(17.54, 18.74), controlPoint1: CGPointMake(16.55, 19.52), controlPoint2: CGPointMake(17.18, 19.09))
        bezier4Path.addCurveToPoint(CGPointMake(18.39, 16.85), controlPoint1: CGPointMake(18.11, 18.19), controlPoint2: CGPointMake(18.39, 17.56))
        bezier4Path.addCurveToPoint(CGPointMake(17.61, 14.87), controlPoint1: CGPointMake(18.39, 16.02), controlPoint2: CGPointMake(18.13, 15.36))
        bezier4Path.addCurveToPoint(CGPointMake(15.53, 14.14), controlPoint1: CGPointMake(17.09, 14.38), controlPoint2: CGPointMake(16.4, 14.14))
        bezier4Path.addCurveToPoint(CGPointMake(12.87, 15.53), controlPoint1: CGPointMake(14.25, 14.14), controlPoint2: CGPointMake(13.36, 14.6))
        bezier4Path.addCurveToPoint(CGPointMake(12.44, 17.61), controlPoint1: CGPointMake(12.61, 16.03), controlPoint2: CGPointMake(12.46, 16.72))
        bezier4Path.addLineToPoint(CGPointMake(10.53, 17.61))
        bezier4Path.addCurveToPoint(CGPointMake(11.25, 14.57), controlPoint1: CGPointMake(10.55, 16.37), controlPoint2: CGPointMake(10.79, 15.35))
        bezier4Path.addCurveToPoint(CGPointMake(15.54, 12.5), controlPoint1: CGPointMake(12.06, 13.19), controlPoint2: CGPointMake(13.49, 12.5))
        bezier4Path.addCurveToPoint(CGPointMake(19.28, 13.83), controlPoint1: CGPointMake(17.25, 12.5), controlPoint2: CGPointMake(18.5, 12.94))
        bezier4Path.addCurveToPoint(CGPointMake(20.46, 16.77), controlPoint1: CGPointMake(20.07, 14.71), controlPoint2: CGPointMake(20.46, 15.69))
        bezier4Path.addCurveToPoint(CGPointMake(19.2, 19.7), controlPoint1: CGPointMake(20.46, 17.91), controlPoint2: CGPointMake(20.04, 18.89))
        bezier4Path.addCurveToPoint(CGPointMake(16.59, 21.41), controlPoint1: CGPointMake(18.72, 20.17), controlPoint2: CGPointMake(17.85, 20.74))
        bezier4Path.addLineToPoint(CGPointMake(15.17, 22.16))
        bezier4Path.addCurveToPoint(CGPointMake(13.57, 23.19), controlPoint1: CGPointMake(14.49, 22.52), controlPoint2: CGPointMake(13.96, 22.86))
        bezier4Path.addCurveToPoint(CGPointMake(12.26, 25.11), controlPoint1: CGPointMake(12.88, 23.76), controlPoint2: CGPointMake(12.44, 24.4))
        bezier4Path.addLineToPoint(CGPointMake(20.39, 25.11))
        bezier4Path.addLineToPoint(CGPointMake(20.39, 26.8))
        bezier4Path.addLineToPoint(CGPointMake(10.17, 26.8))
        bezier4Path.addCurveToPoint(CGPointMake(10.96, 23.6), controlPoint1: CGPointMake(10.24, 25.57), controlPoint2: CGPointMake(10.5, 24.5))
        bezier4Path.closePath()
        bezier4Path.miterLimit = 4;
        
        fillColor5.setFill()
        bezier4Path.fill()
        
        
        //// Bezier 5 Drawing
        let bezier5Path = UIBezierPath()
        bezier5Path.moveToPoint(CGPointMake(21.12, 16.2))
        bezier5Path.addLineToPoint(CGPointMake(33.15, 16.2))
        bezier5Path.addLineToPoint(CGPointMake(33.15, 17.8))
        bezier5Path.addLineToPoint(CGPointMake(31.62, 17.8))
        bezier5Path.addLineToPoint(CGPointMake(31.62, 24.33))
        bezier5Path.addCurveToPoint(CGPointMake(32.4, 25.42), controlPoint1: CGPointMake(31.61, 25.07), controlPoint2: CGPointMake(31.87, 25.43))
        bezier5Path.addCurveToPoint(CGPointMake(33.29, 25.32), controlPoint1: CGPointMake(32.77, 25.42), controlPoint2: CGPointMake(33.07, 25.38))
        bezier5Path.addLineToPoint(CGPointMake(33.29, 26.9))
        bezier5Path.addCurveToPoint(CGPointMake(31.74, 27), controlPoint1: CGPointMake(32.98, 26.96), controlPoint2: CGPointMake(32.46, 27))
        bezier5Path.addCurveToPoint(CGPointMake(30.68, 26.78), controlPoint1: CGPointMake(31.3, 27), controlPoint2: CGPointMake(30.95, 26.93))
        bezier5Path.addCurveToPoint(CGPointMake(30.06, 26.25), controlPoint1: CGPointMake(30.41, 26.66), controlPoint2: CGPointMake(30.2, 26.48))
        bezier5Path.addCurveToPoint(CGPointMake(29.79, 25.42), controlPoint1: CGPointMake(29.92, 26.01), controlPoint2: CGPointMake(29.83, 25.73))
        bezier5Path.addCurveToPoint(CGPointMake(29.69, 24.41), controlPoint1: CGPointMake(29.72, 25.12), controlPoint2: CGPointMake(29.69, 24.78))
        bezier5Path.addLineToPoint(CGPointMake(29.69, 17.8))
        bezier5Path.addLineToPoint(CGPointMake(24.57, 17.8))
        bezier5Path.addLineToPoint(CGPointMake(24.57, 26.8))
        bezier5Path.addLineToPoint(CGPointMake(22.65, 26.8))
        bezier5Path.addLineToPoint(CGPointMake(22.65, 17.8))
        bezier5Path.addLineToPoint(CGPointMake(21.11, 17.8))
        bezier5Path.addLineToPoint(CGPointMake(21.11, 16.2))
        bezier5Path.addLineToPoint(CGPointMake(21.12, 16.2))
        bezier5Path.closePath()
        bezier5Path.miterLimit = 4;
        
        fillColor5.setFill()
        bezier5Path.fill()
        
        
        
        
        //// Group 3
        //// Bezier 6 Drawing
        let bezier6Path = UIBezierPath()
        bezier6Path.moveToPoint(CGPointMake(36.04, 29.01))
        bezier6Path.addCurveToPoint(CGPointMake(21.93, 36.75), controlPoint1: CGPointMake(33.15, 33.65), controlPoint2: CGPointMake(27.91, 36.75))
        bezier6Path.addCurveToPoint(CGPointMake(5.45, 20.75), controlPoint1: CGPointMake(12.84, 36.75), controlPoint2: CGPointMake(5.45, 29.57))
        bezier6Path.addCurveToPoint(CGPointMake(21.93, 4.75), controlPoint1: CGPointMake(5.45, 11.93), controlPoint2: CGPointMake(12.84, 4.75))
        bezier6Path.addCurveToPoint(CGPointMake(37.37, 15.18), controlPoint1: CGPointMake(29, 4.75), controlPoint2: CGPointMake(35.03, 9.1))
        bezier6Path.addCurveToPoint(CGPointMake(38.29, 14.71), controlPoint1: CGPointMake(37.65, 14.99), controlPoint2: CGPointMake(37.95, 14.84))
        bezier6Path.addCurveToPoint(CGPointMake(21.94, 3.75), controlPoint1: CGPointMake(35.77, 8.32), controlPoint2: CGPointMake(29.4, 3.75))
        bezier6Path.addCurveToPoint(CGPointMake(4.42, 20.75), controlPoint1: CGPointMake(12.28, 3.75), controlPoint2: CGPointMake(4.42, 11.38))
        bezier6Path.addCurveToPoint(CGPointMake(21.94, 37.75), controlPoint1: CGPointMake(4.42, 30.12), controlPoint2: CGPointMake(12.28, 37.75))
        bezier6Path.addCurveToPoint(CGPointMake(36.83, 29.68), controlPoint1: CGPointMake(28.22, 37.75), controlPoint2: CGPointMake(33.74, 34.52))
        bezier6Path.addCurveToPoint(CGPointMake(36.04, 29.01), controlPoint1: CGPointMake(36.54, 29.48), controlPoint2: CGPointMake(36.27, 29.26))
        bezier6Path.closePath()
        bezier6Path.miterLimit = 4;
        
        fillColor5.setFill()
        bezier6Path.fill()
        
        //// Bezier 7 Drawing
        let bezier7Path = UIBezierPath()
        bezier7Path.moveToPoint(CGPointMake(39.07, 17.37))
        bezier7Path.addLineToPoint(CGPointMake(34.82, 15.1))
        bezier7Path.addLineToPoint(CGPointMake(39.83, 12.79))
        bezier7Path.addLineToPoint(CGPointMake(39.07, 17.37))
        bezier7Path.closePath()
        bezier7Path.miterLimit = 4;
        
        fillColor5.setFill()
        bezier7Path.fill()
        
        CGContextEndTransparencyLayer(context)
        CGContextRestoreGState(context)
    }
}