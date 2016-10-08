//
//  NetManager.swift
//  我撩
//
//  Created by jgh on 16/8/9.
//  Copyright © 2016年 jgh. All rights reserved.
//

import Foundation

let ServerURL = "http://bc15387026.imwork.net/"



class NetManager {
    
    static let share = NetManager()
    private init(){
        
    }
    enum RequestMethodType {
        case requestMethodTypePost
        case requestMethodTypeGet
    }
    
    enum ResponseData {
        case result(String)
        case failure(String)
    }
    
    /**
     *  发送一个请求
     *
     *  @param methodType   请求方法
     *  @param url          请求路径
     *  @param params       请求参数
     *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
     *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
     */
    class func request(wihtMethod methodType: RequestMethodType, urlStr: String, params: [String : AnyObject], success: (([String : AnyObject]) -> Void), failure: ((NSError) -> Void)) {
        let baseURLs = URL(string: ServerURL)!
        
    }
    

    // check phone available
    class func checkPhoneNumberAvailable(region: String, number: String, success: (([String : AnyObject]) -> Void), failure: ((NSError) -> Void)){
        
    }

    
    
    // get verification code
    class func getVerificationCode(region: String, number: String, success: (([String : AnyObject]) -> Void), failure: ((NSError) -> Void)) {
        
    }
    
    
    
    // verfify verification code
    class func verifyVerificationCode(region: String, number: String, success: (([String : AnyObject]) -> Void), failure: ((NSError) -> Void)){
        
    }

    
    
    // reg nickname password verficationToken
    class func register(withNickname nickname: String, password: String, verficationToken: String, success: (([String : AnyObject]) -> Void), failure: ((NSError) -> Void)){
        
    }

    
    
    // login
    class func login(withPhoneNumber number:String, password: String, region: String, success: (([String : AnyObject]) -> Void), failure: ((NSError) -> Void)) {
        
    }

    
    
    // modify nickname
    class func modifyNickname(userId: String, nickname: String, success: (([String : AnyObject]) -> Void), failure: ((NSError) -> Void)){
        
    }

    
    
    // change password
    class func changePassword(oldPwd: String, newPwd: String, success: (([String : AnyObject]) -> Void), failure: ((NSError) -> Void)){
        
    }
    
    
    // reset password
    class func resetPassword(password: String, vToken: String, success: (([String : AnyObject]) -> Void), failure: ((NSError) -> Void)){
        
    }

    
    
    // get user info
    class func getUserInfo(userId: String, success: (([String : AnyObject]) -> Void), failure: ((NSError) -> Void)){
        
    }

    
    
    // set user portraitUri
    class func setUserPortraitUri(portraitUri: String, success: (([String : AnyObject]) -> Void), failure: ((NSError) -> Void)){
        
    }


    
    
    // invite user
    class func inviteUser(uiserId: String,  success: (([String : AnyObject]) -> Void), failure: ((NSError) -> Void)){
        
    }

    
    
    // find user by phone
    class func findUser(byPhoneNumber number: String, success: (([String : AnyObject]) -> Void), failure: ((NSError) -> Void)){
        
    }


    
    
    // get token
    class func getToken(success: (([String : AnyObject]) -> Void), failure: ((NSError) -> Void)){
        
    }

    
    
    // get friends
    class func getFriends(success: (([String : AnyObject]) -> Void), failure: ((NSError) -> Void)){
        
    }

    
    
    
    // get upload image token
    class func getUploadImageToken(success: (([String : AnyObject]) -> Void), failure: ((NSError) -> Void)){
        
    }
    
    
    
