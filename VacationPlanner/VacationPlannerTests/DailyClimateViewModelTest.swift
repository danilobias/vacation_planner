//
//  DailyClimateViewModelTest.swift
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

class DailyClimateViewModelTest: QuickSpec {

    override func spec() {
        describe("DailyClimateViewModel") {
            
            context("after class initialization") {
                let dailyClimateViewModel: DailyClimateViewModel = DailyClimateViewModel()

                it("should not be nil") {
                    expect(dailyClimateViewModel).notTo(beNil())
                }

                it("should be to have a string 'cityID'") {
                    expect(dailyClimateViewModel.cityID).to(beAKindOf(String.self))
                }
                
                it("should be to have a string 'fullDate'") {
                    expect(dailyClimateViewModel.fullDate).to(beAKindOf(String.self))
                }
                
                it("should be to have a string 'days'") {
                    expect(dailyClimateViewModel.days).to(beAKindOf(String.self))
                }
            }
            
            context("after receive a valid value from API (response)") {
                let dailyClimateViewModel: DailyClimateViewModel = DailyClimateViewModel()
                dailyClimateViewModel.selectedWeathers = []
                dailyClimateViewModel.cityID = "1"
                dailyClimateViewModel.fullDate = "2"
                dailyClimateViewModel.days = "1"
                dailyClimateViewModel.response = DailyClimateResponse(json: JSON())
                dailyClimateViewModel.filterByClimate()
                
                it("should be a DailyClimateResponse") {
                    expect(dailyClimateViewModel.response).to(beAKindOf(DailyClimateResponse.self))
                }
                
                it("should not be nil to DailyClimateResponse") {
                    expect(dailyClimateViewModel.response).notTo(beNil())
                }
                
                it("should not be nil to 'cityID'") {
                    expect(dailyClimateViewModel.cityID).notTo(beNil())
                }
                it("should not be nil to 'fullDate'") {
                    expect(dailyClimateViewModel.fullDate).notTo(beNil())
                }
                it("should not be nil to 'days'") {
                    expect(dailyClimateViewModel.days).notTo(beNil())
                }
                
                it("should be to have a string 'selectedWeathers'") {
                    expect(dailyClimateViewModel.selectedWeathers).to(beAKindOf([Weather].self))
                }
                
                it("should be to have a string 'climatesGrouped'") {
                    expect(dailyClimateViewModel.climatesGrouped).to(beAKindOf([String: [DailyClimate]].self))
                }
                
                it("should be nil to responseDidChange") {
                    expect(dailyClimateViewModel.responseDidChange).to(beNil())
                }
            }
            
            context("after receive a invalid value from API (error)") {
                let dailyClimateViewModel: DailyClimateViewModel = DailyClimateViewModel()
                dailyClimateViewModel.selectedWeathers = []
                dailyClimateViewModel.cityID = "1"
                dailyClimateViewModel.fullDate = "2"
                dailyClimateViewModel.days = "1"

                it("should be a DailyClimateResponse") {
                    expect(dailyClimateViewModel.response).to(beNil())
                }
                
                it("should not be nil to 'cityID'") {
                    expect(dailyClimateViewModel.cityID).notTo(beNil())
                }
                it("should not be nil to 'fullDate'") {
                    expect(dailyClimateViewModel.fullDate).notTo(beNil())
                }
                it("should not be nil to 'days'") {
                    expect(dailyClimateViewModel.days).notTo(beNil())
                }
                
                it("should be to have a string 'selectedWeathers'") {
                    expect(dailyClimateViewModel.selectedWeathers).to(beAKindOf([Weather].self))
                }
                
                it("should be to have a string 'climatesGrouped'") {
                    expect(dailyClimateViewModel.climatesGrouped).to(beNil())
                }
                
                it("should be nil to responseDidChange") {
                    expect(dailyClimateViewModel.responseDidChange).to(beNil())
                }
            }
        }
    }

}
