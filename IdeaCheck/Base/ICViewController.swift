//
//  ICViewController.swift
//  IdeaCheck
//
//  Created by Apple on 2019/3/18.
//  Copyright © 2019 lydsnm. All rights reserved.
//

import UIKit

class ICViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.leftBarButtonItem =
            UIBarButtonItem.init(title: "back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(clickNaviBack))
            //UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.fastForward, target: self, action: #selector(clickNaviBack))
    }
    

    @objc func clickNaviBack(){
        if self.navigationController?.viewControllers.count == 1 {
            self .dismiss(animated: true) {
                
            }
        }else{
            self.navigationController?.popViewController(animated: true)
        }
        
    }

}
