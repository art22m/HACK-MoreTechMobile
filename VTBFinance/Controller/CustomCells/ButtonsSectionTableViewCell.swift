//
//  ButtonsSectionTableViewCell.swift
//  VTBFinance
//
//  Created by Артём Мурашко on 09.10.2021.
//

import UIKit

class ButtonsSectionTableViewCell: UITableViewCell {
    @IBOutlet weak var buttonsCollectionView: UICollectionView!
    var buttons: [Int] = [1, 2, 3, 4]
        
    static let identifier = "ButtonsSectionTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "ButtonsSectionTableViewCell", bundle: nil)
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialize the CollectionView
        buttonsCollectionView.register(ButtonCollectionViewCell.nib(), forCellWithReuseIdentifier: ButtonCollectionViewCell.identifier)
        buttonsCollectionView.dataSource = self
        buttonsCollectionView.delegate   = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}

// MARK: - CollectionViewDataSource
extension ButtonsSectionTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return buttons.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = buttonsCollectionView.dequeueReusableCell(withReuseIdentifier: ButtonCollectionViewCell.identifier, for: indexPath) as? ButtonCollectionViewCell else { return UICollectionViewCell() }
        
        return cell
    }
}

// MARK: - CollectionViewDelegateFlowLayout
extension ButtonsSectionTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = self.frame.height - 50
        let width = self.frame.width / 2
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}
