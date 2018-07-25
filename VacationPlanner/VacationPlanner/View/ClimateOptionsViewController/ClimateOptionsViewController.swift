//
//  ClimateOptionsViewController.swift
//  VacationPlanner
//
//  Created by Danilo on 25/07/2018.
//  Copyright © 2018 Danilo Bias Lago. All rights reserved.
//

import UIKit

class ClimateOptionsViewController: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var selectButton: UIButton!
    
    // MARK: - Lets and Vars
    var weatherViewModel: WeatherViewModel! {
        didSet {
            weatherViewModel.responseDidChange = { [weak self] viewModel in
                self?.hideLoading()
                self?.tableView.reloadData()
            }
        }
    }
    
    var delegate: WeatherFilterProtocol?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.weatherViewModel = WeatherViewModel()
        self.makeWeathersRequest()
        self.configViewsLayout()
    }
    
    // MARK: - Actions
    @IBAction func selectWeathers(_ sender: UIButton) {
        
        let selectedWeathers: [Weather] = self.getSelectedWeathers()
        
        if selectedWeathers.count > 0 {
        
            self.delegate?.selectedWeatherToFilter(weathers: selectedWeathers)
            self.navigationController?.popViewController(animated: true)
        
        }else {
            self.showAlert(message: "Selecione ao menos 1 opção.") { (success) in }
        }
    }
    
    // MARK: - Configurations
    func configViewsLayout() {
        self.selectButton.circleView()
    }

    // MARK: - Request
    func makeWeathersRequest() {
        self.showLoading()
        self.weatherViewModel.getElement(completion: { (error) in
            // TO-DO: Tratar erro
            self.hideLoading()
        })
    }
    
    // MARK: - Utils
    func getSelectedWeathers() -> [Weather] {
        if let weathers: [Weather]  = self.weatherViewModel.response?.wheaters {
            return weathers.filter({$0.isSelected == true})
        }
        
        return []
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

    // MARK: - Memory
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ClimateOptionsViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherViewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: WeatherTableViewCell = tableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell") as! WeatherTableViewCell
        let weather: Weather = self.weatherViewModel.getWeatherBy(index: indexPath.row)
        cell.configCellWith(weather: weather, indexPath: indexPath, tableView: tableView)        
        return cell
    }
}

extension ClimateOptionsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let weather: Weather = self.weatherViewModel.getWeatherBy(index: indexPath.row)
        weather.isSelected = true
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let weather: Weather = self.weatherViewModel.getWeatherBy(index: indexPath.row)
        weather.isSelected = false
    }
}
