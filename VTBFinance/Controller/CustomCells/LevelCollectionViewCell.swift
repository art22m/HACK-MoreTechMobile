//
//  LevelCollectionViewCell.swift
//  VTBFinance
//
//  Created by Артём Мурашко on 08.10.2021.
//

import UIKit

class LevelCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "LevelCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "LevelCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 20
    }
    
}
