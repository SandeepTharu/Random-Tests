//
//  ViewController.swift
//  Test
//
//  Created by Prajeet Shrestha on 5/17/16.
//  Copyright © 2016 com.javra.test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var myView: UIView!
    @IBOutlet weak var l: TinderLoadingView!
    
    @IBOutlet var tinders: [TinderLoadingView]!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
     

        self.anime()
        
    }
    
    
    func anime(){
        
        let abf = Int(arc4random_uniform(UInt32(20)))
        
        for (index,tin) in self.tinders.enumerate(){
            
            
            if tinders[index] == self.tinders[abf]{
                 tin.start()
                
                delay(2, closure: { () -> () in
                       
                        self.anime()
                        
                        
                })
                delay(5, closure: { () -> () in
                    tin.stop()
                })
            }
            
        }
        
    }
}



func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
