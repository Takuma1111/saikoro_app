//
//  Point_File.swift
//  chinchiro_app
//
//  Created by 村上拓麻 on 2018/05/23.
//  Copyright © 2018年 村上拓麻. All rights reserved.
//

import Foundation
import UIKit



extension Point_ViewController: UITextViewDelegate,UITextFieldDelegate{
    
    func toziru(){
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        
        let doneButton = UIBarButtonItem(title:"閉じる", style: .done, target:
            self,action: #selector(Point_ViewController.tapDoneButton))
        let spaceButton = UIBarButtonItem(barButtonSystemItem:
            UIBarButtonSystemItem.flexibleSpace,target: nil,action: nil)
        toolBar.setItems([spaceButton,doneButton], animated:  false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        
        ten_nyuryoku.delegate = self
        ten_nyuryoku.inputAccessoryView = toolBar
        
    }
    
    @objc func tapDoneButton(){
        re_hyouziLabel.text = ten_nyuryoku.text     //賭け点表示
        view.endEditing(true)
    }
    
}



