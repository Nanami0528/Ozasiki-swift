//
//  GameoverViewController.swift
//  Ozasiki_test01_swift
//
//  Created by nanami on 2016/01/30.
//  Copyright © 2016年 nanami. All rights reserved.
//

import UIKit

class GameoverViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func backToHome(){
        let targetView = self.storyboard!.instantiateViewControllerWithIdentifier( "home" )
        self.presentViewController( targetView as! HomeViewController, animated: true, completion: nil)
        
    }
}

