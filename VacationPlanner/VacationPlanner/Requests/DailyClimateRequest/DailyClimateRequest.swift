//
//  DailyClimateRequest.swift
//  VacationPlanner
//
//  Created by Danilo on 25/07/2018.
//  Copyright © 2018 Danilo Bias Lago. All rights reserved.
//

import UIKit
import SwiftyJSON

class DailyClimateRequest: NSObject {

    static func getDailyClimate(withURL url: String, completion: @escaping(DailyClimateResponse?, Error?) -> Void) {
        BaseRequest.get(url) { (result) in
            if let data = result as? Data {
                
                let json: JSON = JSON(data)
                let dailyClimateResponse: DailyClimateResponse = DailyClimateResponse(json: json)
                completion(dailyClimateResponse, nil)
                
            }else if let error = result as? Error {
                completion(nil, error)
            }
        }
    }
}
