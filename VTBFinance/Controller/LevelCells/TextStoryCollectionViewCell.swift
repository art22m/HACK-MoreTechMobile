//
//  TextStoryCollectionViewCell.swift
//  VTBFinance
//
//  Created by Артём Мурашко on 09.10.2021.
//

import UIKit

class TextStoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var rightView: UIView!
    
    var delegate: StoryDelegate?
    
    static let identifier = "TextStoryCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "TextStoryCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Make left and ride halfs of the screen tappable
       leftView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(leftViewTapped)))
       rightView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(rightViewTapped)))
    }
}

// MARK: - Gesture Recognizer

extension TextStoryCollectionViewCell {
    @objc func leftViewTapped() {
        delegate?.scrollToPreviousCell()
    }

    @objc func rightViewTapped() {
        delegate?.scrollToNextCell()
    }
}
