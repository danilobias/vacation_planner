//
//  HomeViewControllerTest.swift
//  VacationPlannerTests
//
//  Created by Danilo on 26/07/2018.
//  Copyright © 2018 Danilo Bias Lago. All rights reserved.
//

import XCTest
import Quick
import Nimble

@testable import VacationPlanner

class HomeViewControllerTest: QuickSpec {
        
    override func spec()
    {
        describe("HomeViewController")
        {
            var viewController: HomeViewController?
            
            beforeEach({
                let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                viewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
                _ = viewController?.view
            })
            
            context("after class initialization")
            {
                it("should not be a nil to User") {
                    expect(viewController?.dailyClimatesViewModel).toNot(beNil())
                }
                
                it("button title should be 'Buscar'") {
                    expect(viewController?.searchButton.titleLabel?.text).to(equal("Buscar"))
                }
                
                it("text fields text should be nil") {
                    expect(viewController?.cityTextField.text).to(equal(""))
                    expect(viewController?.dateTextField.text).to(equal(""))
                    expect(viewController?.daysTextField.text).to(equal(""))
                }
                
                it("label text should be default value") {
                    expect(viewController?.climateLabel.text).to(equal("Selecione as opções de clima"))
                }
            }
        }
    }
}
