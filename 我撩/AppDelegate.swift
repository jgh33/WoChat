//
//  AppDelegate.swift
//  我撩
//
//  Created by jgh on 16/7/29.
//  Copyright © 2016年 jgh. All rights reserved.
//

import UIKit


let DEFAULTS = UserDefaults.standard
//let RCDDataSource = RCDRCIMDataSource.share

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, RCIMConnectionStatusDelegate, RCIMReceiveMessageDelegate, RCIMUserInfoDataSource, RCIMGroupInfoDataSource, RCIMGroupMemberDataSource{

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        //状态栏设置白色
        UIApplication.shared().statusBarStyle = .lightContent
        //初始化融云SDK
        RCIM.shared().initWithAppKey(appkey)
        //注册自定义消息
//        RCIM.shared().registerMessageType(Test.class)
        
        //设置会话列表头像和会话界面头像
        
        RCIM.shared().connectionStatusDelegate = self
        
        RCIM.shared().globalConversationPortraitSize = CGSize(width: 46, height: 46)
        //    RCIM.shared().portraitImageViewCornerRadius = 10;
        //开启用户信息和群组信息的持久化
        RCIM.shared().enablePersistentUserInfoCache = true
        //设置用户信息源和群组信息源  可单独列出一个类方便管理
        RCIM.shared().userInfoDataSource = self
        RCIM.shared().groupInfoDataSource = self
        
        //设置群组内用户信息源。如果不使用群名片功能，可以不设置
        //  [RCIM sharedRCIM].groupUserInfoDataSource = RCDDataSource;
        //  [RCIM sharedRCIM].enableMessageAttachUserInfo = YES;
        //设置接收消息代理
        RCIM.shared().receiveMessageDelegate = self
        //    [RCIM sharedRCIM].globalMessagePortraitSize = CGSizeMake(46, 46);
        //开启输入状态监听
        RCIM.shared().enableTypingStatus = true
        //开启发送已读回执（只支持单聊）
        RCIM.shared().enableReadReceipt = true
        //设置显示未注册的消息
        //如：新版本增加了某种自定义消息，但是老版本不能识别，开发者可以在旧版本中预先自定义这种未识别的消息的显示
        RCIM.shared().showUnkownMessage = true
        RCIM.shared().showUnkownMessageNotificaiton = true
        
        //群成员数据源  单独列类
        RCIM.shared().groupMemberDataSource = self
        
        //开启消息@功能（只支持群聊和讨论组, App需要实现群成员数据源groupMemberDataSource）
        RCIM.shared().enableMessageMentioned = true
        
        //开启消息撤回功能
        RCIM.shared().enableMessageRecall = true
        
        
        //    //设置头像为圆形
        //    [RCIM sharedRCIM].globalMessageAvatarStyle = RC_USER_AVATAR_CYCLE;
        //    [RCIM sharedRCIM].globalConversationAvatarStyle = RC_USER_AVATAR_CYCLE;
        
        //通话设置群组成员列表提供者  暂时没加入call框架
//        RCCall.share().groupMemberDataSource = RCDDataSource

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
        let bool = (userToken != nil || userId != nil || userPassword != nil)
        if (bool) {
            let currentUserInfo = RCUserInfo(userId: userId, name: userNickName ?? userName, portrait: userPortraitUri)
            RCIM.shared().currentUserInfo = currentUserInfo
            RCIM.shared().connect(withToken: userToken, success: { (userId) -> Void in
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
    
    //MARK:- RongCloudDelegate
    func getUserInfo(withUserId userId: String!, completion: ((RCUserInfo?) -> Void)!) {
        print("getUserInfoWithUserId ----- \(userId)")
        if userId.characters.count == 0 {
            let userInfo = RCUserInfo(userId: userId, name: "", portrait: "")
            completion(userInfo)
            return
        }else if userId == "kefu114"{
            let userInfo = RCUserInfo(userId: userId, name: "客服", portrait: "")
            completion(userInfo)
            return
        }
        
        //开发者调自己的服务器接口根据userID异步请求数据
        
    }
    
    func getGroupInfo(withGroupId groupId: String!, completion: ((RCGroup?) -> Void)!) {
        
    }
    
    func getAllMembers(ofGroup groupId: String!, result resultBlock: (([String]?) -> Void)!) {
        
    }
    
    //MARK:- RCIMConnectionStatusDelegate
    func onRCIMConnectionStatusChanged(_ status: RCConnectionStatus) {
        if status == RCConnectionStatus.ConnectionStatus_KICKED_OFFLINE_BY_OTHER_CLIENT {
            let alertC = UIAlertController(title: "提示", message: "您的帐号在别的设备上登录，\n您被迫下线！", preferredStyle: .alert)
            let alertA = UIAlertAction(title: "知道了", style: .cancel, handler: nil)
            alertC.addAction(alertA)
            self.window?.rootViewController?.present(alertC, animated: true, completion: nil)
            
            let loginSB = UIStoryboard(name: "Login", bundle: nil)
            let naviC = loginSB.instantiateInitialViewController()
            self.window?.rootViewController = naviC
        } else if (status == RCConnectionStatus.ConnectionStatus_TOKEN_INCORRECT) {
            let mainQ = DispatchQueue.main
            mainQ.async(execute: { 
                let loginSB = UIStoryboard(name: "Login", bundle: nil)
                let naviC = loginSB.instantiateInitialViewController()
                self.window?.rootViewController = naviC
                
                let alertC = UIAlertController(title: nil, message: "Token已过期，请重新登录", preferredStyle: .alert)
                let alertA = UIAlertAction(title: "确定", style: .cancel, handler: nil)
                alertC.addAction(alertA)
                self.window?.rootViewController?.present(alertC, animated: true, completion: nil)
            })
            
        }

    }
    
    func onRCIMReceive(_ message: RCMessage!, left: Int32) {
//        if message.content.isMember(of: RCInformationNotificationMessage.self) {
//            let msg = message.content as! RCInformationNotificationMessage
//            // NSString *str = [NSString stringWithFormat:@"%@",msg.message];
//            if msg.message.range(of:"你已添加了").location != NSNotFound {
//                [RCDDataSource syncFriendList:[RCIM sharedRCIM].currentUserInfo.userId
//                    complete:^(NSMutableArray *friends){
//                    }];
//            }
//        } else if ([message.content
//            isMemberOfClass:[RCContactNotificationMessage class]]) {
//            RCContactNotificationMessage *msg =
//                (RCContactNotificationMessage *)message.content;
//            if ([msg.operation
//                isEqualToString:
//                ContactNotificationMessage_ContactOperationAcceptResponse]) {
//                [RCDDataSource syncFriendList:[RCIM sharedRCIM].currentUserInfo.userId
//                    complete:^(NSMutableArray *friends){
//                    }];
//            }
//        } else if ([message.content
//            isMemberOfClass:[RCGroupNotificationMessage class]]) {
//            RCGroupNotificationMessage *msg =
//                (RCGroupNotificationMessage *)message.content;
//            if ([msg.operation isEqualToString:@"Dismiss"] &&
//                [msg.operatorUserId
//                isEqualToString:[RCIM sharedRCIM].currentUserInfo.userId]) {
//                [[RCIMClient sharedRCIMClient] clearMessages:ConversationType_GROUP
//                    targetId:message.targetId];
//                [[RCIMClient sharedRCIMClient] removeConversation:ConversationType_GROUP
//                    targetId:message.targetId];
//            } else if ([msg.operation isEqualToString:@"Rename"]) {
//                [RCDHTTPTOOL getGroupByID:message.targetId
//                    successCompletion:^(RCDGroupInfo *group) {
//                    [[RCDataBaseManager shareInstance] insertGroupToDB:group];
//                    [[RCIM sharedRCIM] refreshGroupInfoCache:group
//                    withGroupId:group.groupId];
//                    }];
//            }
//        }

    }

    func onRCIMCustomAlertSound(_ message: RCMessage!) -> Bool {
        if message.content.isMember(of: RCGroupNotificationMessage.self) {
            return true
        }
        return true
    }


}

