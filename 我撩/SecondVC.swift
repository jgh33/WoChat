//
//  SecondVC.swift
//  我撩
//
//  Created by jgh on 16/8/1.
//  Copyright © 2016年 jgh. All rights reserved.
//

import UIKit

class SecondVC: UIViewController, UIPopoverPresentationControllerDelegate,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableV: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.automaticallyAdjustsScrollViewInsets = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

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
    
    // MARK: - popDelegate
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }

    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 29
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt \(indexPath)")
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "SecondCell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "SecondCell")
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
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
