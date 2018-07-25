//
//  KYSlideMaskView.swift
//  KYLateralSlideDemo
//
//  Created by Kuroba.Lei on 2018/7/25.
//  Copyright © 2018年 K.Lei. All rights reserved.
//

import UIKit

final class KYSlideMaskView: UIVisualEffectView {
    init() {
        super.init(effect: UIBlurEffect.init(style: .dark))
        //初始准备代码
        let tap: UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(tapAction(_ :)))
        self.addGestureRecognizer(tap)
        
        let pan: UIPanGestureRecognizer = UIPanGestureRecognizer.init(target: self, action: #selector(panAction(_ :)))
        self.addGestureRecognizer(pan)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc private func tapAction(_ sender:UITapGestureRecognizer) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue:KYSlideTapNotification), object: nil)
    }
    
    @objc private func panAction(_ sender:UITapGestureRecognizer) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue:KYSlidePanNotification), object: sender)
    }
    
    func destroy() {
        self.removeFromSuperview()
    }
    
    deinit {
        //        print( NSStringFromClass(self.classForCoder) + " 销毁了---->2")
    }
}
