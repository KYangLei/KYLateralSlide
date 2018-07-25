//
//  RightViewController.swift
//  KYLateralSlideDemo
//
//  Created by Kuroba.Lei on 2018/7/25.
//  Copyright © 2018年 K.Lei. All rights reserved.
//

import UIKit

class RightViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        
        self.view.backgroundColor = UIColor.white
        let imgView = UIImageView.init(frame: self.view.bounds)
        imgView.image = UIImage.init(named: "1.JPG")
        self.view.addSubview(imgView)
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    deinit {
        print( NSStringFromClass(self.classForCoder) + " 销毁了---->")
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
