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
        
        tabBar.tintColor = UIColor.darkGrayColor()
        
       addChildViewControllers()
        
    }

    private func addChildViewControllers() {
        addChildViewController("Home", title: "首页", image: "v2_home")
        addChildViewController("FlashMarket", title: "闪电超市", image: "v2_order")
        addChildViewController("ShoppingCard", title: "购物车", image: "shopCart")
        addChildViewController("Mine", title: "我的", image: "v2_my")
    }
    
    private func addChildViewController(storyboardName: String, title: String, image: String) {
        
        let storyBoard = UIStoryboard(name: storyboardName, bundle: NSBundle.mainBundle())
        let viewController = storyBoard.instantiateInitialViewController()!
        
        viewController.childViewControllers[0].title = title
        viewController.tabBarItem.image = UIImage(named: image)
        viewController.tabBarItem.selectedImage = UIImage(named: image + "_r")?.imageWithRenderingMode(.AlwaysOriginal)
        
        addChildViewController(viewController)
    }


}
