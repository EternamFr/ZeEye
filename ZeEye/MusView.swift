//
//  MusView.swift
//  ZeEye
//
//  Created by David Christy on 27/09/2015.
//  Copyright © 2015 David Christy. All rights reserved.
//

import Foundation
import UIKit

public class MusView : UIView {
    
    override public func drawRect(rect: CGRect) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()
        
        //// Color Declarations
        let fillColor5 = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
        let strokeColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
        let fillColor6 = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
        
        //// Shadow Declarations
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.blackColor().colorWithAlphaComponent(0.6)
        shadow.shadowOffset = CGSizeMake(2.1, 2.1)
        shadow.shadowBlurRadius = 4
        
        //// Group
        CGContextSaveGState(context)
        CGContextSetShadowWithColor(context, shadow.shadowOffset, shadow.shadowBlurRadius, (shadow.shadowColor as! UIColor).CGColor)
        CGContextBeginTransparencyLayer(context, nil)
        
        
        //// Bezier 9 Drawing
        
        
        //// Bezier 10 Drawing
        let bezier10Path = UIBezierPath()
        bezier10Path.moveToPoint(CGPointMake(1.72, 30.15))
        bezier10Path.addCurveToPoint(CGPointMake(16.35, 18.41), controlPoint1: CGPointMake(-0.42, 32.81), controlPoint2: CGPointMake(9.39, 17.81))
        bezier10Path.addCurveToPoint(CGPointMake(25.45, 28.21), controlPoint1: CGPointMake(23.31, 19.02), controlPoint2: CGPointMake(25.61, 23.51))
        bezier10Path.addCurveToPoint(CGPointMake(1.72, 30.15), controlPoint1: CGPointMake(25.27, 33.29), controlPoint2: CGPointMake(1.72, 30.15))
        bezier10Path.closePath()
        bezier10Path.miterLimit = 4;
        
        fillColor5.setFill()
        bezier10Path.fill()
        
        
        //// Bezier 11 Drawing
        let bezier11Path = UIBezierPath()
        bezier11Path.moveToPoint(CGPointMake(10.33, 22.77))
        bezier11Path.addCurveToPoint(CGPointMake(11.15, 13.2), controlPoint1: CGPointMake(10.39, 22.44), controlPoint2: CGPointMake(8.22, 15.54))
        bezier11Path.addCurveToPoint(CGPointMake(18.57, 14.81), controlPoint1: CGPointMake(14.08, 10.86), controlPoint2: CGPointMake(17.93, 11.65))
        bezier11Path.addCurveToPoint(CGPointMake(10.33, 22.77), controlPoint1: CGPointMake(19.21, 17.96), controlPoint2: CGPointMake(10.33, 22.77))
        bezier11Path.closePath()
        bezier11Path.miterLimit = 4;
        
        fillColor5.setFill()
        bezier11Path.fill()
        
        
        //// Oval 13 Drawing
        let oval13Path = UIBezierPath(ovalInRect: CGRectMake(1.23, 28.4, 1.23, 2))
        fillColor5.setFill()
        oval13Path.fill()
        
        
        //// Bezier 12 Drawing
        let bezier12Path = UIBezierPath()
        bezier12Path.moveToPoint(CGPointMake(20.64, 24.05))
        bezier12Path.addCurveToPoint(CGPointMake(29.83, 25.85), controlPoint1: CGPointMake(20.64, 24.05), controlPoint2: CGPointMake(27.7, 33.04))
        bezier12Path.addCurveToPoint(CGPointMake(36.5, 11.5), controlPoint1: CGPointMake(31.96, 18.66), controlPoint2: CGPointMake(33.12, 13.69))
        bezier12Path.lineCapStyle = .Round;
        
        strokeColor.setStroke()
        bezier12Path.lineWidth = 5
        bezier12Path.stroke()
        
        
        //// Oval 14 Drawing
        let oval14Path = UIBezierPath(ovalInRect: CGRectMake(10.6, 22.94, 1, 2.88))
        fillColor6.setFill()
        oval14Path.fill()
        
        
        CGContextEndTransparencyLayer(context)
        CGContextRestoreGState(context)
    
    }
}