//
//  RCDataManager.swift
//  我撩
//
//  Created by jgh on 16/8/11.
//  Copyright © 2016年 jgh. All rights reserved.
//

import Foundation

struct RCDataManager {
    var allFriends = []()
    var allGroups = []()
    
    static let share = RCDataManager()
    private init(){
        
    }
    
    func createGroup(withGroupName groupName:String, groupMemberList:[], completeion:((String) -> Void))  {
//        NetManager.createGroup(wi)
    }
    
    //设置群组头像
    func setGroup(portraitUri: String, groupId: String, completeion: (() -> Void) )  {
        <#function body#>
    }
    
    //根据id获取单个群组
    func getGroup(byGroupId groupId:String, success:((RCDGroupInfo) -> Void)) {
        <#function body#>
    }
    
    //根据userId获取单个用户信息
    func getUserInfo(byUserId userId: String, competeion: (() -> Void) ) {
        <#function body#>
    }
    
    //设置用户头像上传到demo server
    func setUser(portraitUri: String, completeion: ((Bool) -> Void) ) {
        <#function body#>
    }
    
    //获取当前用户所在的所有群组信息
    func getMyGroups(withBlock: (([]) -> Void))  {
        <#function body#>
    }
    
    //根据groupId获取群组成员信息
    func getGroupMember(withGroupId groupId: String, block: (([]) -> Void)) {
        <#function body#>
    }
    
    //加入群组(暂时没有用到这个接口)
    func jionGroup(withGroupId groupId: String, completeion: ((Bool) -> Void))  {
        <#function body#>
    }
    
    //添加群组成员
    func addUsers(intoGroup groupId: String, userId: String, completeion: ((Bool) -> Void))  {
        <#function body#>
    }
    
    //将用户踢出群组
    func kickUsers(outOfGroup groupId: String, userIds: [String], completeion: ((Bool) -> Void))  {
        <#function body#>
    }
    
    //退出群组
    func quitGroup(withGroupId groupId: String, completeion: ((Bool) -> Void)) {
        <#function body#>
    }
    
    //解散群组
    func dismissGroup(withGroupId groupId: String, completeion: ((Bool) -> Void)) {
        <#function body#>
    }
    
    //修改群组名称
    func reNameGroup(withGroupId groupId: String, newName: String, completeion: (() -> Void)) {
        <#function body#>
    }
    
    
    //获取广场信息
    func getSquareInfo(_ completeion: (([]) -> Void) ) {
        <#function body#>
    }
    
    
    //获取好友列表
    func getFriends(_ completeion: (([]) -> Void) ) {
        <#function body#>
    }
    
    
    //通过手机号搜索好友
    func searchUser(byPhone phone: String, completeion: (() -> Void) )  {
        <#function body#>
    }
    
    
    //请求加好友
    func requestFriend(userId: String, completeion: (() -> Void) ) {
        <#function body#>
    }
    
    
    //处理请求加好友
    func processInviteFriendRequest(userId: String, completeion: (() -> Void) ) {
        <#function body#>
    }
    
    
    //加入黑名单
    func addToBlacklist(userId: String, completeion: ((Bool) -> Void) ) {
        <#function body#>
    }
    
    
    //从黑名单中移除
    func removeToBlacklist(userId: String, completeion: ((Bool) -> Void) ) {
        <#function body#>
    }
    
    
    //获取黑名单列表
    func getBlacklist(completeion: (([]) -> Void) ) {
        <#function body#>
    }
    
    
    //更新自己的用户名
    func updateName(userName: String, success: ((AnyObject) -> Void), failure: ((NSError) -> Void) ) {
        <#function body#>
    }
    
    
    //从demo server 获取用户的信息，更新本地数据库
    func updateUserInfo(userId: String, success: ((RCUserInfo) -> Void), failure: ((NSError) -> Void) )  {
        <#function body#>
    }
    
    
    //上传图片到七牛的服务器
    func uploadImageToQiNiu(userId: String, imageDate:NSData, success: ((RCUserInfo) -> Void), failure: ((NSError) -> Void) )  {
        <#function body#>
    }
    
    
    
    
    
    
    
    
}


