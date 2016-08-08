//
//  LoginVC.swift
//  我撩
//
//  Created by jgh on 16/7/29.
//  Copyright © 2016年 jgh. All rights reserved.
//

import UIKit

class LoginVC: UIViewController, UITextFieldDelegate {
    var loginFailureTimes:Int = 0
    var loginUserName = ""
    var loginUserId = ""
    var loginToken = ""
    var loginPassword = ""
    
    @IBOutlet weak var userIdTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginBTN: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func idTF_end(_ sender: UITextField) {
        self.passwordTF.becomeFirstResponder()
    }
    
    @IBAction func passTF_end(_ sender: UITextField) {
        sender.resignFirstResponder()
        self.login()
    }
    
    @IBAction func login() {
        print("login login")
    }
    
    @IBAction func foundPassword() {
    }
    
    @IBAction func sign() {
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
