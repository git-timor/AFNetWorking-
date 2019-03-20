//
//  ZQHTTPManager+Extension.swift
//  封装AFNetWorking
//
//  Created by 周周旗 on 2019/3/20.
//  Copyright © 2019 ZQ. All rights reserved.
//

import Foundation

extension ZQHTTPManager{
    
    //这里可以封装接口
    func statusList(completion:@escaping (_ json:AnyObject?, _ isSuccess: Bool)->()) {
        let url = "https://api.weibo.com/2/statuses/home_timeline.json"
        tokenRequest(URLString: url, parameters: nil) { (json, isSuccess) in
            completion(json,isSuccess)
        }
    }
}
