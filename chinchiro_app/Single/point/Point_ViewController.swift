//
//  Point_ViewController.swift
//  chinchiro_app
//
//  Created by 村上拓麻 on 2018/05/23.
//  Copyright © 2018年 村上拓麻. All rights reserved.
//

import UIKit

class Point_ViewController: UIViewController {
    @IBOutlet weak var motitenLabel: UILabel!
    @IBOutlet weak var ten_nyuryoku: UITextField!
    @IBOutlet weak var re_hyouziLabel: UILabel!
    
    var text1: String?
    var i : Int?
    
    var app_uke : Int = 0
    var nyu_ten : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        toziru() //閉じるボタン
        
        print(i, "受け取ったviewdidloadの値")
        self.ten_nyuryoku.keyboardType = UIKeyboardType.numberPad  //入力次のキーボードの種類を設定
        
        let appdelegate = UIApplication.shared.delegate as! AppDelegate     //持ち点を表示
        guard appdelegate.data == nil else {
            motitenLabel.text = appdelegate.data
            app_uke = Int(appdelegate.data!)!
            return
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func decideButton(_ sender: UIButton) {       //決定ボタン

        if (ten_nyuryoku.text == "") || (ten_nyuryoku.text == nil){
            let alert: UIAlertController = UIAlertController(title: "⚠️注意⚠️", message: "賭け点が設定されていません", preferredStyle:  UIAlertControllerStyle.alert)
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
                (action: UIAlertAction!) -> Void in
                print("OK")
            })
            alert.addAction(defaultAction)
            present(alert, animated: true, completion: nil)
            
        }else{
            nyu_ten = Int(re_hyouziLabel.text!)!
            let judge = (app_uke - nyu_ten)
            if judge < 0{                                   //持ち点が足りなくなっていた時
                let alert: UIAlertController = UIAlertController(title: "⚠️注意⚠️", message: "持ち点がありません", preferredStyle:  UIAlertControllerStyle.alert)
                let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
                    (action: UIAlertAction!) -> Void in
                    print("OK")
                })
                alert.addAction(defaultAction)
                present(alert, animated: true, completion: nil)
            }else if judge > 0{                               //持ち点が足りている時
                let appdelegate = UIApplication.shared.delegate as! AppDelegate
                appdelegate.send = Int(ten_nyuryoku.text!)
                
                print("保存されました")
                
                let vc = UIStoryboard(name: "Chinchiro_Storyboard", bundle: nil).instantiateInitialViewController()!
                self.present(vc, animated: true)
            }else if judge == 0{                              //持ち点と賭け点が同じの時
                let appdelegate = UIApplication.shared.delegate as! AppDelegate
                appdelegate.send = Int(ten_nyuryoku.text!)
                
                print("保存されました")
                
                let vc = UIStoryboard(name: "Chinchiro_Storyboard", bundle: nil).instantiateInitialViewController()!
                self.present(vc, animated: true)
            }
        
        }
        
  
     
    }
 
    @IBAction func backButton(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()!
        self.present(vc, animated: true)
    }
    

}



