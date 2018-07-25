//
//  HomeViewController.swift
//  VacationPlanner
//
//  Created by Danilo Bias Lago on 24/07/2018.
//  Copyright © 2018 Danilo Bias Lago. All rights reserved.
//

import UIKit

protocol WeatherFilterProtocol: class {
    func selectedWeatherToFilter(weathers: [Weather])
}


class HomeViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var box1View: UIView!
    @IBOutlet weak var box2View: UIView!
    
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var daysTextField: UITextField!
    
    @IBOutlet weak var climateLabel: UILabel!
    
    @IBOutlet weak var actLoadCity: UIActivityIndicatorView!
    
    @IBOutlet weak var searchButton: UIButton!

    // MARK: - Lets and Vars
    var citiesViewModel: CitiesViewModel! {
        didSet {
            citiesViewModel.responseDidChange = { [weak self] viewModel in
                self?.finishLoadCities()
            }
        }
    }
    
    var dailyClimatesViewModel: DailyClimateViewModel! {
        didSet {
            dailyClimatesViewModel.responseDidChange = { [weak self] viewModel in
                self?.finishSearch()
            }
        }
    }
    
    var pickerView: UIPickerView?
    var selectedCity: City?
    var selectedWeathers: [Weather]!
    
    let climateEmptyText: String = "Selecione as opções de clima"

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.citiesViewModel = CitiesViewModel()
        self.dailyClimatesViewModel = DailyClimateViewModel()
        self.makeCitiesRequest()
        self.configViewsLayout()
    }
    
    // MARK: - Actions
    @IBAction func search(_ sender: UIButton) {
        
        if self.cityTextField.text?.isEmpty == false &&
            self.dateTextField.text?.isEmpty == false &&
            self.daysTextField.text?.isEmpty == false &&
            self.climateLabel.text != self.climateEmptyText &&
            self.selectedWeathers.count > 0 {
            
            self.makeSearch()
        
        }else {
            if self.selectedWeathers?.count == 0 {
                self.showAlert(message: "Selecione as opções de clima, por favor.") { (success) in }
            }else {
                self.showAlert(message: "Verifique os campos e tente novamente, por favor.") { (success) in }
            }
        }
    }
    
    // MARK: - Configurations
    func configViewsLayout() {
        self.box1View.cornerRadius(radius: 5.0)
        self.box2View.cornerRadius(radius: 5.0)
        self.climateLabel.cornerRadius(radius: 5.0)
        self.searchButton.circleView()        
    }
    
    // MARK: - Search
    func makeSearch() {
        self.showLoading()
        self.dailyClimatesViewModel.cityID = self.selectedCity!.woeid!
        self.dailyClimatesViewModel.fullDate = self.self.dateTextField.text!
        self.dailyClimatesViewModel.days = self.daysTextField.text!
        self.dailyClimatesViewModel.selectedWeathers = self.selectedWeathers
        
        self.dailyClimatesViewModel.getElement { (error) in
            //TO-DO: Tratar erro
            self.hideLoading()
        }
        
    }
    
    func finishSearch() {
        self.hideLoading()
//        self.performSegue(withIdentifier: "ShowResultsSegue", sender: nil)
    }
    
    // MARK: - Request
    func makeCitiesRequest() {
        
        self.citiesViewModel.getElement(completion: { (error) in
            // TO-DO: Tratar erro
            self.actLoadCity.stopAnimating()
            self.cityTextField.isEnabled = true
        })
    }
    
    func finishLoadCities() {
        self.actLoadCity.stopAnimating()
        self.cityTextField.isEnabled = true
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "ShowResultsSegue" {
            if let destination = segue.destination as? ResultsViewController {
                destination.climates = self.dailyClimatesViewModel.climates
            }
        }
        
        if segue.identifier == "ShowWeatherOptionsPush" {
            if let destination = segue.destination as? ClimateOptionsViewController {
                destination.delegate = self
            }
        }
    }

    // MARK: - Memory
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreate
    }
}

// MARK: - Weather Filter Delegate
extension HomeViewController: WeatherFilterProtocol {
    
    func selectedWeatherToFilter(weathers: [Weather]) {
        
        self.selectedWeathers = weathers
        
        for weather in self.selectedWeathers {
            
            if self.climateLabel.text == climateEmptyText {
                self.climateLabel.text = weather.name ?? ""
            }else {
                self.climateLabel.text = self.climateLabel.text! + ", " + (weather.name ?? "")
            }
        }
    }
}

// MARK: - Extension PickerView DataSource
extension HomeViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        let tagPickerView = pickerView.tag
        
        if tagPickerView == 1 {
            return citiesViewModel?.numberOfRows() ?? 0
        }
        
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       
        let tagPickerView = pickerView.tag
        var rowTitle = ""
        
        if tagPickerView == 1 {
            rowTitle = citiesViewModel.getCityBy(index: row).district ?? ""
        }
        
        return rowTitle
    }
    
}

// MARK: - Extension PickerView Delegate
extension HomeViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let tagPickerView = pickerView.tag
        
        if tagPickerView == 1 {
            if (citiesViewModel?.numberOfRows())! > 0 {
                cityTextField.text = citiesViewModel.getCityBy(index: row).district ?? ""
                self.selectedCity = citiesViewModel.getCityBy(index: row)
            }
            else {
                self.showAlert(message: "Desculpe, não foi possível carregar a lista de cidades.") { (success) in }
            }
        }
    }
}

extension HomeViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == self.dateTextField {
            textField.datePicker(strDate: textField.text!)
            textField.datePickerToolBar(view: self.view)
        }
        
        if textField == self.cityTextField {
            
            pickerView = UIPickerView()
            pickerView?.delegate = self
            pickerView?.dataSource = self
            pickerView?.tag = textField.tag
            textField.inputView = pickerView
            pickerView(pickerView!, didSelectRow: 0, inComponent: 0)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
