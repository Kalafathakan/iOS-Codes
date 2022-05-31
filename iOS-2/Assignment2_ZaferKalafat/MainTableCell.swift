//
//  MainTableCell.swift
//  Assignment2_ZaferKalafat
//
//  Created by user214082 on 2/24/22.
//

import UIKit

class MainTableCell: UITableViewCell {

    @IBOutlet weak var TableQuantity: UILabel!
    @IBOutlet weak var TablePrice: UILabel!
    @IBOutlet weak var TableName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
