//
//  BalanceTableViewCell.swift
//  VTBFinance
//
//  Created by Артём Мурашко on 09.10.2021.
//

import UIKit

class BalanceTableViewCell: UITableViewCell {
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var profitView: UIView!
    @IBOutlet weak var profitLabel: UITextField!
    
    static let identifier = "BalanceTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "BalanceTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profitView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
