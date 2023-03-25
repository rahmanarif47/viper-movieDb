//
//  TableViewCell.swift
//  Viper-MovieDV
//
//  Created by Arif Rahman Sidik on 25/03/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(source: Genre){
        titleLabel.text = source.name
    }
    
}
