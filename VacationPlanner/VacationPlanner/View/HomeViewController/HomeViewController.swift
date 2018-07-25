//
//  HomeViewController.swift
//  VacationPlanner
//
//  Created by Danilo Bias Lago on 24/07/2018.
//  Copyright © 2018 Danilo Bias Lago. All rights reserved.
//

import UIKit

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
    
    var pickerView: UIPickerView?

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.citiesViewModel = CitiesViewModel()
        self.makeCitiesRequest()
        self.configViewsLayout()
    }
    
    // MARK: - Configurations
    func configViewsLayout() {
        self.box1View.cornerRadius(radius: 5.0)
        self.box2View.cornerRadius(radius: 5.0)
        self.climateLabel.cornerRadius(radius: 5.0)
        self.searchButton.circleView()        
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

    // MARK: - Memory
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreate
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
