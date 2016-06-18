//
//  XPMainTabController.swift
//  LoveFreshBee
//
//  Created by 徐攀 on 16/6/18.
//  Copyright © 2016年 cn.xupan.www. All rights reserved.
//

import UIKit

class XPMainTabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       addChildViewControllers()
        
    }

    private func addChildViewControllers() {
        addChildViewController("Home", title: "首页")
        addChildViewController("FlashMarket", title: "闪电超市")
        addChildViewController("ShoppingCard", title: "购物车")
        addChildViewController("Mine", title: "我的")
    }
    
    private func addChildViewController(storyboardName: String, title: String) {
        let storyBoard = UIStoryboard(name: storyboardName, bundle: NSBundle.mainBundle())
        let viewController = storyBoard.instantiateInitialViewController()!
        
        viewController.childViewControllers[0].title = title
        
        addChildViewController(viewController)
    }


}
