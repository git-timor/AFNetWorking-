//
//  ViewController.swift
//  封装AFNetWorking
//
//  Created by 周周旗 on 2019/3/20.
//  Copyright © 2019 ZQ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()        
        //调用请求
        ZQHTTPManager.shared.statusList { (json, isSuccess) in
            print("此处为请求数据\(String(describing: json))")
        }
    }

    

}

