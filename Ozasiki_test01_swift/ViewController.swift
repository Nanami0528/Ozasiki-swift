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
   // @IBOutlet var centerhand:UIImageView!
    @IBOutlet var tapview:UIView!


    
    var timeCount:Double = 0
    var timer: NSTimer!
    var isTapped:Bool = false
    var isMultiTapped:Bool = false
    var ran: UInt32 = 0

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        //centerhand.hidden = true
        
        //tap検知
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "view_Tapped")//tapGestureRecognizerの定数？作って
        tapGestureRecognizer.numberOfTouchesRequired = 1
        tapview.addGestureRecognizer(tapGestureRecognizer)//tapviewにaddする
        
        //二本指tap検知
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: "view_Tapped2")
        tapGestureRecognizer2.numberOfTouchesRequired = 2
        tapview.addGestureRecognizer(tapGestureRecognizer2)

        
      
    }
    
    
    
    
    @IBAction func start(){
        //タイマーを動かす
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "up", userInfo: nil,
            repeats: true)
        timer.fire()
        
    }
    
    
    
    func view_Tapped(){

       isTapped = true
        print("true1　ワンタップ")
        
    }
    func view_Tapped2(){
        
        
        isMultiTapped = true
        print("true2　同時タップ")
        
    }
    
    
    
    func up(){                                                                        //タイマー
        timeCount = timeCount + 1
        timeCountl.text = String(timeCount)
        //let ran = arc4random_uniform(2)


      if timeCount<30 && ran==1 {
            print("1")

        }else if timeCount<30 && ran==0{
             print("0")
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
            
        }else if timeCount%2==0 {
            
            
            
   
        }else if timeCount%2==1{
            
            
            ran = arc4random_uniform(2)
            
            if ran==0 {
                
                
//--------------------------------------グーのアニメーション---はじめ-----------------------------------------
                UIView.animateWithDuration(
                    0.9,
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
//--------------------------------------グーのアニメーション---おわり-----------------------------------------
            }else if(ran==1){
                UIView.animateWithDuration(
                    0.8,
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
        }//奇数
        
        
        
        
    }//３以上
    
    
    func gameover(){
        
let targetView = self.storyboard!.instantiateViewControllerWithIdentifier( "gameover" )
        self.presentViewController( targetView as! GameoverViewController, animated: true, completion: nil)
        
    }

    
}



//[半分の距離ってどう書くん？　completionでかかなあかんやつの区別は？]


/*UIView.animateWithDuration(
0.8,
delay:0.0,
options:UIViewAnimationOptions.CurveEaseInOut,
animations: {() -> Void in

self.hand.transform = CGAffineTransformMakeScale(2.5, 2.5)
self.hand.center = self.view.center
self.hand.transform = CGAffineTransformMakeScale(1.0, 1.0)

},
completion:{(Bool) -> Void in

//self.hand.center = self.lefthand.center
}
)

*/



