//
//  TerminalViewController.swift
//  iterm
//
//  Created by radmanxu on 2017/4/8.
//  Copyright © 2017年 radmanxu. All rights reserved.
//

import UIKit
import NMSSH

class TerminalViewController: UIViewController {

    @IBOutlet weak var command: UITextField!
    @IBOutlet weak var output: UITextView!
    var session:NMSSHSession?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.output.text.append("The seession with \((session?.host)!) has been established.\nWe are communicating...\n")
        // Do any additional setup after loading the view.
    }

    @IBAction func BgTap(_ sender: Any) {
        command.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func gogogo(_ sender: UITextField) {
        let fb:String? = try!session?.channel.execute(command.text!)
        self.output.text.append("\n\(fb!)")
    }
    @IBAction func TapOut(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func disconnect(_ sender: UIButton) {
        session?.disconnect()
        self.presentingViewController!.dismiss(animated: true, completion: nil)
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
