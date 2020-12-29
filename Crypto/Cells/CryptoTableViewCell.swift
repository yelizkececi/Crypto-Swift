//
//  CyrptoTableViewCell.swift
//  Crypto
//
//  Created by Yeliz Keçeci on 21.12.2020.
//

import UIKit

class CryptoTableViewCell: UITableViewCell {

    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(for vm: CryptoViewModel){
        self.currencyLabel.text = vm.currency
        self.priceLabel.text = vm.price
    }

}
