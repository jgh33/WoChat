//
//  ChatVC.swift
//  我撩
//
//  Created by jgh on 16/7/29.
//  Copyright © 2016年 jgh. All rights reserved.
//

import UIKit

class ChatVC: RCConversationViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.isHidden = true
    }

}
