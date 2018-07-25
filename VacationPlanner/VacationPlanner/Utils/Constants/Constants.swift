//
//  Constants.swift
//  VacationPlanner
//
//  Created by Danilo Bias Lago on 23/07/2018.
//  Copyright © 2018 Danilo Bias Lago. All rights reserved.
//

import UIKit

struct Constants {
    
    //MARK: URL's e métodos
    struct APIPreffix {
        static var urlPreffix: String = "http://localhost:8882"
    }
    
    struct URLPaths {
        static let barPath = "/"
    }
    
    struct CitiesMethods {
        static let getAllCities = "/cities"
        
    }
    
    struct WeatherMethods {
        static let getAllWeatherTypes = "/weather"
    }
    
    struct DailyClimateMethods {
        static let getCityDailyClimate = "/%@/year/%@"
    }
    
    struct APIUrls {
        static let getAllCitiesUrl = Constants.APIPreffix.urlPreffix + CitiesMethods.getAllCities + URLPaths.barPath
        static let getDailyClimatesUrl = Constants.APIPreffix.urlPreffix + CitiesMethods.getAllCities + DailyClimateMethods.getCityDailyClimate
        static let getAllWeatherTypesUrl = Constants.APIPreffix.urlPreffix + WeatherMethods.getAllWeatherTypes + URLPaths.barPath
    }
}
