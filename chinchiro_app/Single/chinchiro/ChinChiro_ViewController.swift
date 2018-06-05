//
//  ChinChiro_ViewController.swift
//  chinchiro_app
//
//  Created by 村上拓麻 on 2018/05/23.
//  Copyright © 2018年 村上拓麻. All rights reserved.
//

import UIKit

class ChinChiro_ViewController: UIViewController {

    
    @IBOutlet weak var motiten_Label: UILabel! //持ち点を表示するラベル
    @IBOutlet weak var kaketen_Label: UILabel! //賭け点を表示するラベル
    @IBOutlet weak var action1Label: UILabel! //出目を表示するラベル
    @IBOutlet weak var resultLabel: UILabel! //賭け結果を表示するラベル
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        motiten_Label.text = appdelegate.data       //持ち点を表示
        kaketen_Label.text = String(describing: appdelegate.send!) //賭け点を表示
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    
    var choose: Bool = false //ボタンのON OFF判断
    
    @IBAction func chinchiroButton(_ sender: UIButton) {
        
       
        
        if !choose{
            animation()
            if self.imageView1.isAnimating {
                choose = true
            } else {
                self.imageView1.startAnimating() // アニメが止まってたら動かす。
                choose = true
            }
            if self.imageView2.isAnimating {
                
                choose = true
            } else {
                self.imageView2.startAnimating() // アニメが止まってたら動かす。
                choose = true
            }
            if self.imageView3.isAnimating {
                
                choose = true
            } else {
                self.imageView3.startAnimating() // アニメが止まってたら動かす。
                choose = true
            }
            action1Label.text = ""
            resultLabel.text = "もう一度押してください"
        }else{
            stop()
            Chinchiro()             //Chinchiroメソッドを呼び出し
            choose = false
            zeroten()
        }
    }
    
    
    func zeroten(){
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        if Int(appdelegate.data!)! <= 0{     //かけ点が0点になった時にAlertが表示する
            
                appdelegate.data = "0"
            let alert: UIAlertController = UIAlertController(title: "残念...😢", message: "持ち点がなくなりました\n ミニゲームで持ち点を増やしましょう", preferredStyle:  UIAlertControllerStyle.alert)
            
            
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
                (action: UIAlertAction!) -> Void in
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()!
                self.present(vc, animated: true)
            })
            alert.addAction(defaultAction)
            present(alert, animated: true, completion: nil)
            
        }
    }
    
    
    @IBAction func backButton(_ sender: UIButton) {
    let vc = UIStoryboard(name: "Point_Storyboard", bundle: nil).instantiateInitialViewController()!
    self.present(vc, animated: true)
    }
    

}
