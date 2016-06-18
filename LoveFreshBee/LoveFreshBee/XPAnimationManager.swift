//
//  XPAnimationManager.swift
//  LoveFreshBee
//
//  Created by 徐攀 on 16/6/18.
//  Copyright © 2016年 cn.xupan.www. All rights reserved.
//

import UIKit

enum XPAnimationStyle {
    case bounces
}

class XPAnimationManager: NSObject {
    // MARK: - 单例接口
    static let manager = XPAnimationManager()
    
    func addAnimation(animation: XPAnimationStyle, toView: UIView, duration: NSTimeInterval) -> Void {
        
        switch animation {
        case .bounces:
            toView.layer.addAnimation(bounceAnimation(duration), forKey: "")
        default:
            break
        }
    }
    
    // MARK: - 弹性动画
    func bounceAnimation(duration: NSTimeInterval) -> CAAnimation {
        
        let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        bounceAnimation.values = [1.0 ,1.3, 0.9, 1.15, 0.95, 1.02, 1.0]
        bounceAnimation.duration = duration
        bounceAnimation.calculationMode = kCAAnimationCubic
        
        return bounceAnimation
    }
}
