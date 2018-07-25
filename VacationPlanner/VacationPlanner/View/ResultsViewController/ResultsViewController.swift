//
//  ResultsViewController.swift
//  VacationPlanner
//
//  Created by Danilo on 25/07/2018.
//  Copyright © 2018 Danilo Bias Lago. All rights reserved.
//

import UIKit

class ResultsViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Lets and Vars
    var climatesGrouped: [String: [DailyClimate]]!

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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

extension ResultsViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.climatesGrouped.keys.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let key: String = Array(self.climatesGrouped.keys)[section]
        return key
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key: String = Array(self.climatesGrouped.keys)[section]
        let climates: [DailyClimate] = self.climatesGrouped[key]!
        return climates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ResultTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ResultTableViewCell") as! ResultTableViewCell
        let key: String = Array(self.climatesGrouped.keys)[indexPath.section]
        let climates: [DailyClimate] = self.climatesGrouped[key]!
        let climate: DailyClimate = climates[indexPath.row]
        cell.configCellWith(climate: climate)
        return cell
    }
}

extension ResultsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
