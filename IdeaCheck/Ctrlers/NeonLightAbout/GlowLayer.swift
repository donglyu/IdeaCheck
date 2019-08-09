//
//  GlowLayer.swift
//  IdeaCheck
//
//  Created by donglyu on 2019/8/5.
//  Copyright © 2019 lydsnm. All rights reserved.
//

import UIKit

class GlowLayer: CALayer {

    
    var glowColor:UIColor? = UIColor.red
    weak var addedGlowView:UIView?
    var timer:DispatchSourceTimer?
    
    var glowRadius:NSNumber? = NSNumber.init(value: 8.0)
    var glowOpacity:NSNumber? =  NSNumber.init(value: 0.8)
    
    var _glowDuration:NSNumber?
    var glowDuration:NSNumber? {
        get{
            if (_glowDuration == nil) || (_glowDuration?.floatValue)! < 0.0 {
                _glowDuration = NSNumber.init(value: 1.0) as NSNumber
            }
            return _glowDuration
        }
        set{
            _glowDuration = newValue
        }
    }
    /** 不显示辉光时间 */
    var hideDuration:NSNumber? = NSNumber.init(value: 0.5)
    var glowAnimationDuration:NSNumber? = NSNumber.init(value: 1)
    
    
    override init() {
        super.init()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func CreateGlowLayerWithView(view:UIView, glowColor:UIColor){
        self.glowColor = glowColor
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, UIScreen.main.scale)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        
        let bPath = UIBezierPath.init(rect: view.bounds)
        self.glowColor?.setFill()
        bPath.fill(with: .sourceAtop, alpha: 1)
        self.frame = view.bounds
        self.contents = UIGraphicsGetImageFromCurrentImageContext()?.cgImage
        self.opacity = 0.0
        self.shadowOpacity = 1.0
        
        self.shadowOffset = CGSize.zero
        UIGraphicsEndImageContext()
        
        // weak
        self.addedGlowView = view
    }
    
    // TODO: - to do
    func ShowGlow(){
        self.shadowColor = self.glowColor?.cgColor
        self.shadowRadius = CGFloat(self.glowRadius!.floatValue)
        
        let animation = CABasicAnimation.init(keyPath: "opacity")
        animation.fromValue = 0
        animation.toValue = self.glowOpacity
        animation.duration = self.glowAnimationDuration!.doubleValue
    
        self.opacity = self.glowOpacity!.floatValue
        
        self.add(animation, forKey: nil)
        
        
        
    }
    
    func HideGlow(){
        self.shadowColor = self.glowColor?.cgColor
        self.shadowRadius = CGFloat(self.glowRadius!.floatValue)
        let animation = CABasicAnimation.init(keyPath: "opacity")
        animation.fromValue = self.glowOpacity
        animation.toValue = 0
        animation.duration = self.glowAnimationDuration!.doubleValue
        
        self.opacity = self.glowOpacity!.floatValue
        
        self.add(animation, forKey: nil)
    }
    
    func StartGlowAnimation(){
        
        let cycleTime = self.glowAnimationDuration!.floatValue * 2 + self.glowDuration!.floatValue  + self.hideDuration!.floatValue
        let delayTime = self.glowAnimationDuration!.floatValue + self.glowDuration!.floatValue
        
        timer = DispatchSource.makeTimerSource()
        timer?.schedule(deadline: DispatchTime.now(), repeating: DispatchTimeInterval.seconds(Int(cycleTime)), leeway: DispatchTimeInterval.microseconds(10))
        self.timer?.setEventHandler(handler: {
            DispatchQueue.main.sync {
                self.ShowGlow()
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + TimeInterval.init(exactly: delayTime)!, execute: {
                    self.HideGlow()
                })
            }
        })
        
        timer?.resume()
    }
    
    func PauseGlowAnimation(){
        self.removeFromSuperlayer()
        
    }
    
    func ReStareGlowAnimation(){
        self.addedGlowView?.layer .addSublayer(self)
        StartGlowAnimation()
    }
    
    
    
}
