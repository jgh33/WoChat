//
//  WLNaviC.swift
//  我撩
//
//  Created by jgh on 16/8/9.
//  Copyright © 2016年 jgh. All rights reserved.
//

import UIKit

class WLNaviC: UINavigationController, UIPopoverPresentationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 40, height: 30))
        label.text = "我撩"        
        label.textColor = #colorLiteral(red: 0.1607843137, green: 0.6196078431, blue: 0.5490196078, alpha: 1)
        self.viewControllers[0].navigationItem.leftBarButtonItem = UIBarButtonItem(customView: label)
        
        let image1 = UIImage(named: "icon_recommend_dish_add")!
        let addBTN = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 30))
        addBTN.setImage(image1, for: .normal)

        addBTN.addTarget(self, action: #selector(addPopView), for: .touchUpInside)
        let addItem = UIBarButtonItem(customView: addBTN)
        
        let image2 = UIImage(named: "icon_navigationItem_search")!
        let searchBTN = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 30))
        searchBTN.setImage(image2, for: .normal)
        searchBTN.addTarget(self, action: #selector(search), for: .touchUpInside)
        let searchItem = UIBarButtonItem(customView: searchBTN)
        self.viewControllers[0].navigationItem.rightBarButtonItems = [addItem, searchItem]
        
        self.navigationBar.barStyle = .black

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func search()  {
        print("search")
    }
    
    func addPopView(sender: UIButton) {
        let storyboard = UIStoryboard(name: "NavigationBar", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PopoverViewController")
        vc.modalPresentationStyle = UIModalPresentationStyle.popover
        vc.popoverPresentationController?.delegate = self
        vc.popoverPresentationController?.sourceView = sender as UIView
        vc.popoverPresentationController?.sourceRect = CGRect(origin: sender.bounds.origin, size: CGSize(width: sender.bounds.width, height: sender.bounds.height + 10))
        vc.popoverPresentationController?.backgroundColor = #colorLiteral(red: 0.2784313725, green: 0.2784313725, blue: 0.2784313725, alpha: 1)
        vc.preferredContentSize = CGSize(width: 150, height: 171)
        
        self.present(vc, animated: true, completion:nil)
    }
    
    // MARK: - popDelegate
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
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
