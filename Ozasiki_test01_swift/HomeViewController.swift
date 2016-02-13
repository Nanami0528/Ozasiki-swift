//
//  HomeViewController.swift
//  Ozasiki_test01_swift
//
//  Created by nanami on 2016/01/31.
//  Copyright © 2016年 nanami. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func level1(){
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("main") as! ViewController
        vc.level = 1
        self.presentViewController(vc, animated: true, completion: nil)
    }
    @IBAction func level2(){
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("main") as! ViewController
        vc.level = 0.8
        self.presentViewController(vc, animated: true, completion: nil)
    }
}
