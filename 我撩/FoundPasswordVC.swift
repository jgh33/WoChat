//
//  FoundPasswordVC.swift
//  我撩
//
//  Created by jgh on 16/7/29.
//  Copyright © 2016年 jgh. All rights reserved.
//

import UIKit

class FoundPasswordVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var idTF: UITextField!
    @IBOutlet weak var CAPTCHATF: UITextField!
    @IBOutlet weak var newPasswordTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func CAPTCHATF_end(_ sender: UITextField) {
        self.newPasswordTF.becomeFirstResponder()
    }
    
    @IBAction func newPasswordTF_end(_ sender: UITextField) {
        self.resignFirstResponder()
        self.passwordDone()
    }

    @IBAction func passwordDone() {
        print("done done")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
