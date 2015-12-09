//
//  ViewController.swift
//  Maze
//
//  Created by yuki takei on 2015/11/13.
//  Copyright © 2015年 yuki takei. All rights reserved.
//

import UIKit
import CoreMotion


class ViewController: UIViewController {

    @IBOutlet weak var redRect: UIView!
    
    let motionManager = CMMotionManager()
    
    @IBOutlet weak var LoginText: UITextField!
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //60Hz（1秒間に60回）の値の通知感覚
//        motionManager.accelerometerUpdateInterval = 1.0 / 60.0
        
        //角度===================================================
        motionManager.deviceMotionUpdateInterval = 1.0/60.0
        motionManager.startDeviceMotionUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler:
            {
                (deviceMotion:CMDeviceMotion?,error:NSError?) in
       //     print(deviceMotion?.description)

        
         // 加速度の開始　View:motion ===========================
//        motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: {(accelerometerData:CMAccelerometerData?,error:NSError?) in
//            print(accelerometerData?.description)
//            
            let fromX = self.redRect.center.x
            let fromY = self.redRect.center.y
                
            
//            let lenX = CGFloat(accelerometerData!.acceleration.x)*10
//            let lenY = CGFloat(accelerometerData!.acceleration.y * -1)*10
//            
//            let toX = formX + lenX
//            let toY = formY + lenY
//            self.redRect.center = CGPointMake(toX, toY)
                
                
                
                
            let xAngle = 180 * deviceMotion!.attitude.roll / M_PI
            let yAngle = 180 * deviceMotion!.attitude.pitch / M_PI
                
            let lenX = CGFloat(xAngle)
            let lenY = CGFloat(yAngle)
                
            let width = self.view.frame.size.width
            let height = self.view.frame.size.height
            
            var toX = fromX + lenX
            var toY = fromY + lenY
            
                if toX < 0{
                    print("x<0")
                }
                
//            print("x軸角度：\(xAngle)")
//            print("y軸角度：\(yAngle)")
            self.redRect.center = CGPointMake(toX, toY)
                
            
            
            
            }
        )
       
       
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func doMove(sender: AnyObject) {
        print("pushButton")
        print("座標before:\(redRect.center)")
        
        let x = redRect.center.x + 10
        let y = redRect.center.y
        
        let newPoint = CGPointMake(x, y);
        redRect.center = newPoint
        
    }


}

