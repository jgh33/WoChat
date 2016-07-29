//
//  AppDelegate.swift
//  我撩
//
//  Created by jgh on 16/7/29.
//  Copyright © 2016年 jgh. All rights reserved.
//

import UIKit

let DEFAULTS = UserDefaults.standard


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        //初始化融云SDK
        RCIM.shared().initWithAppKey(appkey)
        self.login()
        return true
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
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
    //MARK:- RongCloud
    
    func login() {
        let userToken = DEFAULTS.object(forKey: "userToken") as? String
        let userId = DEFAULTS.object(forKey: "userId") as? String
        let userName = DEFAULTS.object(forKey: "userName") as? String
        let userPassword = DEFAULTS.object(forKey: "userPassword") as? String
        let userNickName = DEFAULTS.object(forKey: "userNickName") as? String
        let userPortraitUri = DEFAULTS.object(forKey: "userPortraitUri") as? String
        
        if (false) {
            let currentUserInfo = RCUserInfo(userId: userId, name: userNickName ?? userName, portrait: userPortraitUri)
            RCIM.shared().currentUserInfo = currentUserInfo
            RCIM.shared().connect(withToken: userToken ?? tokenOfA, success: { (userId) -> Void in
                print("登陆成功。当前登录的用户ID：\(userId)")
                }, error: { (status) -> Void in
                    print("登陆的错误码为:\(status.rawValue)")
                }, tokenIncorrect: {
                    //token过期或者不正确。
                    //如果设置了token有效期并且token过期，请重新请求您的服务器获取新的token
                    //如果没有设置token有效期却提示token错误，请检查您客户端和服务器的appkey是否匹配，还有检查您获取token的流程。
                    print("token错误")
            })
        }else{
            
            let LoginSB = UIStoryboard.init(name: "Login", bundle: Bundle.main)
            self.window?.rootViewController = LoginSB.instantiateInitialViewController()
        }

        
        
    }


}

