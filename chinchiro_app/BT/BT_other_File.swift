//
//  BT_other_File.swift
//  chinchiro_app
//
//  Created by 村上拓麻 on 2018/06/18.
//  Copyright © 2018年 村上拓麻. All rights reserved.
//

import Foundation
import UIKit

extension BT_ViewController{
    func Chinchiro(){
        
        er =  Int(nyuryokuField.text!)!    //入力した値を代入
        
        let min = 1             //乱数の最低値を設定
        let range = 6           //乱数の最高値を設定
        
        let random11 = arc4random_uniform(UInt32(range)) + UInt32(min)      //乱数を生成
        let random22 = arc4random_uniform(UInt32(range)) + UInt32(min)
        let random33 = arc4random_uniform(UInt32(range)) + UInt32(min)
        
        //    let random11 = arc4random_uniform(6)     //乱数を生成
        //  let random22 = arc4random_uniform(6)
        //let random33 = arc4random_uniform(6)
        
        
        var result11: Int = 0       //変数を初期化
        var result22: Int = 0
        var result33: Int = 0
        
        result11 = Int(random11)            //乱数をInt型に変換して代入
        print(result11)
        
        result22 = Int(random22)
        print(result22)
        
        result33 = Int(random33)
        print(result33)
        
        
        
        if ((result11 == 1)&&(result22 == 1)&&(result33 == 1)){     //ピンゾロの場合
            action1Label.text = "ピンゾロ"
            allresult = (5 * er)            //得点の処理
            allresultString = String(allresult)     //出力するために文字列に変換
            resultLabel.text = (allresultString+"点獲得です。")       //ラベルに出力
            self.imageView1.image = UIImage(named: "sample1")      //画像を表示
            self.imageView2.image = UIImage(named: "sample1")
            self.imageView3.image = UIImage(named: "sample1")
            
        }else if ((result11 == 2)&&(result22 == 2)&&(result33 == 2)){           //出目１〜６の場合
            action1Label.text = "ゾロ目の二"
            allresult = (3 * er)
            allresultString = String(allresult)
            resultLabel.text = (allresultString+"点獲得です。")
            self.imageView1.image = UIImage(named: "sample2")
            self.imageView2.image = UIImage(named: "sample2")
            self.imageView3.image = UIImage(named: "sample2")
            
            
            
        }else if ((result11 == 3)&&(result22 == 3)&&(result33 == 3)){
            action1Label.text = "ゾロ目の三"
            allresult = (3*er)
            allresultString = String(allresult)
            resultLabel.text = (allresultString+"点獲得です。")
            self.imageView1.image = UIImage(named: "sample3")
            self.imageView2.image = UIImage(named: "sample3")
            self.imageView3.image = UIImage(named: "sample3")
            
            
        }else if ((result11 == 4)&&(result22 == 4)&&(result33 == 4)){
            action1Label.text = "ゾロ目の四"
            allresult = (3 * er)
            allresultString = String(allresult)
            resultLabel.text = (allresultString+"点獲得です。")
            self.imageView1.image = UIImage(named: "sample4")
            self.imageView2.image = UIImage(named: "sample4")
            self.imageView3.image = UIImage(named: "sample4")
            
        }else if((result11 == 5)&&(result22 == 5)&&(result33 == 5)){
            action1Label.text = "ゾロ目の五"
            allresult = (3 * er)
            allresultString = String(allresult)
            resultLabel.text = (allresultString+"点獲得です。")
            self.imageView1.image = UIImage(named: "sample5")
            self.imageView2.image = UIImage(named: "sample5")
            self.imageView3.image = UIImage(named: "sample5")
            
        }else if ((result11 == 6)&&(result22 == 6)&&(result33 == 6)){
            action1Label.text = "ゾロ目の六"
            allresult = (3 * er)
            allresultString = String(allresult)
            resultLabel.text = (allresultString+"点獲得です。")
            self.imageView1.image = UIImage(named: "sample6")
            self.imageView2.image = UIImage(named: "sample6")
            self.imageView3.image = UIImage(named: "sample6")
            
        }else if((result11 == 4)&&(result22 == 5)&&(result33 == 6)){        //シゴロの場合
            action1Label.text = "シゴロ"
            allresult = (2 * er)
            allresultString = String(allresult)
            resultLabel.text = (allresultString+"点獲得です。")
            self.imageView1.image = UIImage(named: "sample4")
            self.imageView2.image = UIImage(named: "sample5")
            self.imageView3.image = UIImage(named: "sample6")
            
            
        }else if((result11 == 5)&&(result22 == 6)&&(result33 == 4)){        //シゴロの場合
            action1Label.text = "シゴロ"
            allresult = (2 * er)
            allresultString = String(allresult)
            resultLabel.text = (allresultString+"点獲得です。")
            self.imageView1.image = UIImage(named: "sample5")
            self.imageView2.image = UIImage(named: "sample6")
            self.imageView3.image = UIImage(named: "sample4")
        }else if((result11 == 5)&&(result22 == 4)&&(result33 == 6)){        //シゴロの場合
            action1Label.text = "シゴロ"
            allresult = (2 * er)
            allresultString = String(allresult)
            resultLabel.text = (allresultString+"点獲得です。")
            self.imageView1.image = UIImage(named: "sample5")
            self.imageView2.image = UIImage(named: "sample4")
            self.imageView3.image = UIImage(named: "sample6")
            
        }else if((result11 == 4)&&(result22 == 6)&&(result33 == 5)){        //シゴロの場合
            action1Label.text = "シゴロ"
            allresult = (2 * er)
            allresultString = String(allresult)
            resultLabel.text = (allresultString+"点獲得です。")
            self.imageView1.image = UIImage(named: "sample4")
            self.imageView2.image = UIImage(named: "sample6")
            self.imageView3.image = UIImage(named: "sample5")
            
            
        }else if((result11 == 6)&&(result22 == 4)&&(result33 == 5)){        //シゴロの場合
            action1Label.text = "シゴロ"
            allresult = (2 * er)
            allresultString = String(allresult)
            resultLabel.text = (allresultString+"点獲得です。")
            self.imageView1.image = UIImage(named: "sample6")
            self.imageView2.image = UIImage(named: "sample4")
            self.imageView3.image = UIImage(named: "sample5")
            
            
        }else if((result11 == 6)&&(result22 == 5)&&(result33 == 4)){        //シゴロの場合
            action1Label.text = "シゴロ"
            allresult = (2 * er)
            allresultString = String(allresult)
            resultLabel.text = (allresultString+"点獲得です。")
            self.imageView1.image = UIImage(named: "sample6")
            self.imageView2.image = UIImage(named: "sample5")
            self.imageView3.image = UIImage(named: "sample4")
            
            
        }else if((result11 == 1)&&(result22 == 1)&&(1<result33)){
            action1Label.text = "出目一"
            allresult =  er
            allresultString = String(allresult)
            resultLabel.text = (allresultString+"点獲得です。")
            self.imageView1.image = UIImage(named: "sample1")
            self.imageView2.image = UIImage(named: "sample1")
            
            switch result33{
            case 2:
                self.imageView3.image = UIImage(named: "sample2")
            case 3:
                self.imageView3.image = UIImage(named: "sample3")
            case 4:
                self.imageView3.image = UIImage(named: "sample4")
            case 5:
                self.imageView3.image = UIImage(named: "sample5")
            case 6:
                self.imageView3.image = UIImage(named: "sample6")
            default:
                break
            }
            
        }else if((result11 == 2)&&(result22 == 2)&&((1==result33)||(2<result33))){
            action1Label.text = "出目二"
            allresult =  er
            allresultString = String(allresult)
            resultLabel.text = (allresultString+"点獲得です。")
            self.imageView1.image = UIImage(named: "sample2")
            self.imageView2.image = UIImage(named: "sample2")
            
            switch result33{
            case 1:
                self.imageView3.image = UIImage(named: "sample1")
            case 3:
                self.imageView3.image = UIImage(named: "sample3")
            case 4:
                self.imageView3.image = UIImage(named: "sample4")
            case 5:
                self.imageView3.image = UIImage(named: "sample5")
            case 6:
                self.imageView3.image = UIImage(named: "sample6")
            default:
                break
            }
            
            
        }else if((result11 == 3)&&(result22 == 3)&&((result33==1)||(result33==2)||(3<result33))){
            action1Label.text = "出目三"
            allresult =  er
            allresultString = String(allresult)
            resultLabel.text = (allresultString+"点獲得です。")
            self.imageView1.image = UIImage(named: "sample3")
            self.imageView2.image = UIImage(named: "sample3")
            
            switch result33{
            case 1:
                self.imageView3.image = UIImage(named: "sample1")
            case 2:
                self.imageView3.image = UIImage(named: "sample2")
            case 4:
                self.imageView3.image = UIImage(named: "sample4")
            case 5:
                self.imageView3.image = UIImage(named: "sample5")
            case 6:
                self.imageView3.image = UIImage(named: "sample6")
            default:
                break
            }
            
        }else if((result11 == 4)&&(result22 == 4)&&((result33==1)||(result33==2)||(result33==3)||(4<result33))){
            action1Label.text = "出目四"
            allresult =  er
            allresultString = String(allresult)
            resultLabel.text = (allresultString+"点獲得です。")
            self.imageView1.image = UIImage(named: "sample4")
            self.imageView2.image = UIImage(named: "sample4")
            
            switch result33{
            case 1:
                self.imageView3.image = UIImage(named: "sample1")
            case 2:
                self.imageView3.image = UIImage(named: "sample2")
            case 3:
                self.imageView3.image = UIImage(named: "sample3")
            case 5:
                self.imageView3.image = UIImage(named: "sample5")
            case 6:
                self.imageView3.image = UIImage(named: "sample6")
            default:
                break
            }
            
        }else if((result11 == 5)&&(result22 == 5)&&((result33==1)||(result33==2)||(result33==3)||(5<result33))){
            action1Label.text = "出目五"
            allresult =  er
            allresultString = String(allresult)
            resultLabel.text = (allresultString+"点獲得です。")
            self.imageView1.image = UIImage(named: "sample5")
            self.imageView2.image = UIImage(named: "sample5")
            
            switch result33{
            case 1:
                self.imageView3.image = UIImage(named: "sample1")
            case 2:
                self.imageView3.image = UIImage(named: "sample2")
            case 3:
                self.imageView3.image = UIImage(named: "sample3")
            case 4:
                self.imageView3.image = UIImage(named: "sample4")
            case 6:
                self.imageView3.image = UIImage(named: "sample6")
            default:
                break
            }
            
        }else if((result11 == 6)&&(result22 == 6)&&((result33==1)||(result33==2)||(result33==3)||(result33==4)||(result33==5))){
            action1Label.text = "出目六"
            allresult =  er
            allresultString = String(allresult)
            resultLabel.text = (allresultString+"点獲得です。")
            self.imageView1.image = UIImage(named: "sample6")
            self.imageView2.image = UIImage(named: "sample6")
            
            switch result33{
            case 1:
                self.imageView3.image = UIImage(named: "sample1")
            case 2:
                self.imageView3.image = UIImage(named: "sample2")
            case 3:
                self.imageView3.image = UIImage(named: "sample3")
            case 4:
                self.imageView3.image = UIImage(named: "sample4")
            case 5:
                self.imageView3.image = UIImage(named: "sample5")
            default:
                break
            }
            
            
        }else if((result11 == 1)&&(1<result22)&&(result33==1)){
            action1Label.text = "出目一"
            allresult =  er
            allresultString = String(allresult)
            resultLabel.text = (allresultString+"点獲得です。")
            self.imageView1.image = UIImage(named: "sample1")
            
            switch result22{
            case 2:
                self.imageView2.image = UIImage(named: "sample2")
            case 3:
                self.imageView2.image = UIImage(named: "sample3")
            case 4:
                self.imageView2.image = UIImage(named: "sample4")
            case 5:
                self.imageView2.image = UIImage(named: "sample5")
            case 6:
                self.imageView2.image = UIImage(named: "sample6")
            default:
                break
            }
            self.imageView3.image = UIImage(named: "sample1")
            
            
            
        }else if((result11 == 2)&&((result22 == 1)||(2<result22))&&(result33==2)){
            action1Label.text = "出目二"
            allresult =  er
            allresultString = String(allresult)
            resultLabel.text = (allresultString+"点獲得です。")
            self.imageView1.image = UIImage(named: "sample2")
            
            switch result22{
            case 1:
                self.imageView2.image = UIImage(named: "sample1")
            case 3:
                self.imageView2.image = UIImage(named: "sample3")
            case 4:
                self.imageView2.image = UIImage(named: "sample4")
            case 5:
                self.imageView2.image = UIImage(named: "sample5")
            case 6:
                self.imageView2.image = UIImage(named: "sample6")
            default:
                break
            }
            self.imageView3.image = UIImage(named: "sample2")
            
            
            
        }else if((result11 == 3)&&((result22 == 1)||(result22==2)||(3<result22))&&(result33 == 3)){
            action1Label.text = "出目三"
            allresult =  er
            allresultString = String(allresult)
            resultLabel.text = (allresultString+"点獲得です。")
            self.imageView1.image = UIImage(named: "sample3")
            
            switch result22{
            case 1:
                self.imageView2.image = UIImage(named: "sample1")
            case 2:
                self.imageView2.image = UIImage(named: "sample2")
            case 4:
                self.imageView2.image = UIImage(named: "sample4")
            case 5:
                self.imageView2.image = UIImage(named: "sample5")
            case 6:
                self.imageView2.image = UIImage(named: "sample6")
            default:
                break
            }
            self.imageView3.image = UIImage(named: "sample3")
            
            
            
        }else if((result11 == 4)&&((result22 == 1)||(result22 == 2)||(result22 == 3)||(4<result22))&&(result33==4)){
            action1Label.text =  "出目四"
            allresult =  er
            allresultString = String(allresult)
            resultLabel.text = (allresultString+"点獲得です。")
            self.imageView1.image = UIImage(named: "sample4")
            
            switch result22{
            case 1:
                self.imageView2.image = UIImage(named: "sample1")
            case 2:
                self.imageView2.image = UIImage(named: "sample2")
            case 3:
                self.imageView2.image = UIImage(named: "sample3")
            case 5:
                self.imageView2.image = UIImage(named: "sample5")
            case 6:
                self.imageView2.image = UIImage(named: "sample6")
            default:
                break
            }
            self.imageView3.image = UIImage(named: "sample4")
            
            
            
        }else if((result11 == 5)&&((result22==1)||(result22==2)||(result22==3)||(result22==4)||(5<result22))&&(result33==5)){
            action1Label.text = "出目五"
            allresult =  er
            allresultString = String(allresult)
            resultLabel.text = (allresultString+"点獲得です。")
            self.imageView1.image = UIImage(named: "sample5")
            
            switch result22{
            case 1:
                self.imageView2.image = UIImage(named: "sample1")
            case 2:
                self.imageView2.image = UIImage(named: "sample2")
            case 3:
                self.imageView2.image = UIImage(named: "sample3")
            case 4:
                self.imageView2.image = UIImage(named: "sample4")
            case 6:
                self.imageView2.image = UIImage(named: "sample6")
            default:
                break
            }
            self.imageView3.image = UIImage(named: "sample5")
            
            
        }else if((result11 == 6)&&((result22==1)||(result22==2)||(result22==3)||(result22==4)||(result22==5))&&(result33 == 6)){
            action1Label.text = "出目六"
            allresult =  er
            allresultString = String(allresult)
            resultLabel.text = (allresultString+"点獲得です。")
            self.imageView1.image = UIImage(named: "sample6")
            
            switch result22{
            case 1:
                self.imageView2.image = UIImage(named: "sample1")
            case 2:
                self.imageView2.image = UIImage(named: "sample2")
            case 3:
                self.imageView2.image = UIImage(named: "sample3")
            case 4:
                self.imageView2.image = UIImage(named: "sample4")
            case 5:
                self.imageView2.image = UIImage(named: "sample5")
            default:
                break
            }
            self.imageView3.image = UIImage(named: "sample6")
            
            
            
        }else if((1<result11)&&(1==result22)&&(result33==1)){
            action1Label.text = "出目一"
            allresult =  er
            allresultString = String(allresult)
            resultLabel.text = (allresultString+"点獲得です。")
            switch result11{
            case 2:
                self.imageView1.image = UIImage(named: "sample2")
            case 3:
                self.imageView1.image = UIImage(named: "sample3")
            case 4:
                self.imageView1.image = UIImage(named: "sample4")
            case 5:
                self.imageView1.image = UIImage(named: "sample5")
            case 6:
                self.imageView1.image = UIImage(named: "sample6")
            default:
                break
            }
            self.imageView2.image = UIImage(named: "sample1")
            self.imageView3.image = UIImage(named: "sample1")
            
            
        }else if((result11 == 1)||(2<result11))&&(result22 == 2)&&(result33==2){
            action1Label.text = "出目二"
            allresult =  er
            allresultString = String(allresult)
            resultLabel.text = (allresultString+"点獲得です。")
            switch result11{
            case 1:
                self.imageView1.image = UIImage(named: "sample1")
            case 3:
                self.imageView1.image = UIImage(named: "sample3")
            case 4:
                self.imageView1.image = UIImage(named: "sample4")
            case 5:
                self.imageView1.image = UIImage(named: "sample5")
            case 6:
                self.imageView1.image = UIImage(named: "sample6")
            default:
                break
            }
            self.imageView2.image = UIImage(named: "sample2")
            self.imageView3.image = UIImage(named: "sample2")
            
            
        }else if((result11 == 1)||(result11 == 2)||(3<result11))&&(result22==3)&&(result33 == 3){
            action1Label.text = "出目三"
            allresult =  er
            allresultString = String(allresult)
            resultLabel.text = (allresultString+"点獲得です。")
            switch result11{
            case 1:
                self.imageView1.image = UIImage(named: "sample1")
            case 2:
                self.imageView1.image = UIImage(named: "sample2")
            case 4:
                self.imageView1.image = UIImage(named: "sample4")
            case 5:
                self.imageView1.image = UIImage(named: "sample5")
            case 6:
                self.imageView1.image = UIImage(named: "sample6")
            default:
                break
            }
            self.imageView2.image = UIImage(named: "sample3")
            self.imageView3.image = UIImage(named: "sample3")
            
        }else if((result11 == 1)||(result11 == 2)||(result11 == 3)||(4 < result11))&&(result22==4)&&(result33==4){
            action1Label.text = "出目四"
            allresult =  er
            allresultString = String(allresult)
            resultLabel.text = (allresultString+"点獲得です。")
            switch result11{
            case 1:
                self.imageView1.image = UIImage(named: "sample1")
            case 2:
                self.imageView1.image = UIImage(named: "sample2")
            case 3:
                self.imageView1.image = UIImage(named: "sample3")
            case 5:
                self.imageView1.image = UIImage(named: "sample5")
            case 6:
                self.imageView1.image = UIImage(named: "sample6")
            default:
                break
            }
            self.imageView2.image = UIImage(named: "sample4")
            self.imageView3.image = UIImage(named: "sample4")
            
        }else if((result11==1)||(result11==2)||(result11==3)||(result11==4)||(5<result11))&&(result22==5)&&(result33==5){
            action1Label.text = "出目五"
            allresult =  er
            allresultString = String(allresult)
            resultLabel.text = (allresultString+"点獲得です。")
            switch result11{
            case 1:
                self.imageView1.image = UIImage(named: "sample1")
            case 2:
                self.imageView1.image = UIImage(named: "sample2")
            case 3:
                self.imageView1.image = UIImage(named: "sample3")
            case 4:
                self.imageView1.image = UIImage(named: "sample4")
            case 6:
                self.imageView1.image = UIImage(named: "sample6")
            default:
                break
            }
            self.imageView2.image = UIImage(named: "sample5")
            self.imageView3.image = UIImage(named: "sample5")
            
        }else if((result11==1)||(result11==2)||(result11==3)||(result11==4)||(result11==5))&&(result22==6)&&(result33 == 6){
            action1Label.text = "出目六"
            allresult =  er
            allresultString = String(allresult)
            resultLabel.text = (allresultString+"点獲得です。")
            switch result11{
            case 1:
                self.imageView1.image = UIImage(named: "sample1")
            case 2:
                self.imageView1.image = UIImage(named: "sample2")
            case 3:
                self.imageView1.image = UIImage(named: "sample3")
            case 4:
                self.imageView1.image = UIImage(named: "sample4")
            case 5:
                self.imageView1.image = UIImage(named: "sample5")
            default:
                break
            }
            self.imageView2.image = UIImage(named: "sample6")
            self.imageView3.image = UIImage(named: "sample6")
            
            
            
        }else if (result11==1)&&(result22==2)&&(result33==3){           //一二三の場合
            action1Label.text = "ヒフミ"
            allresult = -(er*2)
            allresultString = String(allresult)
            resultLabel.text = (allresultString+"点払いです。")
            self.imageView1.image = UIImage(named: "sample1")
            self.imageView2.image = UIImage(named: "sample2")
            self.imageView3.image = UIImage(named: "sample3")
            
        }else if (result11==1)&&(result22==3)&&(result33==2){
            action1Label.text = "ヒフミ"
            allresult = -(er*2)
            allresultString = String(allresult)
            resultLabel.text = (allresultString+"点払いです。")
            self.imageView1.image = UIImage(named: "sample1")
            self.imageView2.image = UIImage(named: "sample3")
            self.imageView3.image = UIImage(named: "sample2")
            
        }else if(result11 == 2)&&(result22 == 1)&&(result33 == 3){
            action1Label.text = "ヒフミ"
            allresult = -(er*2)
            allresultString = String(allresult)
            resultLabel.text = (allresultString+"点払いです。")
            self.imageView1.image = UIImage(named: "sample2")
            self.imageView2.image = UIImage(named: "sample1")
            self.imageView3.image = UIImage(named: "sample3")
            
        }else if(result11 == 2)&&(result22 == 3)&&(result33 == 1){
            action1Label.text = "ヒフミ"
            allresult = -(er*2)
            allresultString = String(allresult)
            resultLabel.text = (allresultString+"点払いです。")
            self.imageView1.image = UIImage(named: "sample2")
            self.imageView2.image = UIImage(named: "sample3")
            self.imageView3.image = UIImage(named: "sample1")
            
        }else if(result11 == 3)&&(result22 == 1)&&(result33 == 2){
            action1Label.text = "ヒフミ"
            allresult = -(er*2)
            allresultString = String(allresult)
            resultLabel.text = (allresultString+"点払いです。")
            self.imageView1.image = UIImage(named: "sample3")
            self.imageView2.image = UIImage(named: "sample1")
            self.imageView3.image = UIImage(named: "sample2")
            
        }else if(result11 == 3)&&(result22 == 2)&&(result33 == 1){
            action1Label.text = "ヒフミ"
            allresult = -(er*2)
            allresultString = String(allresult)
            resultLabel.text = (allresultString+"点払いです。")
            self.imageView1.image = UIImage(named: "sample3")
            self.imageView2.image = UIImage(named: "sample2")
            self.imageView3.image = UIImage(named: "sample1")
            
        }
        
        if(result11 == result22)||(result11 == result33)||(result22 == result33)||((result11 == 1)&&(result22 == 2)&&(result33 == 3))||((result11 == 2)&&(result22 == 1)&&(result33 == 3))||((result11 == 1)&&(result22 == 3)&&(result33 == 2))||((result11 == 3)&&(result22 == 2)&&(result33 == 1))||((result11 == 2)&&(result22 == 3)&&(result33 == 1))||((result11 == 3)&&(result22 == 1)&&(result33 == 2)){                                 //それ以外、つまり出目なしの場合
            
        }else{
            action1Label.text = "出目なし"
            allresult = (-er)
            allresultString = String(allresult)
            resultLabel.text = (allresultString+"点払いです。")
            switch result11{
            case 1:
                self.imageView1.image = UIImage(named: "sample1")
            case 2:
                self.imageView1.image = UIImage(named: "sample2")
            case 3:
                self.imageView1.image = UIImage(named: "sample3")
            case 4:
                self.imageView1.image = UIImage(named: "sample4")
            case 5:
                self.imageView1.image = UIImage(named: "sample5")
            case 6:
                self.imageView1.image = UIImage(named: "sample6")
            default:
                break
            }
            switch result22{
            case 1:
                self.imageView2.image = UIImage(named: "sample1")
            case 2:
                self.imageView2.image = UIImage(named: "sample2")
            case 3:
                self.imageView2.image = UIImage(named: "sample3")
            case 4:
                self.imageView2.image = UIImage(named: "sample4")
            case 5:
                self.imageView2.image = UIImage(named: "sample5")
            case 6:
                self.imageView2.image = UIImage(named: "sample6")
            default:
                break
            }
            switch result33{
            case 1:
                self.imageView3.image = UIImage(named: "sample1")
            case 2:
                self.imageView3.image = UIImage(named: "sample2")
            case 3:
                self.imageView3.image = UIImage(named: "sample3")
            case 4:
                self.imageView3.image = UIImage(named: "sample4")
            case 5:
                self.imageView3.image = UIImage(named: "sample5")
            case 6:
                self.imageView3.image = UIImage(named: "sample6")
            default:
                break
            }
            
            
        }
        
    }
    
    
    //追加要素
    
