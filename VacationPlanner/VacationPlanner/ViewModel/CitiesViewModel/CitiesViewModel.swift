//
//  CitiesViewModel.swift
//  VacationPlanner
//
//  Created by Danilo on 24/07/2018.
//  Copyright © 2018 Danilo Bias Lago. All rights reserved.
//

import UIKit

protocol CitiesViewModelProtocol: ListProtocol {
    var response: CitiesResponse? { get }
    var responseDidChange: ((CitiesViewModelProtocol) -> Void)? { get set }
}

class CitiesViewModel: CitiesViewModelProtocol {
    
    // MARK: - Vars
    var response: CitiesResponse? {
        didSet{
            self.responseDidChange?(self)
        }
    }
    
    var responseDidChange: ((CitiesViewModelProtocol) -> Void)?
    
    // MARK: - Methods
    required init() {}
    
    
    // MARK: - Utils
    func numberOfRows() -> Int{
        return response?.cities?.count ?? 0
    }
    
    func getCityBy(index: Int) -> City {
        return response!.cities![index]
    }
    
    // MARK: - Request
    func getElement(completion: @escaping (Error?) -> Void) {
        let url: String = Constants.APIUrls.getAllCitiesUrl
        CitiesRequest.getAllCities(withURL: url) { (citiesResponse, error) in

            if let allCities = citiesResponse {
                self.response = allCities
            }
            
            if let errorDetail = error {
                completion(errorDetail)
            }
        }
    }
}
