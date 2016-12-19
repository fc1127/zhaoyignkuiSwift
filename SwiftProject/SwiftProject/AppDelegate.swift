//
//  AppDelegate.swift
//  SwiftProject
//
//  Created by 赵英奎 on 10/5/6.
//  Copyright © 2010年 赵英奎. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    //声明根视图控制器属性
    var root: UITabBarController?
    //声明菜谱视图控制器属性
    var cook: CookViewController?
    //声明发现视图控制器属性
    var find: FindViewController?
    //声明广场视图控制器属性
    var square: SquareViewController?
    //声明我的视图控制器属性
    var mine: MineViewController?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //实例化UIWindow,将根视图控制器赋值到UIWindow
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        self.window?.rootViewController = createRootViewController()
        //设置窗体背景色
        self.window?.backgroundColor = UIColor.white
        //显示窗体
        self.window?.makeKeyAndVisible()
        
        
        
        
        return true
    }
    
    //创建根视图控制器对象
    func createRootViewController() -> UITabBarController {
        //创建标签控制器对象
        self.root = UITabBarController()
        //创建菜谱对象
        self.cook = CookViewController()
        //设置标签按钮文本
        self.cook?.tabBarItem.title = "菜谱"
        
        //创建发现对象
        self.find = FindViewController()
        //设置标签按钮文本
        self.find?.tabBarItem.title = "发现"
        
        //创建广场对象
        self.square = SquareViewController()
        self.square?.tabBarItem.title = "广场"
        
        //创建我的对象
        self.mine = MineViewController()
        self.mine?.tabBarItem.title = "我的"
        
        self.root?.viewControllers = [self.cook!, self.find!, self.square!, self.mine!]
        
        
        return self.root!
        
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

