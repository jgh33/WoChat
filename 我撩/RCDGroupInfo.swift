//
//  RCDGroupInfo.swift
//  我撩
//
//  Created by jgh on 16/8/15.
//  Copyright © 2016年 jgh. All rights reserved.
//

import Foundation

let keyRCDGroupInfoNumber = "number"

class RCDGroupInfo: RCGroup//, NSCoding
{
    //人数
    var number: String?
    
    //最大人数
    var maxNumber: String?
    
    //群简介
    var introduce: String?
    
    //创建者id／／群主id
    var creatorId: String?
    
    //创建日期
    var creatorTime: String?
    
    //是否解散
    var isDismiss: String?
    
    
    //是否加入
    var isJoin = false
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        guard aDecoder.decodeObject(forKey: keyRCDGroupInfoNumber) != nil else {
            return
        }
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(self.number, forKey: keyRCDGroupInfoNumber)
    }
    
    
}
