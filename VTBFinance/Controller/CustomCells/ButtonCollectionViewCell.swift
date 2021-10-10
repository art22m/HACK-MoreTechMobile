//
//  ButtonCollectionViewCell.swift
//  VTBFinance
//
//  Created by Артём Мурашко on 09.10.2021.
//

import UIKit

class ButtonCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    static let identifier = "ButtonCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "ButtonCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        logo.image = logo.image?.withRenderingMode(.alwaysTemplate)
        logo.tintColor = .white
        
        self.layer.cornerRadius = 20
    }
    
    func configure(with button: BottomButtonModel) {
        self.logo.image = button.logo
        
        let newImage = self.logo.image?.withRenderingMode(.alwaysTemplate)
        self.logo.image = newImage
        self.logo.tintColor = .white
        
        self.descriptionLabel.text = button.description
    }

}
