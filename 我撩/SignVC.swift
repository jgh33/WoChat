//
//  SignVC.swift
//  我撩
//
//  Created by jgh on 16/7/29.
//  Copyright © 2016年 jgh. All rights reserved.
//

import UIKit

class SignVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nicknameTF: UITextField!
    @IBOutlet weak var idTF: UITextField!
    @IBOutlet weak var CAPTCHATF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @IBAction func nickTF_end(_ sender: UITextField) {
        self.idTF.becomeFirstResponder()
    }
    @IBAction func CAPTCHATF_end(_ sender: UITextField) {
        self.passwordTF.becomeFirstResponder()
    }
    @IBAction func passwordTF_end(_ sender: UITextField) {
        sender.resignFirstResponder()
        self.sign()
    }
    
    @IBAction func sign() {
        print("sign sign")
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
