//
//  KYSlidePercentInteractiveTransition.swift
//  KYLateralSlideDemo
//
//  Created by Kuroba.Lei on 2018/7/25.
//  Copyright © 2018年 K.Lei. All rights reserved.
//

import UIKit

class KYSlidePercentInteractiveTransition: UIPercentDrivenInteractiveTransition {
    var completeShowGesture:completeShowGestureBlock?
    var isInteractive:Bool! = false
    weak var _targetVC:UIViewController!
    var _config:KYLateralSlideConfig!
    var _showType:KYSlideShowType!
    private var _direction:KYSlideDirection?
    private var _percent:CGFloat  = 0.0 //必须用全局的
    
    init(showType:KYSlideShowType,viewController:UIViewController?,config:KYLateralSlideConfig?) {
        super.init()
        _showType = showType
        _targetVC = viewController
        _config = config
        NotificationCenter.default.addObserver(self, selector: #selector(ky_tapAction), name: NSNotification.Name(rawValue:KYSlideTapNotification), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ky_panAction(_ :)), name: NSNotification.Name(rawValue:KYSlidePanNotification), object: nil)
    }
    
    @objc func ky_tapAction() {
        if _showType == .show {return}
        _targetVC?.dismiss(animated: true, completion: nil)
        self.finish()
    }
    
    @objc func ky_panAction(_ sender:Notification) {
        let pan:UIPanGestureRecognizer = sender.object as! UIPanGestureRecognizer
        if _showType == .hidden {
            handlePan(pan: pan)
        }
    }
    
    func addPanGesture(fromViewController:UIViewController) {
        let pan:UIPanGestureRecognizer = UIPanGestureRecognizer.init(target: self, action: #selector(handlePan(pan:)))
        fromViewController.view.addGestureRecognizer(pan)
    }
    
    //手势blcok 回调
    func handlePresentPan(pan:UIPanGestureRecognizer) {
        var x:CGFloat = pan.translation(in: pan.view).x // -左划 +右滑
        let width:CGFloat = (pan.view!.bounds.width)
        var percent:CGFloat = 0.0
        
        switch pan.state {
        case .began:
            if x<0 {
                _direction = .right;
            }else if x>=0 {
                _direction = .left;
            }
            isInteractive = true
            if (completeShowGesture != nil) {
                completeShowGesture!(_direction!)
            }
            break
        case .changed:
            if _direction == KYSlideDirection.right {
                x = x>0.0 ? 0.0:x;
            }else {
                x = x<0.0 ? 0.0:x;
            }
            percent = CGFloat(fabsf(Float(x/width)))
            percent = percent<=0.0 ? 0.0:percent
            percent = percent>=1.0 ? 1.0:percent
            _percent = percent
            self.update(percent)
            break
        case .ended:
            isInteractive = false
            if _percent < 0.5 {
                self.cancel()
            }else {
                self.finish()
            }
            break
        case .cancelled:
            isInteractive = false
            self.cancel()
            break
        default:
            break
        }
    }
    
    @objc func handlePan(pan: UIPanGestureRecognizer)  {
        var x:CGFloat = pan.translation(in: pan.view).x // -左划 +右滑
        if _config == nil &&  _showType == .show{
            self.handlePresentPan(pan: pan)
            return
        }
        var width:CGFloat = (pan.view!.bounds.width) // 手势驱动时 相对移动的宽度
        if _config.animationType == .zoom {
            width = kScreenWidth*(1.0 - _config.zoomOffsetRelative)
        }
        var percent:CGFloat = 0.0
        switch pan.state {
        case .began :
            isInteractive = true;
            _targetVC.dismiss(animated: true, completion: nil)
            break;
        case .changed:
            if _config.direction == KYSlideDirection.left && _showType == .hidden {
                x = x>0.0 ? 0.0:x;
            }else {
                x = x<0.0 ? 0.0:x;
            }
            percent = CGFloat(fabsf(Float(x/width)))
            percent = percent<=0.0 ? 0.0:percent
            percent = percent>=1.0 ? 1.0:percent
            _percent = percent
            self.update(percent)
            break
        case .ended:
            isInteractive = false
            if _percent < 0.5 {
                self.cancel()
            }else {
                self.finish()
            }
            break
        case .cancelled:
            isInteractive = false
            self.cancel()
            break
        default:
            break
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
        //        print( NSStringFromClass(self.classForCoder) + " 销毁了---->5")
    }
    
}
