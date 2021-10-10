//
//  HeaderAndButtonTableViewCell.swift
//  VTBFinance
//
//  Created by Артём Мурашко on 09.10.2021.
//

import UIKit

class HeaderAndButtonTableViewCell: UITableViewCell {
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var headerLabel: UILabel!
    
    static let identifier = "HeaderAndButtonTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "HeaderAndButtonTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        button.isHidden = true
    }
    
    func setHeaderLabel(to text: String) {
        headerLabel.text = text
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func buttonTapped(_ sender: Any) {
        print("Tapped")
    }
    
}
