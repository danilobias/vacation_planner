//
//  WeatherViewModel.swift
//  VacationPlanner
//
//  Created by Danilo on 24/07/2018.
//  Copyright © 2018 Danilo Bias Lago. All rights reserved.
//

import UIKit

protocol WeatherViewModelProtocol: ListProtocol {
    var response: WeatherResponse? { get }
    var responseDidChange: ((WeatherViewModelProtocol) -> Void)? { get set }
}

class WeatherViewModel: WeatherViewModelProtocol {
    
    // MARK: - Vars
    var response: WeatherResponse? {
        didSet{
            self.responseDidChange?(self)
        }
    }
    
    var responseDidChange: ((WeatherViewModelProtocol) -> Void)?
    
    // MARK: - Methods
    required init() {}
    
    // MARK: - Utils
    func numberOfRows() -> Int{
        return response?.wheaters?.count ?? 0
    }
    
    func getWeatherBy(index: Int) -> Weather {
        return response!.wheaters![index]
    }
    
    // MARK: - Request
    func getElement(completion: @escaping (Error?) -> Void) {
        let url: String = Constants.APIUrls.getAllWeatherTypesUrl
        
        WeatherRequest.getAllWeathers(withURL: url) { (weatherResponse, error) in
            if let allWeathers = weatherResponse {
                self.response = allWeathers
            }
            
            if let errorDetail = error {
                completion(errorDetail)
            }
        }
    }
}
