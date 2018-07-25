//
//  UITextField.swift
//  VacationPlanner
//
//  Created by Danilo on 25/07/2018.
//  Copyright © 2018 Danilo Bias Lago. All rights reserved.
//

import UIKit

extension UITextField {
    
    // MARK: DatePicker Toolbar
    func datePickerToolBar(view: UIView) {
        
        let toolBar = UIToolbar(frame:CGRect(x: 0, y: view.frame.size.height/6, width: view.frame.size.width, height: 40.0))
        toolBar.layer.position = CGPoint(x: view.frame.size.width/2, y: view.frame.size.height-20.0)
        toolBar.barStyle = UIBarStyle.default
//        toolBar.tintColor = UIColor.white
//        toolBar.backgroundColor = UIColor.black
        
        let todayBtn = UIBarButtonItem(title: "Hoje", style: UIBarButtonItemStyle.plain, target: self, action: #selector(tappedToolBarBtn(sender:)))
        let okBarBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(donePressed(sender:)))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil)
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.size.width / 3, height: view.frame.size.height))
        
//        label.font = UIFont(name: "Helvetica", size: 12)
        label.backgroundColor = UIColor.clear
//        label.textColor = UIColor.white
        label.text = "Selecione uma data"
        label.textAlignment = NSTextAlignment.center
        
        let textBtn = UIBarButtonItem(customView: label)
        toolBar.setItems([todayBtn,flexSpace,textBtn,flexSpace,okBarBtn], animated: true)
        
        self.inputAccessoryView = toolBar
    }
    
    @objc func donePressed(sender: UIBarButtonItem) {
        self.resignFirstResponder()
    }
    
    @objc func tappedToolBarBtn(sender: UIBarButtonItem) {
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = DateFormatter.Style.medium
        dateformatter.timeStyle = DateFormatter.Style.none
        self.text = DateUtils.updateDate(type: .simple) //dateformatter.string(from: NSDate() as Date)
        self.resignFirstResponder()
    }

    // MARK: DatePicker
    func datePickerYeart(strDate: String) {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(datePickerValueChange(sender:)), for: UIControlEvents.valueChanged)
        self.inputView = datePicker
        datePicker.date = DateUtils.getDateFromString(strDate: strDate) ?? Date()
    }
    
    func datePicker(strDate: String) {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(datePickerValueChange(sender:)), for: UIControlEvents.valueChanged)
        self.inputView = datePicker
        datePicker.date = DateUtils.getDateFromString(strDate: strDate) ?? Date()
    }
    
    @objc func datePickerValueChange(sender: UIDatePicker) {
        let date = DateUtils.updateDate(date: sender.date, type: .simple)
        self.text = date ?? DateUtils.updateDate(type: .simple)
    }
}
