//
//  WordShowCtrler.swift
//  IdeaCheck
//
//  Created by Apple on 2019/3/16.
//  Copyright © 2019 lydsnm. All rights reserved.
//

import UIKit
import SnapKit

class WordShowCtrler: ICViewController {

    let showWords1 = "现在，要剧终散场了\r\n我的人生大幕就要落下\r\n朋友啊，有些话\r\n我要说清楚\r\n有些确定无疑的事，我要讲明白。"

    let showWords2 = "And now, the end is near.\nAnd so I face the final curtain.\nMy friend, I’ll say it clear;\nI’ll state my case, of which I’m certain.\n现在，要剧终散场了\n我的人生大幕就要落下\n朋友啊，有些话我要说清楚\n有些确定无疑的事，我要讲明白\n\nI’ve lived a life that’s full;\nI’ve traveled each and every highway;\nBut more, much more than this,\nI did it my way.\n我度过了充实的一生\n我走过了每一条道路\n可是不，远不止这些\n我是用自己的方式走过了人生的路"
    
    var lineSpaceSlider:UISlider?
    
    var lineSpace:Float = 5
    let fontSize = 18
    
    lazy var showLabel:UILabel = {
        var label = UILabel.init()
//        label
        guard let font = UIFont.init(name: "Tianshi-SunOld", size: CGFloat(fontSize)) else{
            print("font is nil")
            return label
        }
        label.font = font
        label.numberOfLines = 0
        label.text = showWords2
        return label
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    
        SetupView()
        
        
        
        
        
        
        
        
        PrintFontNames()
        
        
    }
    
    func SetupView(){
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(showLabel)
        self.showLabel.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
        }
        
        lineSpaceSlider = UISlider.init()
        lineSpaceSlider?.minimumValue = 0
        lineSpaceSlider?.maximumValue = 50
        lineSpaceSlider?.value = 5
        lineSpaceSlider?.isContinuous = true
        lineSpaceSlider?.addTarget(self, action: #selector(SliderSlide), for: UIControl.Event.valueChanged)
        self.view.addSubview(lineSpaceSlider!)
        lineSpaceSlider?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(self.view)
            make.left.equalTo(self.view).offset(20)
            make.right.equalTo(self.view).offset(-20)
            make.bottom.equalTo(self.view).offset(-20)
        })
        
        
        
    }
    
    @objc func SliderSlide(object:UISlider){
        
        let intSliderValue = Int(object.value)
        print("lineSpacing slider's value: \(intSliderValue)")
        let paraph = NSMutableParagraphStyle()
        //将行间距设置为28
        paraph.lineSpacing = CGFloat(intSliderValue)
        //样式属性集合
        let attributes = [NSAttributedString.Key.font:UIFont.init(name: "Tianshi-SunOld", size: CGFloat(fontSize)),
                          NSAttributedString.Key.paragraphStyle: paraph]
        showLabel.attributedText = NSAttributedString(string: showWords2, attributes: attributes as [NSAttributedString.Key : Any])
        
    }
    
    
    func PrintFontNames(){
        print("打印UIFont.familyNames")
        
        let fys = UIFont.familyNames
        for fy in fys {
            let fts = UIFont.fontNames(forFamilyName: fy)
            for ft in fts {
                print(ft)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
