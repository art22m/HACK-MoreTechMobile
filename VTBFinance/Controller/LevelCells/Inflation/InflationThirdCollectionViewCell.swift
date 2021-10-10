//
//  InflationThirdCollectionViewCell.swift
//  VTBFinance
//
//  Created by Артём Мурашко on 10.10.2021.
//

import UIKit

class InflationThirdCollectionViewCell: UICollectionViewCell {
    let defaults = UserDefaults.standard
    var delegate: StoryDelegate?
    
    static let identifier = "InflationThirdCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "InflationThirdCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let touchArea = CGSize(width: self.frame.width / 2, height: self.frame.height)
        let leftView = UIView(frame: CGRect(origin: .zero, size: touchArea))
        leftView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(leftTapped)))
        
        let rightView = UIView(frame: CGRect(origin: CGPoint(x: self.frame.width - touchArea.width, y: 0), size: touchArea))
        rightView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(rightTapped)))
        
        leftView.backgroundColor = .clear
        rightView.backgroundColor = .clear
        
        self.addSubview(leftView)
        self.addSubview(rightView)
    }
    
    @objc func leftTapped() {
        delegate?.scrollToPreviousCell()
    }
    
    @objc func rightTapped() {
        delegate?.scrollToNextCell()
    }
}
