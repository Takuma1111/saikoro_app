//
//  ViewControllerBT2.swift
//  ChinChiro
//
//  Created by 村上拓麻 on 2017/11/29.
//  Copyright © 2017年 村上拓麻. All rights reserved.
//

import UIKit

class BTResult_ViewController: UIViewController {
    
    @IBOutlet weak var actionLabel1: UILabel!       //自分の持ち点を表示
    @IBOutlet weak var actionLabel2: UILabel!       //相手の持ち点を表示
    
    @IBOutlet weak var resultLabel: UILabel!        //結果を表示
    
    @IBOutlet weak var image1: UIImageView!     //結果に応じて表示する画像
    @IBOutlet weak var image2: UIImageView!
    
    @IBOutlet weak var hikiwakeLabel: UILabel!      //引き分けの時に表示する
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate1 = UIApplication.shared.delegate as! AppDelegate
        actionLabel1.text = String(appDelegate1.send!)
        
        let appDelegate3 = UIApplication.shared.delegate as! AppDelegate
        actionLabel2.text = String(appDelegate3.uketori!)
        
        result()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func result(){
        let appDelegate1 = UIApplication.shared.delegate as! AppDelegate
        let appDelegate3 = UIApplication.shared.delegate as! AppDelegate
        var atai1: Int = 0
        var atai2: Int = 0
        atai1 = Int(appDelegate1.send!)
        atai2 = Int(appDelegate3.uketori!)
        
        
        if atai1 > atai2{
            resultLabel.text = "あなたの勝ちです。"
            self.image1.image = UIImage(named: "kurakka-Left.png")        //勝ったときの画像を設定する
            self.image2.image = UIImage(named: "kurakka-right.png")
            
            
        }else if atai1 < atai2{
            resultLabel.text = "あなたの負けです"
            self.image1.image = UIImage(named: "Unknown-5.jpg")            //負けた時の画像を設定
            self.image2.image = UIImage(named: "b07ce2df.jpg")
            
        }else{
            resultLabel.text = "引き分けです"                                 //引き分けの時に文字を出力
            hikiwakeLabel.text = "次は勝ちましょう！！"
            
        }
        
        
        
    }
    
    @IBAction func backButton(_ sender: UIButton) {
self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
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

