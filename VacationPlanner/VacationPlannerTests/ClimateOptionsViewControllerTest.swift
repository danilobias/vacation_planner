//
//  ClimaateOptionsViewControllerTest.swift
//  VacationPlannerTests
//
//  Created by Danilo on 26/07/2018.
//  Copyright © 2018 Danilo Bias Lago. All rights reserved.
//

import XCTest
import Quick
import Nimble

@testable import VacationPlanner

class ClimateOptionsViewControllerTest: QuickSpec {
    
    override func spec()
    {
        describe("ClimateOptionsViewController")
        {
            var viewController: ClimateOptionsViewController?
            
            beforeEach({
                let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                viewController = storyboard.instantiateViewController(withIdentifier: "ClimateOptionsViewController") as? ClimateOptionsViewController
                _ = viewController?.view
            })
            
            context("after class initialization")
            {
                it("should not be a nil to User") {
                    expect(viewController?.weatherViewModel).toNot(beNil())
                }
                
                it("button title should be 'Buscar'") {
                    expect(viewController?.selectButton.titleLabel?.text).to(equal("Selecionar"))
                }
                
                it("tableview should not to be nil") {
                    expect(viewController?.tableView).toNot(beNil())
                }
            }
        }
    }
}
