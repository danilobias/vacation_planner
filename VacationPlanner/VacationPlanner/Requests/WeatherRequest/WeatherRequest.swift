//
//  WeatherRequest.swift
//  VacationPlanner
//
//  Created by Danilo on 24/07/2018.
//  Copyright © 2018 Danilo Bias Lago. All rights reserved.
//

import UIKit
import SwiftyJSON

class WeatherRequest: NSObject {
   
    static func getAllWeathers(withURL url: String, completion: @escaping(WeatherResponse?, Error?) -> Void) {
        BaseRequest.get(url) { (result) in
            if let data = result as? Data {
                
                let json: JSON = JSON(data)
                let wheatersResponse: WeatherResponse = WeatherResponse(json: json)
                completion(wheatersResponse, nil)
                
            }else if let error = result as? Error {
                completion(nil, error)
            }
        }
    }
}
