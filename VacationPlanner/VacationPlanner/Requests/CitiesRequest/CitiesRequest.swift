//
//  CitiesRequest.swift
//  VacationPlanner
//
//  Created by Danilo Bias Lago on 23/07/2018.
//  Copyright © 2018 Danilo Bias Lago. All rights reserved.
//

import UIKit
import SwiftyJSON

class CitiesRequest: NSObject {

    static func getAllCities(withURL url: String, completion: @escaping(CitiesResponse?, Error?) -> Void) {
        BaseRequest.get(url) { (result) in
            if let data = result as? Data {
                
                let json: JSON = JSON(data)
                let citiesResponse: CitiesResponse = CitiesResponse(json: json)
                completion(citiesResponse, nil)
                
            }else if let error = result as? Error {
                completion(nil, error)
            }
        }
    }
}
