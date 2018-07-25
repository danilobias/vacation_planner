//
//  BaseViewController.swift
//  VacationPlanner
//
//  Created by Danilo Bias Lago on 24/07/2018.
//  Copyright © 2018 Danilo Bias Lago. All rights reserved.
//

import UIKit
import SVProgressHUD

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - Utils
    func showAlert(title: String? = nil, message: String?, completion: @escaping (Bool) -> Void) {
        
        let alert = UIAlertController(title: title ?? "Ops" , message: (message), preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { _ in
            completion(true)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func showLoading() {
        SVProgressHUD.setDefaultStyle(.dark)
        SVProgressHUD.show()

    }
    
    func hideLoading() {
        SVProgressHUD.dismiss()
    }
    
    // MARK: - Memory
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
