//
//  TinderLoadingView.swift
//  Test
//
//  Created by Prajeet Shrestha on 5/17/16.
//  Copyright © 2016 com.javra.test. All rights reserved.
//

import UIKit
class RoundView:UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.bounds.width/2
        self.clipsToBounds = true
        
    }
}

class TinderLoadingView: UIView {
    @IBOutlet var view: UIView!
        let T = CGAffineTransformMakeScale(10 , 10)
    @IBOutlet weak var secondExpandingView: RoundView!
    @IBOutlet weak var firstExpandingView: RoundView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.load()
    }
    
    func load() {
        NSBundle.mainBundle().loadNibNamed("TinderLoadingView", owner: self, options: nil)
        self.view.frame = self.bounds
        self.addSubview(self.view)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.load()
    }
    
    func start() {
        UIView.animateWithDuration(2.5, delay: 0, options: [.Repeat, .CurveEaseIn], animations: {
            () -> Void in
            self.firstExpandingView.transform = self.T
            self.firstExpandingView.alpha = 0
            }, completion:nil)
        
        
        UIView.animateWithDuration(2.5, delay: 1.5, options: [.Repeat, .CurveEaseIn], animations: {
            () -> Void in
            self.secondExpandingView.transform = self.T
            self.secondExpandingView.alpha = 0
            }, completion:nil)
    }
    
    func stop(){
        self.firstExpandingView.layer.removeAllAnimations()
        delay(1.5) { () -> () in
             self.secondExpandingView.layer.removeAllAnimations()
        }
       
    }
    
}