    // upload file
    class func uploadFile( fileData:Data, userId: String, success: (([String : AnyObject]) -> Void), failure: ((NSError) -> Void)){
        
    }

    
    
    
    // get square info
    class func getSqusreInfo(success: (([String : AnyObject]) -> Void), failure: ((NSError) -> Void)){
        
    }

    
    
    
    // create group
    class func createGroup(withGroupName name: String, groupMemberList: [String], success: (([String : AnyObject]) -> Void), failure: ((NSError) -> Void)){
        
    }

    
    
    

    
    // get my groups
    class func getMyGroups(success: (([String : AnyObject]) -> Void), failure: ((NSError) -> Void)){
        
    }
    // get group by id
    class func getGroup(byId groupId: String, success: (([String : AnyObject]) -> Void), failure: ((NSError) -> Void)){
        
    }
    
    
   
    
    
    
    // set group portraitUri
    class func setGroupPortraitUri(portraitUri: String, groupid: String, success: (([String : AnyObject]) -> Void), failure: ((NSError) -> Void)){
        
    }

    
    
    
    // get group members by id
    class func getGroupMembers(byId groupId: String, success: (([String : AnyObject]) -> Void), failure: ((NSError) -> Void)){
        
    }

    
    
    
    // join group by groupId
    class func joinGroup(withGroupId groupId: String, success: (([String : AnyObject]) -> Void), failure: ((NSError) -> Void)){
        
    }

    
    
    
    // add users into group
    class func addUsersIntoGroup(groupId: String, usersId: [String], success: (([String : AnyObject]) -> Void), failure: ((NSError) -> Void)){
        
    }

    
    
    
    
    // kick users out of group
    class func kickUsersOutofGroup(groupId: String, usersId: [String], success: (([String : AnyObject]) -> Void), failure: ((NSError) -> Void)){
        
    }

    
    
    
    // quit group with groupId
    class func quitGroup(withGroupId groupId: String, success: (([String : AnyObject]) -> Void), failure: ((NSError) -> Void)){
        
    }
    
    
    
    // dismiss group with groupId
    class func dismissGroup(withGroupId groupId: String, success: (([String : AnyObject]) -> Void), failure: ((NSError) -> Void)){
        
    }
    
    
    
    
    // rename group with groupId
    class func renameGroup(withGroupId groupId: String, success: (([String : AnyObject]) -> Void), failure: ((NSError) -> Void)){
        
    }
    
    //
    class func getFriendListFromSever(success: (([String : AnyObject]) -> Void), failure: ((NSError) -> Void)){
        
    }
    
    class func processInviteFriendRequest(friendUserId: String, currentUserId: String, time now: String, success: (([String : AnyObject]) -> Void), failure: ((NSError) -> Void)){
        
    }
    
    
    class func processInviteFriendRequest(friendUserId: String, success: (([String : AnyObject]) -> Void), failure: ((NSError) -> Void)){
        
    }
    
    
   
    
    
    
    //加入黑名单
    class func addToBlacklist(userId: String,  success: (([String : AnyObject]) -> Void), failure: ((NSError) -> Void)){
        
    }
    
    
    
    
    //从黑名单中移除
    class func removeToBlacklist(userId: String,  success: (([String : AnyObject]) -> Void), failure: ((NSError) -> Void)){
        
    }
    
    
    
    //获取黑名单列表
    class func getBlacklist(success: (([String : AnyObject]) -> Void), failure: ((NSError) -> Void)){
        
    }
    
    
    
