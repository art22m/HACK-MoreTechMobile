//
//  InflationFourthCollectionViewCell.swift
//  VTBFinance
//
//  Created by Артём Мурашко on 10.10.2021.
//

import UIKit

class InflationFourthCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var defaults = UserDefaults.standard
    var delegate: StoryDelegate?
    
    static let identifier = "InflationFourthCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "InflationFourthCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        button1.layer.cornerRadius = 15
        button2.layer.cornerRadius = 15
        button3.layer.cornerRadius = 15
        
        let touchArea = CGSize(width: self.frame.width / 2, height: self.frame.height)
        let leftView = UIView(frame: CGRect(origin: .zero, size: touchArea))
        leftView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(leftTapped)))
        leftView.backgroundColor = .clear
        
        self.addSubview(leftView)
    }
    
    
    @IBAction func buttonTapped(sender: UIButton) {
        defaults.set(sender.titleLabel?.text, forKey: "userInflationChoice")
        let currentLevel = defaults.integer(forKey: "currentLevel") + 1
        defaults.set(currentLevel, forKey: "currentLevel")
    }
    
    @objc func leftTapped() {
        delegate?.scrollToPreviousCell()
    }
}
