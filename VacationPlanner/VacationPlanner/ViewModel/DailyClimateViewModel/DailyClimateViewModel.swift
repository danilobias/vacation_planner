//
//  DailyClimateViewModel.swift
//  VacationPlanner
//
//  Created by Danilo on 24/07/2018.
//  Copyright © 2018 Danilo Bias Lago. All rights reserved.
//

import UIKit

protocol DailyClimateViewModelProtocol: ListProtocol {
    var response: DailyClimateResponse? { get }
    var responseDidChange: ((DailyClimateViewModelProtocol) -> Void)? { get set }
}

class DailyClimateViewModel: DailyClimateViewModelProtocol {
    
    // MARK: - Vars
    var response: DailyClimateResponse? {
        didSet{
            self.responseDidChange?(self)
        }
    }
    
    var responseDidChange: ((DailyClimateViewModelProtocol) -> Void)?
    
    var cityID: String = ""
    var year: String = ""
    var selectedWeathers: [Weather]!
    
    // MARK: - Methods
    required init() {}
    
    // MARK: - Utils
    func numberOfRows() -> Int {
        return response?.climates?.count ?? 0
    }
    
    func getWeatherBy(index: Int) -> DailyClimate {
        return response!.climates![index]
    }
    
    // MARK: - Request
    func getElement(completion: @escaping (Error?) -> Void) {
        let url: String = String(format: Constants.APIUrls.getDailyClimatesUrl, cityID, year)
        print("URL \(url)")
        
//        WeatherRequest.getAllWeathers(withURL: url) { (weatherResponse, error) in
//            if let allWeathers = weatherResponse {
//                self.response = allWeathers
//            }
//
//            if let errorDetail = error {
//                completion(errorDetail)
//            }
//        }
    }
}
