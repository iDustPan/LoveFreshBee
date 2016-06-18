//
//  XPMainTabController.swift
//  LoveFreshBee
//
//  Created by 徐攀 on 16/6/18.
//  Copyright © 2016年 cn.xupan.www. All rights reserved.
//

import UIKit

class XPMainTabController: UITabBarController {
    // 用来存放tabBar上的按钮
    var tabBarButtonArr = [AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = UIColor.darkGrayColor()
        
        addChildViewControllers()
    }

    private func addChildViewControllers() {
        addChildViewController("Home", title: "首页", image: "v2_home", tag: 0)
        addChildViewController("FlashMarket", title: "闪电超市", image: "v2_order", tag: 1)
        addChildViewController("ShoppingCard", title: "购物车", image: "shopCart", tag: 2)
        addChildViewController("Mine", title: "我的", image: "v2_my", tag: 3)
    }
    
    private func addChildViewController(storyboardName: String, title: String, image: String, tag: Int) {
        
        let storyBoard = UIStoryboard(name: storyboardName, bundle: NSBundle.mainBundle())
        let viewController = storyBoard.instantiateInitialViewController()!
        
        viewController.childViewControllers[0].title = title
        viewController.tabBarItem.image = UIImage(named: image)
        viewController.tabBarItem.selectedImage = UIImage(named: image + "_r")?.imageWithRenderingMode(.AlwaysOriginal)
        viewController.tabBarItem.tag = tag
        addChildViewController(viewController)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for tabBarSubView in tabBar.subviews {
            
            if tabBarSubView.isKindOfClass(NSClassFromString("UITabBarButton")!) {
                tabBarButtonArr.append(tabBarSubView)
            }
        }
    }
    
    // MARK: - UITabBarDelegate
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        
        let btn = tabBarButtonArr[item.tag] as! UIView
        
        let animationView = btn.subviews.first!
        
        XPAnimationManager.manager.addAnimation(.bounces, toView: animationView, duration: 0.5)
    }
}

