//
//  TextAndButtonsCollectionViewCell.swift
//  VTBFinance
//
//  Created by Артём Мурашко on 10.10.2021.
//

import UIKit

class TextAndButtonsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var rightView: UIView!
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var middleButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    
    var delegate: StoryDelegate?
    
    static let identifier = "TextAndButtonsCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "TextAndButtonsCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        topButton.layer.cornerRadius = 10
        middleButton.layer.cornerRadius = 10
        bottomButton.layer.cornerRadius = 10
        
        // Make left and ride halfs of the screen tappable
       leftView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(leftViewTapped)))
       rightView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(rightViewTapped)))
    }
    
    
    @IBAction func topButtonTapped(_ sender: Any) {
        print("Tapped")
    }
    
    
    @IBAction func middleButtonTapped(_ sender: Any) {
        print("Tapped")
    }
    
    
    @IBAction func bottomButtonTapped(_ sender: Any) {
        print("Tapped")
    }
}

// MARK: - Gesture Recognizer

extension TextAndButtonsCollectionViewCell {
    @objc func leftViewTapped() {
        delegate?.scrollToPreviousCell()
    }

    @objc func rightViewTapped() {
        delegate?.scrollToNextCell()
    }
}