    //讨论组接口，暂时保留
    class func updateName(userName: String,  success: (([String : AnyObject]) -> Void), failure: ((NSError) -> Void)){
        
    }




//    static func GET(urlStr: String, parameters:[String:NSObject]?, isShowHUB:Bool = true, success:((AnyObject?) -> Void)?, failure:((NSError) -> Void)?){
//        let manager = AFHTTPSessionManager()
//        manager.requestSerializer.timeoutInterval = 10
//        let mainWindow = UIApplication.shared().delegate!.window!
//        if isShowHUB {
//            MBProgressHUD.showAdded(to: mainWindow, animated: true)
//        }
//        manager.get(urlStr, parameters: parameters, progress: nil, success: { (task, responseObject) in
//            if isShowHUB{
//                MBProgressHUD.hideAllHUDs(for: mainWindow, animated: true)
//            }
//            success?(responseObject)
//            })
//        { (task, error) in
//                if isShowHUB{
//                    MBProgressHUD.hideAllHUDs(for: mainWindow, animated: true)
//                    mainWindow!.makeToast("失败！服务器出错！")
//                }
//                failure?(error)
//        }
//    }
//
//
//    static func POST(urlStr: String, parameters:[String:NSObject]?, isShowHUB:Bool = true, success:((AnyObject?) -> Void)?, failure:((NSError) -> Void)?){
//        let manager = AFHTTPSessionManager()
//        manager.requestSerializer.timeoutInterval = 10
//        let mainWindow = UIApplication.shared().delegate!.window!
//        if isShowHUB {
//            MBProgressHUD.showAdded(to: mainWindow, animated: true)
//        }
//        manager.post(urlStr, parameters: parameters, progress: nil, success: { (task, responseObject) in
//            if isShowHUB{
//                MBProgressHUD.hideAllHUDs(for: mainWindow, animated: true)
//            }
//            success?(responseObject)
//        })
//        { (task, error) in
//            if isShowHUB{
//                MBProgressHUD.hideAllHUDs(for: mainWindow, animated: true)
//                mainWindow!.makeToast("失败！服务器出错！")
//            }
//            failure?(error)
//        }
//    }
//
//
//    static func download(urlStr: String, isShowHUB:Bool = true, completionHandler: (() -> Void)?){
//        let mainWindow = UIApplication.shared().delegate!.window!
//        if isShowHUB {
//            MBProgressHUD.showAdded(to: mainWindow, animated: true)
//        }
//
//        let configuration = URLSessionConfiguration.default
//        let manager = AFURLSessionManager(sessionConfiguration: configuration)
//        let url = URL(string: urlStr)!
//        let request = URLRequest(url: url)
//        let downloadTask = manager.downloadTask(with: request, progress: nil, destination: { (targetPath, response) -> URL in
////            print("targetPath:\(targetPath)")
////            print("response:\(response)")
//
////            let documentsDirectoryURL = try! FileManager.default.urlForDirectory(.documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
////            let path = try! documentsDirectoryURL.appendingPathComponent(response.suggestedFilename!)
//            let path = NSHomeDirectory() + "/Documents/" + response.suggestedFilename!
//            print("BOOL BOOL：" + path)
//            print("BOOL BOOL：\(FileManager.default.fileExists(atPath: path))")
//            if FileManager.default.fileExists(atPath: String(path)){
//                try! FileManager.default.removeItem(at: URL(fileURLWithPath: path))
//                print("删除本地的plist文件！")
//            }
//            return URL(fileURLWithPath: path)
//            }) { (response, filePath, error) in
//                if isShowHUB{
//                    MBProgressHUD.hideAllHUDs(for: mainWindow, animated: true)
//                }
//                if (error != nil){
//                    mainWindow!.makeToast("失败！服务器出错！")
//                    print("Downloaded failure!: \(error)")
//                }else{
//                    mainWindow!.makeToast(" 更新完毕")
//                    print("File downloaded to: \(filePath!)")
//                }
//                completionHandler?()
//                
//        }
//        downloadTask.resume()
//    }
//    
////    func a()  {
////        let configuration = URLSessionConfiguration.default
////        let manager = AFURLSessionManager(sessionConfiguration: configuration)
////        let url = URL(string: "")!
////        let request = URLRequest(url: url)
////        let task = manager.downloadTask(with: <#T##URLRequest#>, progress: <#T##((Progress) -> Void)?##((Progress) -> Void)?##(Progress) -> Void#>, destination: <#T##((URL, URLResponse) -> URL)?##((URL, URLResponse) -> URL)?##(URL, URLResponse) -> URL#>, completionHandler: <#T##((URLResponse, URL?, NSError?) -> Void)?##((URLResponse, URL?, NSError?) -> Void)?##(URLResponse, URL?, NSError?) -> Void#>)
////
////    }
//    


    
    
    
    
}



