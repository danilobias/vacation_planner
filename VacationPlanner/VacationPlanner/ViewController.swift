//
//  ViewController.swift
//  VacationPlanner
//
//  Created by Danilo Bias Lago on 23/07/2018.
//  Copyright © 2018 Danilo Bias Lago. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.getAllCitiesTest()
    }
    
    // MARK: - Request
    func getAllCitiesTest() {
        let url: String = Constants.APIUrls.getAllCitiesUrl
        CitiesRequest.getAllCities(withURL: url) { (citiesResponse, error) in
            if let cities = citiesResponse {
                if let citiesArray = cities.cities {
                    for city in citiesArray {
                        print("Name: \(city.stateAcronym)")
                    }
                }
            }
        }
    }

    // MARK: - Memory
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

