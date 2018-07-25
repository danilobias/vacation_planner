//
//  WeatherTableViewCell.swift
//  VacationPlanner
//
//  Created by Danilo on 25/07/2018.
//  Copyright © 2018 Danilo Bias Lago. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var nameLabel: UILabel!

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
    func configCellWith(weather: Weather, indexPath: IndexPath, tableView: UITableView) {
        self.nameLabel.text = weather.name ?? ""
        
        // select/deselect the cell
        if weather.isSelected {
            
            if !self.isSelected {
                tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
            }
            
        } else {
            
            if self.isSelected {
                tableView.deselectRow(at: indexPath, animated: false)
            }
        }
    }
}
