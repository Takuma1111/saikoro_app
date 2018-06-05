//
//  ViewController.swift
//  chinchiro_app
//
//  Created by 村上拓麻 on 2018/05/23.
//  Copyright © 2018年 村上拓麻. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        if appdelegate.data == nil{
            print("appdelegateにデータを入れた")
            appdelegate.data = "200"
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func single(_ sender: UIButton) {     //一人モードのビューに移動
        let vc = UIStoryboard(name: "Point_Storyboard", bundle: nil).instantiateInitialViewController()!
        self.present(vc, animated: true)
    }
  
    @IBAction func other(_ sender: UIButton) {                  //対戦のビューに移動
        let vc = UIStoryboard(name: "BT_Storyboard", bundle: nil).instantiateInitialViewController()!
        self.present(vc, animated: true)
    }
    @IBAction func point_flappy(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Flappy_Main", bundle: nil).instantiateInitialViewController()!
        self.present(vc, animated: true)
    }
    @IBAction func information_Button(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Info_Storyboard", bundle: nil).instantiateInitialViewController()!
        self.present(vc, animated: true)
    }
    
    
    
    @IBAction func minigame_info(_ sender: UIButton) {
        let alert: UIAlertController = UIAlertController(title: "ミニゲームの説明🎮", message: "タップしてオブジェクトに当たらないように避けて点を稼ごう!!💰稼いだポイントは一人モードの時の持ち点として保持されます", preferredStyle: UIAlertControllerStyle.alert)
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
            (action: UIAlertAction!) -> Void in
            print("OK")
        })
        alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
        
    }
    
}

