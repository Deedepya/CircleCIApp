//
//  APIListCell.swift
//  APIApp
//
//  Created by dedeepya reddy salla on 07/06/23.
//

import UIKit

class APIListCell: UITableViewCell {

    @IBOutlet var desc: UILabel!
    @IBOutlet var linkLabel: UILabel!
    @IBOutlet var apiName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
