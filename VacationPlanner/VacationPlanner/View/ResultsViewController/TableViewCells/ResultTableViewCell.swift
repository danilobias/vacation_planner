//
//  ResultTableViewCell.swift
//  VacationPlanner
//
//  Created by Danilo on 25/07/2018.
//  Copyright © 2018 Danilo Bias Lago. All rights reserved.
//

import UIKit

class ResultTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - TableViewCell Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        // Configure the view for the selected state
        super.setSelected(selected, animated: animated)
        self.accessoryType = selected ? .checkmark : .none
        
    }
    
    // MARK: - Layout Config Methods
    func configCellWith(climate: DailyClimate) {
        self.titleLabel.text = "A partir de: " + (climate.dateString ?? " - ")
    }

}
