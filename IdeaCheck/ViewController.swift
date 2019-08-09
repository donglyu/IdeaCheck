//
//  ViewController.swift
//  IdeaCheck
//
//  Created by Apple on 2019/3/16.
//  Copyright © 2019 lydsnm. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    lazy var tableView:UITableView = {
        
        let _tableview = UITableView.init(frame: UIScreen.main.bounds)
        _tableview.delegate = self
        _tableview.dataSource = self
        _tableview.register(UITableViewCell.self, forCellReuseIdentifier: "idea")
        self.view.addSubview(_tableview)
        return _tableview
        
    }()
    
    var Ideas:Array<CellNameModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.backgroundColor = UIColor.white
            
        Ideas = [CellNameModel(name: "custom fonts demo", jumpClass: WordShowCtrler.self),
        CellNameModel(name: "iconfont demo", jumpClass: IconFontUseCtrler.self),
        CellNameModel(name: "pop in swift", jumpClass: PopAnimationCtrler.self),
        CellNameModel(name: "neon effect", jumpClass: NeonLightEffectCtrler.self)
        ]
        
        
        
    }


}


extension ViewController{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView .deselectRow(at: indexPath, animated: true)
        let ideaModel = Ideas[indexPath.row]
        
        // 根据类名来跳对应的VC。
        // --------- Way 1 ----------- //
//        guard let spaceName = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else {
//            print("获取命名空间失败")
//            return
//        }
//        let vcClass: AnyClass? = NSClassFromString(spaceName + "." + "ideaModel.jumpClass")
//        guard let typeClass = vcClass as? UIViewController.Type else {
//            print("vcClass不能当做UIViewController")
//            return
//        }
        
//        let myVC = typeClass.init()
        //        let vc = (ideaModel.jumpClass as UIViewController)
//        let nac = UINavigationController.init(rootViewController: myVC)
//        self.present(nac, animated: true, completion: nil)
        
        // --------- Way 2 ----------- //
        
        let className:String=NSStringFromClass(ideaModel.jumpClass)
        
        if let classType = NSClassFromString(className) as? UIViewController.Type {
            
            let vc = classType.init()
            let nac = ICNavigationController.init(rootViewController: vc)
            self.present(nac, animated: true, completion: nil)
            return;
        }
        
        
        // ------- 附 -----------//
        /*
         如果是不继承于NSObject的类
         let classType :AnyClass= type(of:实例)
         if let type =classTypeas?类型.Type{
         let temp =  type.init())
         }
         
         */
        
        

        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Ideas.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idea", for: indexPath)
        let ideaModel = Ideas[indexPath.row]
        cell.textLabel?.text = ideaModel.name as String?;
        
        
        return cell
    }
    
    
}



struct CellNameModel {
    
    var name:NSString?
    
    var jumpClass:AnyClass
    
    
    
}

