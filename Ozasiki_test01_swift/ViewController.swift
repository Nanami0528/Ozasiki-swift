//
//  ViewController.swift
//  Ozasiki_test01_swift
//
//  Created by nanami on 2016/01/03.
//  Copyright © 2016年 nanami. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var timeCountl:UILabel!
    @IBOutlet var hand:UIImageView!
    @IBOutlet var lefthand:UIImageView!
    @IBOutlet var tapview:UIView!
    @IBOutlet var scorel:UILabel!
    @IBOutlet var startButton:UIButton!
    @IBOutlet var countdown:UILabel!
    
    var timeCount:Double = 0
    var timer: NSTimer!
    var isTapped:Bool = false
    var isMultiTapped:Bool = false
    var ran: UInt32 = 0
    var tapCount:Int = 0
    var level:Double!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //centerhand.hidden = true
        
        //tap検知
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "view_Tapped")//tapGestureRecognizerの定数？作って
        tapGestureRecognizer.numberOfTouchesRequired = 1
        tapview.addGestureRecognizer(tapGestureRecognizer)//tapviewにaddする
        //二本指tap検知
        let multitapGestureRecognizer = UITapGestureRecognizer(target: self, action: "view_MultiTapped")
        multitapGestureRecognizer.numberOfTouchesRequired = 2
        tapview.addGestureRecognizer(multitapGestureRecognizer)
      
    }
    @IBAction func start(){
        //タイマーを動かす
        timer = NSTimer.scheduledTimerWithTimeInterval(self.level, target: self, selector: "up", userInfo: nil,
            repeats: true)
        timer.fire()
        startButton.hidden = true
    }

    func view_Tapped(){
        scorel.text = String(tapCount)
        isTapped = true
        print("true1　ワンタップ")
    }
    func view_MultiTapped(){
        scorel.text = String(tapCount)
        isMultiTapped = true
        print("true2　同時タップ")
    }
    func up(){
            timeCount = timeCount + 1
            timeCountl.text = String(timeCount)
        //乱数　表示ーーーーーーーーーーーー
        if timeCount<30 && ran==1 {
            print("1")

        }else if timeCount<30 && ran==0{
             print("0")
        }
        //乱数　表示ーーーーーーーーーーーー
        if tapCount==2{
            self .gameclear()
        }//１０でクリア画面へ
        if timeCount==1 {
            countdown.text = "3"
        } else if timeCount==2 {
            countdown.text = "2"
        } else if timeCount==3{
            countdown.text = "1"
        } else if timeCount==4{
            countdown.text = "始め"
        } else if timeCount==5{
            countdown.hidden = true
        }
        if timeCount<3  {
            UIView.animateWithDuration(
                0.7,
                delay:0.0,
                options:UIViewAnimationOptions.CurveEaseInOut,
                animations: {() -> Void in
                    self.hand.image = UIImage(named: "お座敷　手中間.png")
                    self.hand.transform = CGAffineTransformMakeScale(2.5, 2.5)
                    self.hand.transform = CGAffineTransformMakeScale(1.0, 1.0)
                    
                   
                },
                completion:{isSucceeded in
                    self.hand.center = self.lefthand.center
                    self.hand.image = UIImage(named: "お座敷　パー.png")
                }
            )
        }
        else if timeCount%2==1{
                if timeCount>4 {
                    if ran==0{
                        if isTapped == true {
                        tapCount=tapCount+1
                        }else{
                        self .gameover()
                        }
                    }
                    if ran==1{
                        if isMultiTapped == true{
                        tapCount=tapCount+1
                        }else{
                        self .gameover()
                        }
                    }
                }
            isTapped = false
            isMultiTapped = false
            ran = arc4random_uniform(2)
            if ran==0 {
                //アニメーション
                UIView.animateWithDuration(
                    level,
                    delay:0.0,
                    options:UIViewAnimationOptions.CurveEaseInOut,
                    animations: {() -> Void in
                        self.hand.image = UIImage(named: "手グー.png")
                        self.hand.transform = CGAffineTransformMakeScale(2.5, 2.5)
                        self.hand.center = self.view.center
                        self.hand.transform = CGAffineTransformMakeScale(1.0, 1.0)
                    },
                    completion:{(Bool) -> Void in
                        self.hand.center = self.lefthand.center
                    }
                )
            }else if(ran==1){
                UIView.animateWithDuration(
                    level,
                    delay:0.0,
                    options:UIViewAnimationOptions.CurveEaseInOut,
                    animations: {() -> Void in
                        self.hand.image = UIImage(named: "お座敷　パー.png")
                        self.hand.transform = CGAffineTransformMakeScale(2.5, 2.5)
                        self.hand.center = self.view.center
                        self.hand.transform = CGAffineTransformMakeScale(1.0, 1.0)
                    },
                    completion:{(Bool) -> Void in
                        self.hand.center = self.lefthand.center
                    }
                )
            }
            //アニメーション
        }//奇数
    }//３以上
    func gameover(){
        let targetView = self.storyboard!.instantiateViewControllerWithIdentifier( "gameover" )
        self.presentViewController( targetView as! GameoverViewController, animated: true, completion: nil)
    }
    func gameclear(){
        let targetView = self.storyboard!.instantiateViewControllerWithIdentifier( "gameclear" )
        self.presentViewController( targetView as! GameclearViewController, animated: true, completion: nil)
    }
}




