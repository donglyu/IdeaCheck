//
//  PopAnimationCtrler.swift
//  IdeaCheck
//
//  Created by donglyu on 2019/7/31.
//  Copyright © 2019 lydsnm. All rights reserved.
//  facebook/pop use demo
//  5 steps to use pop: https://github.com/maxmyers/FacebookPop
//  some other animations can be used in daily projects.

import UIKit
import pop

class PopAnimationCtrler: ICViewController,POPAnimatorDelegate {

    
    

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var triggerBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    /** 5 steps to use pop animations. see more in https://github.com/maxmyers/FacebookPop */
    @IBAction func tapTriggerBtn(_ sender: Any) {
        
        let basicAnimation = POPSpringAnimation.init()
        basicAnimation.property = POPAnimatableProperty.property(withName: kPOPViewBounds) as? POPAnimatableProperty
        
        basicAnimation.toValue = NSValue.init(cgRect: CGRect.init(x: 0, y: 0, width: 130, height: 130))
        basicAnimation.name = "any animation name you want"
        basicAnimation.delegate = self
        
        self.imageView.pop_add(basicAnimation, forKey: "WhatEverNameYouWant")
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            // self.imageView.pop_removeAllAnimations()
            self.imageView.pop_removeAnimation(forKey: "WhatEverNameYouWant")
        }
        
    }

    // pop other animations.
    @IBAction func tapTrigger2Btn(_ sender: Any) {
        
        
    }
    
 
    
}

extension PopAnimationCtrler{
    
    
    func animatorWillAnimate(_ animator: POPAnimator!) {
        print("animator will animate: \(animator.debugDescription)")
    
    }
    
    func animatorDidAnimate(_ animator: POPAnimator!) {
        print("animator did animate")
    }
}
