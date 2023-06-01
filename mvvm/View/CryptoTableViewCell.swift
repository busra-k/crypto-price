//
//  CryptoTableViewCell.swift
//  mvvm
//
//  Created by Büşra Kocakuşaklı on 25.05.2023.
//

import UIKit

class CryptoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var currencyText: UILabel!
    @IBOutlet weak var priceText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
