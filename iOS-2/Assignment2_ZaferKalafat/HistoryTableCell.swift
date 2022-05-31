//
//  HistoryTableCell.swift
//  Assignment2_ZaferKalafat
//
//  Created by user214082 on 2/24/22.
//

import UIKit

class HistoryTableCell: UITableViewCell {
    
    @IBOutlet weak var ItemName: UILabel!
    
    @IBOutlet weak var ItemQuantity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
