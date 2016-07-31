//
//  FirstVC.swift
//  我撩
//
//  Created by jgh on 16/7/29.
//  Copyright © 2016年 jgh. All rights reserved.
//

import UIKit

class FirstVC: RCConversationListViewController, UIPopoverPresentationControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.cellBackgroundColor = UIColor.white()
        self.topCellBackgroundColor = #colorLiteral(red: 0.7602152824, green: 0.7601925135, blue: 0.7602053881, alpha: 1)
        //设置需要显示哪些类型的会话
        self.setDisplayConversationTypes([RCConversationType.ConversationType_PRIVATE.rawValue,
                                          RCConversationType.ConversationType_DISCUSSION.rawValue,
                                          RCConversationType.ConversationType_CHATROOM.rawValue,
                                          RCConversationType.ConversationType_GROUP.rawValue,
                                          RCConversationType.ConversationType_APPSERVICE.rawValue,
                                          RCConversationType.ConversationType_SYSTEM.rawValue])
        //设置需要将哪些类型的会话在会话列表中聚合显示
        self.setCollectionConversationType([RCConversationType.ConversationType_DISCUSSION.rawValue,
                                            RCConversationType.ConversationType_GROUP.rawValue])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makeConsesion(model: RCConversationModel!) {
        let chat = ChatVC()
        chat.conversationType = model.conversationType
        chat.targetId = model.targetId
        chat.title = model.targetId
        self.navigationController?.pushViewController(chat, animated: true)
    }
    
    // MARK: - 点击事件
    /**
     点击会话列表中Cell的回调
     
     @param conversationModelType   当前点击的会话的Model类型
     @param model                   当前点击的会话的Model
     @param indexPath               当前会话在列表数据源中的索引值
     
     @discussion 您需要重写此点击事件，跳转到指定会话的聊天界面。
     如果点击聚合Cell进入具体的子会话列表，在跳转时，需要将isEnteredToCollectionViewController设置为YES。
     */
    override func onSelectedTableRow(_ conversationModelType: RCConversationModelType, conversationModel model: RCConversationModel!, at indexPath: IndexPath!) {
        self.makeConsesion(model: model)
    }
    /**
     点击Cell头像的回调
     
     @param model   会话Cell的数据模型
     */
    override func didTapCellPortrait(_ model: RCConversationModel!) {
        self.makeConsesion(model: model)
    }
    
    /**
     长按Cell头像的回调
     
     @param model   会话Cell的数据模型
     */
    override func didLongPressCellPortrait(_ model: RCConversationModel!) {
        print(model.isTop)
        if model.isTop == true {
            model.isTop = false
        }else{
            model.isTop = true
        }
        print(model.isTop)
        
        RCIMClient.shared().setConversationToTop(model.conversationType, targetId: model.targetId, isTop: model.isTop)
        self.refreshConversationTableViewIfNeeded()
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - ooNavigation
    @IBAction func add(_ sender: UIButton) {
        let storyboard : UIStoryboard = UIStoryboard(name: "NavigationBar", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PopoverViewController")
        vc.modalPresentationStyle = UIModalPresentationStyle.popover
        vc.popoverPresentationController?.delegate = self
        vc.popoverPresentationController?.sourceView = sender as UIView
        vc.popoverPresentationController?.sourceRect = sender.bounds
        vc.preferredContentSize = CGSize(width: 160, height: 200)
        
        self.present(vc, animated: true, completion:nil)
    }

    @IBAction func search(_ sender: UIButton) {
    }

    
    // MARK: - popDelegate
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }


}
