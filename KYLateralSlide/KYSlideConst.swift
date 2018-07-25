//
//  KYSlideConst.swift
//  KYLateralSlideDemo
//
//  Created by Kuroba.Lei on 2018/7/25.
//  Copyright © 2018年 K.Lei. All rights reserved.
//

import UIKit

var showControlelrTransitioningDelegateKey = "showControlelrTransitioningDelegateKey"
let KYSlideTapNotification = "KYSlideTapNotification"
let KYSlidePanNotification = "KYSlidePanNotification"
let kScreenWidth = UIScreen.main.bounds.width
let kScreenHeight = UIScreen.main.bounds.height

public enum KYSlideAnimationType:Int {
    case zoom //缩放
    case translationPush //横向平移
    case translationMask //盖在最上面横向平移
}

public enum KYSlideDirection:Int {
    case left  // 从左边出来
    case right // 从右边出来
}

public enum KYSlideShowType:Int {
    case show // 显示
    case hidden // 隐藏
}

typealias completeShowGestureBlock = (KYSlideDirection) -> ()
