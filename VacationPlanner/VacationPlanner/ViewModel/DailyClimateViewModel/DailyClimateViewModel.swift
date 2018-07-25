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
    var response: DailyClimateResponse?
//    {
//        didSet{
//            self.responseDidChange?(self)
//        }
//    }
    
    var responseDidChange: ((DailyClimateViewModelProtocol) -> Void)?
    
    var cityID: String = ""
    var fullDate: String = ""
    var days: String = ""
    var selectedWeathers: [Weather]!    
    
    var climates: [DailyClimate]!
    
    // MARK: - Methods
    required init() {}
    
    // MARK: - Utils
    func numberOfRows() -> Int {
        return response?.climates?.count ?? 0
    }
    
    func getDailyClimateBy(index: Int) -> DailyClimate {
        return response!.climates![index]
    }
    
    func filterByClimate () {
        self.climates = []
        
        if let results: [DailyClimate] = self.response?.climates {
            if let dateToCompare: Date = DateUtils.getDateFromString(strDate: fullDate) {
                let daysInt: Int = Int(days)!
                for weather in selectedWeathers {
                    let filteredResults: [DailyClimate] = results.filter({$0.weather! == weather.name!})
                    let filteredByDate:  [DailyClimate] = filteredResults.filter({$0.date! >= dateToCompare && ($0.date?.days(from: dateToCompare))! >= daysInt})
                    self.climates.append(contentsOf: filteredByDate)
                }
            }
        }
        
        print("CLIMATES \(self.response?.climates?.count)")
        print("CLIMATES \(climates.count)")
        self.responseDidChange?(self)
    }
    
    // MARK: - Request
    func getElement(completion: @escaping (Error?) -> Void) {
        let formattedYear: String = DateUtils.getYearFrom(strDate: fullDate)
        let url: String = String(format: Constants.APIUrls.getDailyClimatesUrl, cityID, formattedYear)
        print("URL \(url)")
        
        DailyClimateRequest.getDailyClimate(withURL: url) { (climatesResponse, error) in
            
            if let climates = climatesResponse {
                self.response = climates
                self.filterByClimate()
            }
            
            if let errorDetail = error {
                completion(errorDetail)
            }
        }
    }
}
