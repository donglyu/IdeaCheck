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
        
        Ideas = [CellNameModel(name: "name", jumpClass: WordShowCtrler.self)]
        
        
        
    }


}


extension ViewController{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ideaModel = Ideas[indexPath.row]
//        let vc = (ideaModel.jumpClass as UIViewController)
        let nac = UINavigationController.init(rootViewController: <#T##UIViewController#>)
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idea", for: indexPath)
        
        
        
        
        return cell
    }
    
    
}



struct CellNameModel {
    
    var name:NSString?
    
    var jumpClass:AnyClass
    
    
    
}

