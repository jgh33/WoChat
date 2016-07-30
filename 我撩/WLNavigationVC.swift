//
//  WLNavigationVC.swift
//  我撩
//
//  Created by jgh on 16/7/30.
//  Copyright © 2016年 jgh. All rights reserved.
//

import UIKit

class WLNavigationVC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationBar.barTintColor = UIColor.black()
//        let logoLable = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 20))
//        logoLable.text = "我撩"
//        logoLable.textColor = UIColor.white()
//        self.navigationBar.backItem?.titleView = logoLable
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