    func animation(){
        var animationSeq = [
            UIImage(named: "sample4.png"),
            UIImage(named: "sample2.png"),
            UIImage(named: "sample5.png"),
            UIImage(named: "sample6.png"),
            UIImage(named: "sample1.png"),
            UIImage(named: "sample3.png")
        ]
        
        var animationSeq1 = [
            UIImage(named: "sample2.png"),
            UIImage(named: "sample5.png"),
            UIImage(named: "sample3.png"),
            UIImage(named: "sample1.png"),
            UIImage(named: "sample4.png"),
            UIImage(named: "sample6.png")
        ]
        
        var animationSeq2 = [
            UIImage(named: "sample6.png"),
            UIImage(named: "sample4.png"),
            UIImage(named: "sample1.png"),
            UIImage(named: "sample3.png"),
            UIImage(named: "sample2.png"),
            UIImage(named: "sample5.png")
        ]
        
        
        self.imageView1.animationImages = animationSeq as! [UIImage]
        self.imageView1.animationDuration = 2
        self.imageView1.animationRepeatCount = 10
        
        self.imageView2.animationImages = animationSeq1 as! [UIImage]
        self.imageView2.animationDuration = 2
        self.imageView2.animationRepeatCount = 10
        
        self.imageView3.animationImages = animationSeq2 as! [UIImage]
        self.imageView3.animationDuration = 2
        self.imageView3.animationRepeatCount = 10
        
        
    }
    
    func stop(){
        self.imageView1.stopAnimating() // アニメが動いてたら止める。
        self.imageView2.stopAnimating() // アニメが動いてたら止める。
        self.imageView3.stopAnimating() // アニメが動いてたら止める。
    }
    
}
