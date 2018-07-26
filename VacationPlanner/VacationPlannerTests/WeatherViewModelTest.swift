//
//  WeatherViewModelTest.swift
//  VacationPlannerTests
//
//  Created by Danilo on 26/07/2018.
//  Copyright © 2018 Danilo Bias Lago. All rights reserved.
//

import XCTest
import Quick
import Nimble
import SwiftyJSON

@testable import VacationPlanner

class WeatherViewModelTest: QuickSpec {
    
    override func spec() {
        describe("WeatherViewModel") {
            
            context("after class initialization") {
                let weatherViewModel: WeatherViewModel = WeatherViewModel()
                
                it("should not be nil") {
                    expect(weatherViewModel).notTo(beNil())
                }
            }
            
            context("after receive a valid value from API (response)") {
                let weatherViewModel: WeatherViewModel = WeatherViewModel()
                weatherViewModel.response = WeatherResponse(json: JSON())
                
                it("should be a WeatherResponse") {
                    expect(weatherViewModel.response).to(beAKindOf(WeatherResponse.self))
                }
                
                it("should not be nil to WeatherResponse") {
                    expect(weatherViewModel.response).notTo(beNil())
                }
                
                it("should be nil to responseDidChange") {
                    expect(weatherViewModel.responseDidChange).to(beNil())
                }
            }
            
            context("after receive a invalid value from API (error)") {
                let weatherViewModel: WeatherViewModel = WeatherViewModel()
                
                it("should be a DailyClimateResponse") {
                    expect(weatherViewModel.response).to(beNil())
                }
                
                it("should be nil to responseDidChange") {
                    expect(weatherViewModel.responseDidChange).to(beNil())
                }
            }
        }
    }
}
