//
//  PopCustomTransition.swift
//  AnimatedTransitionPushPop
//
//  Created by Steven Gibson on 10/10/15.
//  Copyright © 2015 AG. All rights reserved.
//

import UIKit

public class PopCustomTransition: NSObject,UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning {
    
    
    var isPresenting = true
    var duration = 0.8
    var offScreenRight = true
    
    public func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView()!
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        
        
        let π : CGFloat = CGFloat(M_PI)
        
        
        
        
        
        
        if isPresenting {
            
           
            
            let offScreenRight = CGAffineTransformMakeRotation(π/2)
            toView.transform = offScreenRight
            toView.layer.anchorPoint = CGPoint(x:0, y:0)
            fromView.layer.anchorPoint = CGPoint(x:0, y:0)
            
            toView.layer.position = CGPoint(x:0, y:0)
            fromView.layer.position = CGPoint(x:0, y:0)
            container.addSubview(fromView)
            container.addSubview(toView)
            
            let duration = self.transitionDuration(transitionContext)
            
            
            
            
            UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: UIViewAnimationOptions.CurveEaseOut , animations: {
                
                
                toView.transform = CGAffineTransformIdentity
            
                }, completion: { finished in
                    transitionContext.completeTransition(true)  
            })
            
            
        }
        else {
            
          
       
            
            let offScreenRight = CGAffineTransformMakeRotation(π/2)
            
            
            container.addSubview(toView)
            container.addSubview(fromView)
            
            toView.layer.anchorPoint = CGPoint(x:0, y:0)
            fromView.layer.anchorPoint = CGPoint(x:0, y:0)
            
            toView.layer.position = CGPoint(x:0, y:0)
            fromView.layer.position = CGPoint(x:0, y:0)
           
            
          
            
            let duration = self.transitionDuration(transitionContext)
            
            UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: UIViewAnimationOptions.CurveEaseOut , animations: {
                
               fromView.transform = offScreenRight

                }, completion: { finished in
                    transitionContext.completeTransition(true)
            })
            
            
        }
        
    }
    
    public func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return duration
    }
    
    public func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = true
        return self
    }
    
    public func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = false
        return self
    }
 

}
