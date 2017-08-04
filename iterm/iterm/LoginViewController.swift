//
//  LoginViewController.swift
//  iterm
//
//  Created by radmanxu on 2017/4/8.
//  Copyright © 2017年 radmanxu. All rights reserved.
//

import UIKit
import NMSSH

class LoginViewController: UIViewController {

    @IBOutlet weak var passwd: UITextField!
    @IBOutlet weak var ip: UITextField!
    @IBOutlet weak var username: UITextField!
    var session:NMSSHSession?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func connect(_ sender: UIButton) {
        session = NMSSHSession(host: ip!.text, andUsername: username!.text)
        session?.connect()
        if session?.isConnected == true{
            session?.authenticate(byPassword: passwd!.text)
            if session?.isAuthorized == true{
                self.performSegue(withIdentifier: "Terminal", sender: self)
            }
            else{
                let alert = UIAlertController(title: "无法连接主机", message: "查看端口是否为默认的22", preferredStyle: .alert)
                let action = UIAlertAction(title: "确定", style: .cancel, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
                
            }
        }
        
    }
    
    @IBAction func EndEdit(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func BgTap(_ sender: UIControl) {
        ip.resignFirstResponder()
        username.resignFirstResponder()
        passwd.resignFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "Terminal"){
            let bVc:TerminalViewController = segue.destination as! TerminalViewController
            bVc.session = self.session
        }
    }
 
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
