//
//  BaseRequest.swift
//  VacationPlanner
//
//  Created by Danilo Bias Lago on 23/07/2018.
//  Copyright © 2018 Danilo Bias Lago. All rights reserved.
//

import UIKit
import Alamofire

class BaseRequest: NSObject {
    
    static let timeout: TimeInterval = 7.0
    
//    static let basicHeaders = [
//        "accept-language": "en",
//        "cache-control": "no-cache"
//    ]
    
    static var manager: SessionManager {
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = timeout
        return manager
    }
    
    static func get(_ url: String, _ parameters: Dictionary<String, Any>? = nil,  completion: @escaping(Any?) -> Void) {
        request(url.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) ?? url, method: .get, parameters: parameters, encoding: JSONEncoding.default).validate(statusCode: 200..<300).responseJSON { (response) in
//            print("GET: \(response.request?.url?.absoluteString ?? "")")
            
            //            print(response.request)  // original URL request
            //            print(response.response) // HTTP URL response
            //            print(response.data)     // server data
            //            print(response.result)   // result of response serialization
            //            print("Error: \(response.result.error)")
            
            
            switch response.result{
            case .success:
                completion(response.data)
                break
                
            case .failure(let error):
                completion(error)
                break
            }
        }
    }
    
    static func post(_ url: String, parameters: Dictionary<String, Any>? = nil, completion: @escaping(Any?) -> Void) {
        request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().response { (response) in
//            print("POST: \(response.request?.url?.absoluteString ?? "")")
            
            if let data = response.data {
                completion(data)
            }
            
            if let error = response.error {
                completion(error)
            }
        }
    }
}
