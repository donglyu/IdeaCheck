//
//  NeonLightEffectCtrler.swift
//  IdeaCheck
//
//  Created by donglyu on 2019/8/3.
//  Copyright © 2019 lydsnm. All rights reserved.
//

import UIKit

class NeonLightEffectCtrler: ICViewController {
    // 1.对图片进行荧光，好像不明显
    @IBOutlet weak var neonImageView: UIImageView!
    
    // 2.普通文字荧光
    @IBOutlet weak var neonLabel: GlowLabel!
    
    // 3.有荧光动画的文字
    @IBOutlet weak var neonAnimLabel: UILabel!
    
    // 4.荧光笔View
    var paintView:PaintView = PaintView.init(frame: UIScreen.main.bounds)
   
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black
        // Do any additional setup after loading the view.
        
        neonImageView.layer.shadowColor = UIColor.black.cgColor
            //UIColor.colorWithHex(hex: "ED662c").cgColor
        neonImageView.layer.shadowOffset = CGSize.init(width: 0, height: 0)
        neonImageView.layer.shadowRadius = 100
        neonImageView.layer.shadowOpacity = 1
        neonImageView.layer.masksToBounds = false
        neonImageView.clipsToBounds = false
        
    
        
        
        view.addSubview(paintView)
        
        
        self.neonAnimLabel.AddGlowLayerWithGlowColor(glowColor: UIColor.red)
        self.neonAnimLabel.glowLayer?.ShowGlow()
        self.neonAnimLabel.glowLayer?.StartGlowAnimation()
    }

}

// MARK: - 荧光笔效果View
class PaintView: UIView{
    
    // 下方的代码是第一种方法。 另一种方法是创建一个新的CAShapeLayer,并通过将其设置为path属性来绘制路径.这将很容易让你添加一个只影响你的路径的阴影.
    var pathsArrayM = NSMutableArray.init()
    var temp = NSMutableArray.init()
    
    override func draw(_ rect: CGRect) {
        
        for bez in pathsArrayM {
            let perPath = bez as! UIBezierPath
            
            UIColor.red.set()
            (bez as! UIBezierPath).stroke()

        
            let context = UIGraphicsGetCurrentContext()
            context?.addPath(perPath.cgPath)
            context?.setLineWidth(2.0)
            context?.setBlendMode(.normal)
            context?.setShadow(offset: CGSize.init(width: 0, height: 0), blur: 9.0, color: UIColor.blue.cgColor)
            context?.strokePath()
            
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let point = touch?.location(in: touch?.view)
        let path = UIBezierPath.init()
        path .move(to: point!)
        path.lineCapStyle = .round
        path.lineJoinStyle = .round
        path.lineWidth = 3
        
        self.pathsArrayM.add(path)
        
        
    }
    
    // 画的线设置下阴影就可以了,荧光效果就是一个实心的线和这条线的阴影,一般是白色的线,彩色的阴影
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //        UITouch *touch = touches.anyObject;
        //        CGPoint locp2 = [touch locationInView:touch.view];
        //        [self.arrM.lastObject addLineToPoint:locp2];
        //        [self setNeedsDisplay];
        
        let touch = touches.first
        let locp2 = touch?.location(in: touch?.view)
        let path:UIBezierPath = self.pathsArrayM.lastObject as! UIBezierPath
        path.addLine(to: locp2!)
        self.setNeedsDisplay()
    }
    

}



// MARK: - extension for uiview
var _recognizerGlowLayer = "_recognizerGlowLayer"

extension UIView{
    
    var glowLayer: GlowLayer? {
        get {
            return (objc_getAssociatedObject(self, &_recognizerGlowLayer) as? GlowLayer)
        }
        set(newValue) {
            objc_setAssociatedObject(self, &_recognizerGlowLayer, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }

    
    
    
    func AddGlowLayerWithGlowColor(glowColor:UIColor){
        if let layer = self.glowLayer {
            layer.CreateGlowLayerWithView(view: self, glowColor: glowColor)
            self.layer.addSublayer(layer)
        }else{
            self.glowLayer = GlowLayer.init()
            self.glowLayer!.CreateGlowLayerWithView(view: self, glowColor: glowColor)
            self.layer.addSublayer(self.glowLayer!)
        }
    }
    
    func RemoveGlowLayerFromSuperlayer(){
        self.glowLayer?.removeFromSuperlayer()
        self.glowLayer = nil
    }
    
    
}

