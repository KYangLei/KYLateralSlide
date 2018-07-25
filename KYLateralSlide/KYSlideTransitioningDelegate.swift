//
//  KYSlideTransitioningDelegate.swift
//  KYLateralSlideDemo
//
//  Created by Kuroba.Lei on 2018/7/25.
//  Copyright © 2018年 K.Lei. All rights reserved.
//

import UIKit

class KYSlideTransitioningDelegate: NSObject,UIViewControllerTransitioningDelegate {
    var presentationInteractiveTransition: KYSlidePercentInteractiveTransition?
    var dismissalInteractiveTransition: KYSlidePercentInteractiveTransition!
    var config: KYLateralSlideConfig!
    
    init(config:KYLateralSlideConfig?) {
        self.config = config
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return KYSlideAnimatedTransitioning(showType: .show, config: config)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return KYSlideAnimatedTransitioning(showType: .hidden, config: config)
    }
    
    // present交互的百分比
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if presentationInteractiveTransition == nil {
            return nil
        }else {
            return (presentationInteractiveTransition?.isInteractive)! ? presentationInteractiveTransition : nil
        }
    }
    
    // dismiss交互的百分比
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return dismissalInteractiveTransition.isInteractive ? dismissalInteractiveTransition : nil
    }
    deinit {
        //        print( NSStringFromClass(self.classForCoder) + " 销毁了---->3")
    }
}
