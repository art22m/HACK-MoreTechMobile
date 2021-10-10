//
//  InflationSecondCollectionViewCell.swift
//  VTBFinance
//
//  Created by Артём Мурашко on 10.10.2021.
//

import UIKit

class InflationSecondCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var textLabel: UILabel!
    
    let defaults = UserDefaults.standard
    var delegate: StoryDelegate?
    
    static let identifier = "InflationSecondCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "InflationSecondCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let touchArea = CGSize(width: self.frame.width / 2, height: self.frame.height)
        let leftView = UIView(frame: CGRect(origin: .zero, size: touchArea))
        leftView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(leftTapped)))
        
//        animateText()
        
        let rightView = UIView(frame: CGRect(origin: CGPoint(x: self.frame.width - touchArea.width, y: 0), size: touchArea))
        rightView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(rightTapped)))
        
        leftView.backgroundColor = .clear
        rightView.backgroundColor = .clear
        
        self.addSubview(leftView)
        self.addSubview(rightView)
    }
    
    func animateText() {
        DispatchQueue.main.async {
            let text = self.textLabel.text
            let timeInterval: Double = 3.0 / Double(text!.count)
            
            var charIndex = 0.0
            self.textLabel.text = ""
            
            for letter in text! {
                Timer.scheduledTimer(withTimeInterval: timeInterval * charIndex, repeats: false) { (timer) in
                    self.textLabel.text?.append(letter)
                }
                charIndex += 1
            }
        }
    }
    
    @objc func leftTapped() {
        delegate?.scrollToPreviousCell()
    }
    
    @objc func rightTapped() {
        delegate?.scrollToNextCell()
    }
}
