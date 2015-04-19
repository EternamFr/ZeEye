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
        return 2.0
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
            toThumbnail!.alpha = 0.0
            
            // Place the detail out of the window, on the right
            toViewController.view.frame = CGRectOffset(finalFrameForVC, bounds.size.width, 0)
            
            let fromThumbnail = fromViewController.view.viewWithTag(toThumbnail!.tag)
            let snapshot = fromThumbnail!.snapshotViewAfterScreenUpdates(false)
            
            let snapshotStartingFrame = containerView.convertRect(fromThumbnail!.frame, fromView: fromThumbnail!.superview)
            let snapshotEndingFrame = toThumbnail!.frame
            
            // add snapshot to interface in place of original thumbnail
            snapshot.frame = snapshotStartingFrame
            containerView.addSubview(snapshot)
            
            fromThumbnail!.alpha = 0.0
            
            // Animate the coming of the detail
            UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
                fromViewController.view.alpha = 0.25
                toViewController.view.frame = finalFrameForVC
                snapshot.frame = snapshotEndingFrame
                }, completion: {
                    finished in
                    transitionContext.completeTransition(true)
                    
                    toThumbnail!.alpha = 1.0
                    fromThumbnail!.alpha = 1.0
                    snapshot.removeFromSuperview()
            })
        } else {
            containerView.addSubview(toViewController.view)
            
            // Hide the thumbnail of the outgoing detail
            let fromThumbnail = (fromViewController as? CompanyDetailViewController)!.thumbnail
            fromThumbnail!.alpha = 0.0
            
            let snapshot = fromThumbnail!.snapshotViewAfterScreenUpdates(false)
            
            let toThumbnail = toViewController.view.viewWithTag(fromThumbnail!.tag)
            toThumbnail!.alpha = 0.0
            
            let snapshotStartingFrame = fromThumbnail!.frame
            var snapshotEndingFrame = toThumbnail!.convertRect(toThumbnail!.frame, toView: fromThumbnail!.superview)
            snapshotEndingFrame = CGRectOffset(snapshotEndingFrame, -bounds.size.width - 8, -8)
            snapshot.frame = snapshotStartingFrame
            fromViewController.view.addSubview(snapshot)
            
            toViewController.view.alpha = 0.25
            toViewController.view.frame = finalFrameForVC
            containerView.addSubview(fromViewController.view)
            UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
                fromViewController.view.frame = CGRectOffset(finalFrameForVC, bounds.size.width, 0)
                toViewController.view.alpha = 1.0
                snapshot.frame = snapshotEndingFrame
                }, completion: {
                    finished in
                    transitionContext.completeTransition(true)
                
                    toThumbnail?.alpha = 1.0
                    fromThumbnail.alpha = 0.0
                    snapshot.removeFromSuperview()
            })
        }
    }
}
