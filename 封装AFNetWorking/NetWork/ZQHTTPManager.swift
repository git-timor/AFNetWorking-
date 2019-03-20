//
//  ZQHTTPManager.swift
//  封装AFNetWorking
//
//  Created by 周周旗 on 2019/3/20.
//  Copyright © 2019 ZQ. All rights reserved.
//

import UIKit
import AFNetworking

enum ZQHTTPMethod {
    case GET
    case POST
}

class ZQHTTPManager: AFHTTPSessionManager {
   // 1. 创建单例。
    static let shared = ZQHTTPManager()
    
   //3. 创建 access_token
    let access_token :String? = "2.00_HMFNDB1YcNDca116293cd01ZtyF"
    
    // 3.1 创建tokenRequest 方法， 一般除了登录都会调用此方法
    func tokenRequest(method:ZQHTTPMethod = .GET, URLString: String, parameters: [String: AnyObject]?,completion:@escaping (_ json: AnyObject?,_ isSuccess: Bool)->()) {
        //3.11 判断access_tokenf是否存在，不存在退出请求
        guard let access_token = access_token else {
            /// FIXME 若access_token为空， 此处通知调用重新登录
            return
        }
        var parameters = parameters
        
        if parameters == nil {
            parameters = [String: AnyObject]()
        }
        parameters!["access_token"]  = access_token as AnyObject
        
        //调用真正的请求
        request(method: method, URLString: URLString, parameters: parameters, completion: completion)
    }
    
    // 2. 创建request方法，满足调用get/post
    func request(method:ZQHTTPMethod = .GET, URLString: String, parameters: [String: AnyObject]?,completion:@escaping (_ json: AnyObject?,_ isSuccess: Bool)->())  {
        
        // 2.1 创建sccess /failure 闭包回调
        let success = { (task: URLSessionDataTask, json: Any?) -> () in
            completion(json as AnyObject,true)
        }
        
        let faliure = { (task: URLSessionDataTask?, error: Error) ->() in
            
            if (task?.response as! HTTPURLResponse).statusCode == 403 {
                // FIXME 判断此处的task是否为403，403代表验证不通过，需要重新登录
            }            
            print("statusCode\((task?.response as! HTTPURLResponse).statusCode)")
            completion(nil ,false)
        }
        // 2.2 判断ZQHTTPMethod方法分别调用 get / post
        if method == .GET {
           get(URLString, parameters: parameters, progress: nil, success: success, failure: faliure)
        }else{
            post(URLString, parameters: parameters, progress: nil, success: success, failure: faliure)
        }
        
        
    }
}
