//
//  NetManager.swift
//  我撩
//
//  Created by jgh on 16/8/9.
//  Copyright © 2016年 jgh. All rights reserved.
//

import Foundation

let Server = "http://bc15387026.imwork.net/"



struct NetManager {
    static let share = NetManager()
    private init(){
        
    }
    
    
    
    static func GET(urlStr: String, parameters:[String:NSObject]?, isShowHUB:Bool = true, success:((AnyObject?) -> Void)?, failure:((NSError) -> Void)?){
        let manager = AFHTTPSessionManager()
        manager.requestSerializer.timeoutInterval = 10
        let mainWindow = UIApplication.shared().delegate!.window!
        if isShowHUB {
            MBProgressHUD.showAdded(to: mainWindow, animated: true)
        }
        manager.get(urlStr, parameters: parameters, progress: nil, success: { (task, responseObject) in
            if isShowHUB{
                MBProgressHUD.hideAllHUDs(for: mainWindow, animated: true)
            }
            success?(responseObject)
            })
        { (task, error) in
                if isShowHUB{
                    MBProgressHUD.hideAllHUDs(for: mainWindow, animated: true)
                    mainWindow!.makeToast("失败！服务器出错！")
                }
                failure?(error)
        }
    }
    
    
    static func POST(urlStr: String, parameters:[String:NSObject]?, isShowHUB:Bool = true, success:((AnyObject?) -> Void)?, failure:((NSError) -> Void)?){
        let manager = AFHTTPSessionManager()
        manager.requestSerializer.timeoutInterval = 10
        let mainWindow = UIApplication.shared().delegate!.window!
        if isShowHUB {
            MBProgressHUD.showAdded(to: mainWindow, animated: true)
        }
        manager.post(urlStr, parameters: parameters, progress: nil, success: { (task, responseObject) in
            if isShowHUB{
                MBProgressHUD.hideAllHUDs(for: mainWindow, animated: true)
            }
            success?(responseObject)
        })
        { (task, error) in
            if isShowHUB{
                MBProgressHUD.hideAllHUDs(for: mainWindow, animated: true)
                mainWindow!.makeToast("失败！服务器出错！")
            }
            failure?(error)
        }
    }
    
    
    static func download(urlStr: String, isShowHUB:Bool = true, completionHandler: (() -> Void)?){
        let mainWindow = UIApplication.shared().delegate!.window!
        if isShowHUB {
            MBProgressHUD.showAdded(to: mainWindow, animated: true)
        }
        
        let configuration = URLSessionConfiguration.default
        let manager = AFURLSessionManager(sessionConfiguration: configuration)
        let url = URL(string: urlStr)!
        let request = URLRequest(url: url)
        let downloadTask = manager.downloadTask(with: request, progress: nil, destination: { (targetPath, response) -> URL in
//            print("targetPath:\(targetPath)")
//            print("response:\(response)")
            
//            let documentsDirectoryURL = try! FileManager.default.urlForDirectory(.documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
//            let path = try! documentsDirectoryURL.appendingPathComponent(response.suggestedFilename!)
            let path = NSHomeDirectory() + "/Documents/" + response.suggestedFilename!
            print("BOOL BOOL：" + path)
            print("BOOL BOOL：\(FileManager.default.fileExists(atPath: path))")
            if FileManager.default.fileExists(atPath: String(path)){
                try! FileManager.default.removeItem(at: URL(fileURLWithPath: path))
                print("删除本地的plist文件！")
            }
            return URL(fileURLWithPath: path)
            }) { (response, filePath, error) in
                if isShowHUB{
                    MBProgressHUD.hideAllHUDs(for: mainWindow, animated: true)
                }
                if (error != nil){
                    mainWindow!.makeToast("失败！服务器出错！")
                    print("Downloaded failure!: \(error)")
                }else{
                    mainWindow!.makeToast(" 更新完毕")
                    print("File downloaded to: \(filePath!)")
                }
                completionHandler?()
                
        }
        downloadTask.resume()
    }
    
//    func a()  {
//        let configuration = URLSessionConfiguration.default
//        let manager = AFURLSessionManager(sessionConfiguration: configuration)
//        let url = URL(string: "")!
//        let request = URLRequest(url: url)
//        let task = manager.downloadTask(with: <#T##URLRequest#>, progress: <#T##((Progress) -> Void)?##((Progress) -> Void)?##(Progress) -> Void#>, destination: <#T##((URL, URLResponse) -> URL)?##((URL, URLResponse) -> URL)?##(URL, URLResponse) -> URL#>, completionHandler: <#T##((URLResponse, URL?, NSError?) -> Void)?##((URLResponse, URL?, NSError?) -> Void)?##(URLResponse, URL?, NSError?) -> Void#>)
//
//    }
    


    
    
    
    
}



