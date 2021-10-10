//
//  LevelTableViewCell.swift
//  VTBFinance
//
//  Created by Артём Мурашко on 08.10.2021.
//

import UIKit

class LevelsTableViewCell: UITableViewCell {
    @IBOutlet weak var levelsCollectionView: UICollectionView!
    var levels: [
        LevelModel] = [
            LevelModel(name: "Инфляция", desctiption: "Куда деваются деньги?", logo: UIImage(named: "Inflation")),
            LevelModel(name: "Кто такой брокер?", desctiption: "Зачем нужен брокер? Как его выбрать?", logo: UIImage(named: "Money"))
        ]
    var delegate: LevelCellDelegate?
    let defaults = UserDefaults.standard
    
    static let identifier = "LevelsTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "LevelsTableViewCell", bundle: nil)
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
                
        // Initialize the CollectionView
        levelsCollectionView.register(LevelCollectionViewCell.nib(), forCellWithReuseIdentifier: LevelCollectionViewCell.identifier)
        levelsCollectionView.dataSource = self
        levelsCollectionView.delegate   = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}

// MARK: - CollectionViewDataSource

extension LevelsTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return levels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = levelsCollectionView.dequeueReusableCell(withReuseIdentifier: LevelCollectionViewCell.identifier, for: indexPath) as? LevelCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(with: levels[indexPath.row])
        return cell
    }
}

// MARK: - CollectionViewDelegateFlowLayout

extension LevelsTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = self.frame.height - 50
        let width = height / 1.5
        
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}

// MARK: - CollectionViewDelegate

extension LevelsTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {

        delegate?.callSegueFromCell(id: indexPath.row)
        return true
    }
}
