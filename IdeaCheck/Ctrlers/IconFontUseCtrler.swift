//
//  IconFontUseCtrler.swift
//  IdeaCheck
//
//  Created by Apple on 2019/3/26.
//  Copyright © 2019 lydsnm. All rights reserved.
//

import UIKit
import SnapKit


/**
 iconFont.ttf中包含的图标。
 首页
 &#xe73d;
 
 药品
 &#xe73f;
 
 消息
 &#xe740;
 
 用药
 &#xe741;
 
 喜欢
 &#xe742;
 
 
 */

class IconFontUseCtrler: ICViewController {

    var egImageview1 :UIImageView = UIImageView.init()
    var egImageview2 :UIImageView = UIImageView.init()
    var egImageview3 :UIImageView = UIImageView.init()
    
    
    var label1: UILabel = UILabel.init()
    var label2: UILabel = UILabel.init()
    var label3: UILabel = UILabel.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        egImageview1.backgroundColor = UIColor.purple
//        egImageview2.backgroundColor = UIColor.cyan
//        egImageview3.backgroundColor = UIColor.orange
//
//        self.view.addSubview(egImageview1)
//        self.view.addSubview(egImageview2)
//        self.view.addSubview(egImageview3)
//
//        egImageview1.snp.makeConstraints { (make) in
//            make.centerX.equalTo(self.view)
//            make.centerY.equalTo(self.view.snp.top).offset(150)
//            make.width.height.equalTo(50)
//        }
//        egImageview2.snp.makeConstraints { (make) in
//            make.centerX.equalTo(self.view)
//            make.centerY.equalTo(egImageview1.snp.bottom).offset(50)
//            make.width.height.equalTo(50)
//        }
//        egImageview3.snp.makeConstraints { (make) in
//            make.centerX.equalTo(self.view)
//            make.centerY.equalTo(egImageview2.snp.bottom).offset(50)
//            make.width.height.equalTo(50)
//        }
        
        
        
        label1.font =  UIFont.init(name: "iconFont", size: 30)
        label1.text = "\u{e73d}" //OC语言：@"U0000e645"   //注意：编码查看点击下载文件夹中的demo_unicode.html查看
        label1.textColor = .purple
        self.view.addSubview(label1)
        label1.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
        }
        
        label1.backgroundColor = UIColor.colorWithRGBA(r: 100, g: 200, b: 140, a: 0.6)
        
    }
    
    
    // MARK: Eg1.转化为UIImage来使用
    
    func UseAsImage()->UIImage{
        
        let code = "e73d"
        let fontSize = 17
        let nscode = code as NSString
        let rect = nscode.boundingRect(with:CGSize(width: 0.0, height: 0.0) , options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font :  UIFont(name: "IconFont", size: CGFloat(fontSize))!], context: nil)
        let size = rect.size
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        label.font = UIFont(name: "IconFont", size: CGFloat(fontSize))
        label.textAlignment = .center
        label.text = code
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        label.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        return image!
        
    }
    
    // MARK: Eg2.用作w文字w方式
    
    func UseAsText(){
        let label = UILabel(frame: CGRect(x: 50, y: 60, width: 250, height: 50))
        label.font =  UIFont.init(name: "iconFont", size: 20)
        label.text = "\u{e73d}" //OC语言：@"U0000e645"   //注意：编码查看点击下载文件夹中的demo_unicode.html查看
        label.textColor = .gray
        self.view.addSubview(label)
        
    }
    
    // MARK: Eg3.或者用三方封装好了的方法，比如:LFIconFont
    // https://github.com/yumengqing/LFIconFont


}
