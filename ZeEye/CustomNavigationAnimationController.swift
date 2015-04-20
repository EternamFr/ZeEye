//
//  CustomNavigationAnimationController.swift
//  ZeEye
//
//  Created by David Christy on 07/04/2015.
//  Copyright (c) 2015 David Christy. All rights reserved.
//

import UIKit

class CustomNavigationAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    var reverse: Bool = false
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.8
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        
        let finalFrameForVC = transitionContext.finalFrameForViewController(toViewController)
        
        let containerView = transitionContext.containerView()
        
        let bounds = UIScreen.mainScreen().bounds
        
        let direction: CGFloat = reverse ? -1 : 1
    
        if (!reverse) {
            containerView.addSubview(toViewController.view)
            
            // Hide the thumbnail of the incoming detail
            let toThumbnail = (toViewController as? CompanyDetailViewController)!.thumbnail
            toThumbnail!.hidden = true
            
            // Place the detail out of the window, on the right
            toViewController.view.frame = CGRectOffset(finalFrameForVC, bounds.size.width, 0)
            
            let fromThumbnail = fromViewController.view.viewWithTag(toThumbnail!.tag)
            let snapshot = fromThumbnail!.snapshotViewAfterScreenUpdates(false)
            
            let snapshotStartingFrame = containerView.convertRect(fromThumbnail!.frame, fromView: fromThumbnail!.superview)
            let snapshotEndingFrame = toThumbnail!.frame
            
            // add snapshot to interface in place of original thumbnail
            snapshot.frame = snapshotStartingFrame
            containerView.addSubview(snapshot)
            
            fromThumbnail!.hidden = true
            
            // Animate the coming of the detail
            UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
                fromViewController.view.alpha = 0.25
                toViewController.view.frame = finalFrameForVC
                snapshot.frame = snapshotEndingFrame
                }, completion: {
                    finished in
                    transitionContext.completeTransition(true)
                    
                    toThumbnail!.hidden = false
                    snapshot.removeFromSuperview()
            })
        } else {
            containerView.addSubview(toViewController.view)
            
            // Hide the thumbnail of the outgoing detail
            let fromThumbnail = (fromViewController as? CompanyDetailViewController)!.thumbnail
            
            let snapshot = fromThumbnail!.snapshotViewAfterScreenUpdates(false)
            fromThumbnail!.hidden = true
            
            let toThumbnail = toViewController.view.viewWithTag(fromThumbnail!.tag)
            toThumbnail!.hidden = true
            
            let snapshotStartingFrame = containerView.convertRect(fromThumbnail!.frame, fromView: fromThumbnail!.superview)
            let snapshotEndingFrame = containerView.convertRect(toThumbnail!.frame, fromView: toThumbnail!.superview)
            
            snapshot.frame = snapshotStartingFrame
            containerView.superview!.addSubview(snapshot)
            
            toViewController.view.alpha = 0.25
            toViewController.view.frame = finalFrameForVC
            containerView.addSubview(fromViewController.view)
            UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
                toViewController.view.alpha = 1.0
                fromViewController.view.frame = CGRectOffset(finalFrameForVC, bounds.size.width, 0)
                snapshot.frame = snapshotEndingFrame
                }, completion: {
                    finished in
                    transitionContext.completeTransition(true)
                
                    toThumbnail!.hidden = false
                    snapshot.removeFromSuperview()
            })
        }
    }
}
