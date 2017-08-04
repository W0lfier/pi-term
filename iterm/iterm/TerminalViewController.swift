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

    var session:NMSSHSession?
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func Swipe(_ sender: UISwipeGestureRecognizer) {
        session?.disconnect()
        self.presentingViewController!.dismiss(animated:true, completion: nil)
    }
    
    @IBAction func LogOut(_ sender: UIButton) {
        session?.disconnect()
        self.presentingViewController!.dismiss(animated:true, completion: nil)
    }
    
    @IBAction func TakePic(_ sender: UIButton) {
        let result:String?
        let fb:String? = try!session?.channel.execute("takepic")
        if(fb == "")
        {
            result = "成功拍照，并已将照片上传到百度云盘"
        }
        else
        {
            result = fb
        }
        let alertVc = UIAlertController(title: "运行结果", message: result, preferredStyle: .alert)
        let alertV = UIAlertAction(title: "确定", style: .default, handler: nil)
        alertVc.addAction(alertV)
        self.present(alertVc, animated: true, completion: nil)
    }
    
    @IBAction func LightOn(_ sender: UIButton) {
        let result:String?
        let fb:String? = try!session?.channel.execute("on")
        if(fb != nil)
        {
            result = "灯已经成功打开"
        }
        else
        {
            result = fb
        }
        let alertVc = UIAlertController(title: "运行结果", message: result, preferredStyle: .alert)
        let alertV = UIAlertAction(title: "确定", style: .default, handler: nil)
        alertVc.addAction(alertV)
        self.present(alertVc, animated: true, completion: nil)
    }
    
    @IBAction func LightOff(_ sender: UIButton) {
        let result:String?
        let fb:String? = try!session?.channel.execute("off")
        if(fb != nil)
        {
            result = "灯已经成功关闭"
        }
        else
        {
            result = fb
        }
        let alertVc = UIAlertController(title: "运行结果", message: result, preferredStyle: .alert)
        let alertV = UIAlertAction(title: "确定", style: .default, handler: nil)
        alertVc.addAction(alertV)
        self.present(alertVc, animated: true, completion: nil)
    }
    
    @IBAction func CameraOn(_ sender: UIButton) {
        let result:String?
        let fb:String? = try!session?.channel.execute("cameraon")
        if(fb != nil)
        {
            result = "运动检测系统正在运行"
        }
        else
        {
            result = fb
        }
        let alertVc = UIAlertController(title: "运行结果", message: result, preferredStyle: .alert)
        let alertV = UIAlertAction(title: "确定", style: .default, handler: nil)
        alertVc.addAction(alertV)
        self.present(alertVc, animated: true, completion: nil)
    }
    
    @IBAction func CameraOff(_ sender: UIButton) {
        let result:String?
        let fb:String? = try!session?.channel.execute("cameraoff")
        if(fb != nil)
        {
            result = "运动检测系统已关闭"
        }
        else
        {
            result = fb
        }
        let alertVc = UIAlertController(title: "运行结果", message: result, preferredStyle: .alert)
        let alertV = UIAlertAction(title: "确定", style: .default, handler: nil)
        alertVc.addAction(alertV)
        self.present(alertVc, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
