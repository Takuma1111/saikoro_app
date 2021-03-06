//
//  ViewControllerBT1.swift
//  ChinChiro
//
//  Created by 村上拓麻 on 2017/11/26.
//  Copyright © 2017年 村上拓麻. All rights reserved.
//



//
//  ViewController.swift
//  test1
//
//  Created by 村上拓麻 on 2017/11/26.
//  Copyright © 2017年 村上拓麻. All rights reserved.
//




import UIKit
import MultipeerConnectivity

class BT_ViewController: UIViewController, MCBrowserViewControllerDelegate,
MCSessionDelegate,UITextFieldDelegate {
    
    let serviceType = "LCOC-Chat"
    
    var browser : MCBrowserViewController!
    var assistant : MCAdvertiserAssistant!
    var session : MCSession!
    var peerID: MCPeerID!
    
    var p1num : Int = 0   //送る値
    var kekka32: Int!
    var dai: String! //NSDataをString型に変換したやつを代入
    var uketoriInt: Int = 0 //送られてきた値を代入
    
    var er: Int = 0      //賭け点
    var allresult: Int = 0
    var allresultString: String!
    
    var count: Int = 0 //五回まで数える変数
    var count1: Int = 0
    
    var ten: Int = 100     //持ち点を初期設定
    var co1: Int!
    var co2: Int = 0    //持ち点の代入
    
    var uketoriint: Int = 0 //データを受け取った回数を入れる変数
    
    private var myButton: UIButton! //追加
    
    
    //  @IBOutlet weak var player1Label: UILabel!
    // @IBOutlet weak var player2Label: UILabel!
    
    
    @IBOutlet weak var resultLabel: UILabel!    //獲得点を表示
    @IBOutlet weak var motitenLabel: UILabel!   //持ち点を表示するラベル
    
    
    @IBOutlet weak var nyuryokuField: UITextField!
    
    
    @IBOutlet weak var imageView1: UIImageView!     //サイコロ画像表示
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    
    
    @IBOutlet weak var action1Label: UILabel!
    
    @IBOutlet weak var kaisuLabel: UILabel!             //賽を振った回数を表示するラベル
    
    
    var aa: Int = 1
    
    var judge : Bool = false    //bluetoothに接続されたか確認する変数
    
    var alert:UIAlertController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        judge = false
        
        self.peerID = MCPeerID(displayName: UIDevice.current.name)
        self.session = MCSession(peer: peerID)
        self.session.delegate = self
        
        // create the browser viewcontroller with a unique service name
        self.browser = MCBrowserViewController(serviceType:serviceType,
                                               session:self.session)
        self.browser.delegate = self;
        self.assistant = MCAdvertiserAssistant(serviceType:serviceType,
                                               discoveryInfo:nil, session:self.session)
        
        
        
        let appDelegate5 = UIApplication.shared.delegate as! AppDelegate
        appDelegate5.Btmainkazu = nil
        
        
        
        
        
        // tell the assistant to start advertising our fabulous chat
        self.assistant.start()
        
        toziru()
        
        co2 = ten
        
        let bg = UIImageView(frame: CGRect(x: 0, y: 50, width: self.view.frame.size.width, height: self.view.frame.size.height))
        bg.image = UIImage(named: "sampler.png")        //背景を設定
        bg.layer.zPosition = -1
        self.view.addSubview(bg)
        
        
        
        
        self.imageView1.image = UIImage(named: "sample4")
        self.imageView2.image = UIImage(named: "sample5")
        self.imageView3.image = UIImage(named: "sample6")
        
        
    }
    
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    func toziru(){
        //テキストを閉じるボタンを作成
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        
        let doneButton = UIBarButtonItem(title:"閉じる", style: .done, target: self,action: #selector(BT_ViewController.tapDoneButton))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace,target: nil,action: nil)
        toolBar.setItems([spaceButton,doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        
        nyuryokuField.delegate = self     //どこの入力するところで閉じるボタンをつけるかをここで指定
        nyuryokuField.inputAccessoryView = toolBar
        
        
        self.nyuryokuField.keyboardType = UIKeyboardType.numberPad  //入力次のキーボードの種類を設定
        
    }
    
    
    
    
    
    @objc func tapDoneButton(){
        //tenhyouzi()
        view.endEditing(true)           //テキストを閉じる機能
        
        let appDelegate5 = UIApplication.shared.delegate as! AppDelegate        //賭け点を設定していなかった時の判断に使うために代入している
        
        appDelegate5.Btmainkazu = Int(nyuryokuField.text!)
    }
    
    
    
    
    @IBAction func tapGesture(_ sender: Any) {
     view.endEditing(true)
        let appdelegate5 = UIApplication.shared.delegate as! AppDelegate
        appdelegate5.Btmainkazu = Int(nyuryokuField.text!)
        
    }
    
    
    
    // プラスボタン
    @IBAction func plusBtn(_ sender: Any) {
    
        
        // NSDataへInt型のp1numを変換
        let data = NSData(bytes: &p1num, length: MemoryLayout<NSInteger>.size)
        
        
        if data.bytes == nil{
            print("データがありません")
        }else{
            do{
                try self.session.send(data as Data, toPeers: self.session.connectedPeers, with: MCSessionSendDataMode.unreliable)
            }catch{
                print("error")
            }
        }
   
        
    }
    
    
    var choose: Bool = false //アニメメーションを流すボタンのON OFF判断
    @IBAction func minusBtn(_ sender: Any) {        //賽を振るボタン
        
        /*ここら辺のソースコードを綺麗にする。
         加えて、ペアリングした後に相手の機器がまだ接続されていませんと表示される*/
        
        if judge == false{
            let alert: UIAlertController = UIAlertController(title: "⚠️注意⚠️", message: "まだ相手機器とペアリングしていません", preferredStyle: UIAlertControllerStyle.alert)
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
                (action: UIAlertAction!) -> Void in
                print("OK")
            })
            alert.addAction(defaultAction)
            present(alert, animated: true, completion: nil)
        }else if !choose{
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
            choose = false
            
            
            
            //count += 1
            
            //elseでアニメーションが終わったらcount+1になるようにする
            
            
            let appDelegate5 = UIApplication.shared.delegate as! AppDelegate            //賭け点を設定していなかった時にでるアラーム
            if appDelegate5.Btmainkazu == nil {
                alert = UIAlertController(title: "注意", message: "賭け点を設定して下さい", preferredStyle: UIAlertControllerStyle.alert)
                self.present(alert, animated: true, completion:nil)
                
                let alertAction2 = UIAlertAction(
                    title: "OK",
                    style: UIAlertActionStyle.cancel,
                    handler: nil
                )
                
                //アラートアクションを追加する。
                
                alert.addAction(alertAction2)
                
            }else if count < 6{
                
                Chinchiro()
            
                
                
                if co2 <= 0{        //持ち点が0になった時の処理
                    alert = UIAlertController(title: "持ち点がなくなりました",message: "対戦相手が終わったらボタンをもう一回押してください",preferredStyle:
                    UIAlertControllerStyle.alert)
                    self.present(alert, animated: true, completion: nil)
                    let alertAction2 = UIAlertAction(
                        title:"OK",
                        style: UIAlertActionStyle.cancel,
                        handler: nil)
                    uketoriInt = 6  //ここで値を入れることによって終わらせることができる
                    alert.addAction(alertAction2)
                }
                
                
                
                co2 = (co2 + allresult)   //持ち点を更新
                motitenLabel.text = String(co2)     //持ち点を表示
                
                let appDelegate1 = UIApplication.shared.delegate as! AppDelegate
                appDelegate1.send = co2      //自分の持ち点をappdelegateに保存
                
                p1num = co2
                let data = NSData(bytes: &p1num, length: MemoryLayout<NSInteger>.size)
                
                
                if data.bytes == nil{
                    print("データがありません")
                }else{
                    do {
                        try self.session.send(data as Data, toPeers: self.session.connectedPeers, with: MCSessionSendDataMode.unreliable)                   //ここら辺でデータを相手に喰っている
                        count += 1
                        kaisuLabel.text = String(count)            //振った回数を表示する
                    } catch {
                        print(error)
                    }
                }
            }else if uketoriint != 6{           //相手のデータを5回受け取ってなかったらアラームを表示する
                alert = UIAlertController(title: "賽を振り終わりました", message: "対戦相手が終わったらもう一回押して下さい", preferredStyle: UIAlertControllerStyle.alert)
                self.present(alert, animated: true, completion:nil)
                
                let alertAction2 = UIAlertAction(
                    title: "OK",
                    style: UIAlertActionStyle.cancel,
                    handler: nil
                    
                )
                
                //アラートアクションを追加する。
                
                alert.addAction(alertAction2)
                
            }else{
                
                syori()
                
                
                /*
                 let targetViewController = self.storyboard!.instantiateViewController( withIdentifier: "target" )
                 self.present( targetViewController, animated: true, completion: nil)
                 */
                action1Label.text = "次の画面に行ってください"
            }
        }
        /*
         if count == 5{
         let targetViewController = self.storyboard!.instantiateViewController( withIdentifier: "target" )
         self.present( targetViewController, animated: true, completion: nil)
         
         }
         */
        
        
    }
    
    
    func syori(){
        // Buttonを生成する.
        myButton = UIButton()
        
        // ボタンのサイズ.
        let bWidth: CGFloat = 200
        let bHeight: CGFloat = 50
        
        // ボタンのX,Y座標.
        let posX: CGFloat = self.view.frame.width/2 - bWidth/2
        let posY: CGFloat = self.view.frame.height/2 - bHeight/2
        
        // ボタンの設置座標とサイズを設定する.
        myButton.frame = CGRect(x: posX, y: posY, width: bWidth, height: bHeight)
        
        // ボタンの背景色を設定.
        myButton.backgroundColor = UIColor.red
        
        // ボタンの枠を丸くする.
        myButton.layer.masksToBounds = true
        
        // コーナーの半径を設定する.
        myButton.layer.cornerRadius = 20.0
        
        // タイトルを設定する(通常時).
        myButton.setTitle("結果へ", for: .normal)
        myButton.setTitleColor(UIColor.white, for: .normal)
        
        // タイトルを設定する(ボタンがハイライトされた時).
        myButton.setTitle("ざわ・・・ざわ・・・", for: .highlighted)
        myButton.setTitleColor(UIColor.black, for: .highlighted)
        
        // ボタンにタグをつける.
        myButton.tag = 1
        
        // イベントを追加する
        myButton.addTarget(self, action: #selector(BT_ViewController.onClickMyButton(sender:)), for: .touchUpInside)
        
        // ボタンをViewに追加.
        self.view.addSubview(myButton)
        
    }
    
    @objc internal func onClickMyButton(sender: UIButton) {
        /*  print("onClickMyButton:");
         print("sender.currentTitle: \(String(describing: sender.currentTitle))")
         print("sender.tag: \(sender.tag)")*/
        
        
        let vc = UIStoryboard(name: "BTResult_Storyboard", bundle: nil).instantiateInitialViewController()!
        self.present(vc, animated: true)
        
//        let targetViewController = self.storyboard!.instantiateViewController( withIdentifier: "target" )
//        self.present( targetViewController, animated: true, completion: nil)
        
    }
    
    
    // ラベルの更新
    func updateLabel(num : Int, fromPeer peerID: MCPeerID) {
        
        // peerが自分のものでない時ラベルの更新
        switch peerID {
        case self.peerID:
            break
        default:
            print("確認")
            //    player2Label.text = String(num)
        }
        
    }
    
    @IBAction func showBrowser(sender: UIButton) {
        // Show the browser view controller
        self.present(self.browser, animated: true, completion: nil)
    }
    
    func browserViewControllerDidFinish(
        _ browserViewController: MCBrowserViewController)  {
        // Called when the browser view controller is dismissed (ie the Done
        // button was tapped)
        print("ペアリング終わった")
        judge = true
        print("judgeの内容",judge)

        self.dismiss(animated: true, completion: nil)
    }
    
    func browserViewControllerWasCancelled(
        _ browserViewController: MCBrowserViewController)  {
        // Called when the browser view controller is cancelled
        judge = true //確認のためのbool
        
        
        self.dismiss(animated: true, completion: nil)
    }
    
    // 相手からNSDataが送られてきたとき
    func session(_ session: MCSession, didReceive data: Data,
                 fromPeer peerID: MCPeerID)  {
        DispatchQueue.main.async() {
            
            
            self.judge = true //確認
            
            //ここの部分でデータがnilかどうかを判断する
            //if文で dara == nil{  }という文で判断するNSData型をどのように判断するのかを調べてくる
            //加えてどの変数名がNSData型を入れているのかを確かめる
            
            
            
            self.uketoriint += 1            //////////////////////////////////////////////////
            
            
            let data = NSData(data: data)
            var player2num : NSInteger = 0
            data.getBytes(&player2num, length: data.length)
            // ラベルの更新
            self.updateLabel(num: player2num, fromPeer: peerID)
            
            
            //////////////////////////////////////////////////
            
            /*
             let kom = String(player2num)
             if kom == nil{
             //ここでnilで送られてきたデータをカウントするか判断する
             self.uketoriint -= 1
             
             }
             */
            
            
            
            // self.uketoriInt =   self.uketoriInt + Int(player2num)
            let appDelegate3 = UIApplication.shared.delegate as! AppDelegate
            appDelegate3.uketori = player2num        //受け取った相手の点をappdelegateに保存
            
            
        }
    }
    
    
    
    // The following methods do nothing, but the MCSessionDelegate protocol
    // requires that we implement them.
    func session(_ session: MCSession,
                 didStartReceivingResourceWithName resourceName: String,
                 fromPeer peerID: MCPeerID, with progress: Progress)  {
        
        // Called when a peer starts sending a file to us
    }
    
    func session(_ session: MCSession,
                 didFinishReceivingResourceWithName resourceName: String,
                 fromPeer peerID: MCPeerID,
                 at localURL: URL?, withError error: Error?)  {
        // Called when a file has finished transferring from another peer
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream,
                 withName streamName: String, fromPeer peerID: MCPeerID)  {
        // Called when a peer establishes a stream with us
    }
    
    func session(_ session: MCSession, peer peerID: MCPeerID,
                 didChange state: MCSessionState)  {
        // Called when a connected peer changes state (for example, goes offline)
        
    }
    
   
    
    
    
    
    
    
    func button(){
        let myButton: UIButton = UIButton()
        let buttonWidth: CGFloat = 200
        let buttonHeight: CGFloat = 40
        let posX: CGFloat = (self.view.bounds.width - buttonWidth)/2
        let posY: CGFloat = 600
        myButton.frame = CGRect(x: posX, y: posY, width: buttonWidth, height: buttonHeight)
        myButton.backgroundColor = UIColor.red
        myButton.layer.masksToBounds = true
        myButton.layer.cornerRadius = 20.0
        myButton.setTitle("チンチロを開始する", for: .normal)
        myButton.setTitleColor(UIColor.white, for: .normal)
        
        myButton.addTarget(self, action: #selector(onClickMyButton1(sender:)), for: .touchDown)
        
        // ボタンをViewに追加する
        self.view.addSubview(myButton)
    }
    
    
    @objc internal func onClickMyButton1(sender: UIButton){
        
        // UIAlertControllerを作成する.
        let myAlert: UIAlertController = UIAlertController(title: "注意", message: "賭け点を設定して下さい", preferredStyle: .alert)
        
        // OKのアクションを作成する.
        let myOkAction = UIAlertAction(title: "OK", style: .default) { action in
            print("Action OK!!")
        }
        
        
        // OKのActionを追加する.
        myAlert.addAction(myOkAction)
        
        
        // UIAlertを発動する.
        present(myAlert, animated: true, completion: nil)
    }
    
    
}
