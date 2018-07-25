//
//  HomeViewController.swift
//  VacationPlanner
//
//  Created by Danilo Bias Lago on 24/07/2018.
//  Copyright © 2018 Danilo Bias Lago. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    // MARK: - Lets and Vars
    var citiesViewModel: CitiesViewModel! {
        didSet {
            citiesViewModel.responseDidChange = { [weak self] viewModel in
                self?.finishLoadCities()
            }
        }
    }

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.citiesViewModel = CitiesViewModel()
        self.makeCitiesRequest()
    }
    
    // MARK: - Request
    func makeCitiesRequest() {
        self.citiesViewModel.getElement(completion: { (error) in
            // TO-DO: Tratar erro
        })
    }
    
    func finishLoadCities() {
        
    }
    
    // MARK: - Memory
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
