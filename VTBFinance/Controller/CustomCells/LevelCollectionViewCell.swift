//
//  LevelCollectionViewCell.swift
//  VTBFinance
//
//  Created by Артём Мурашко on 08.10.2021.
//

import UIKit

class LevelCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var levelName: UILabel!
    @IBOutlet weak var levelDescription: UILabel!
    @IBOutlet weak var levelLogo: UIImageView!
    
    static let identifier = "LevelCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "LevelCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 20
    }
    
    func configure(with level: LevelModel) {
        self.levelName.text = level.name
        self.levelDescription.text = level.desctiption
        self.levelLogo.image = level.logo
    }
}
