//
//  InflationFirstCollectionViewCell.swift
//  VTBFinance
//
//  Created by Артём Мурашко on 10.10.2021.
//

import UIKit

class InflationFirstCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var textLabel: UILabel!
    
    let defaults = UserDefaults.standard
    var delegate: StoryDelegate?
    
    static let identifier = "InflationFirstCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "InflationFirstCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let name = defaults.string(forKey: "userName")
        if let name = name {
            textLabel.text = "\(name) отметил свой день рождение. Ему исполнилось 20 лет!"
        }
        
//        animateText()

        let touchArea = CGSize(width: self.frame.width, height: self.frame.height)
        let screenView = UIView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: touchArea))
        screenView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewTapped)))
        
        screenView.backgroundColor = .clear
        self.addSubview(screenView)
    }
    
    @objc func viewTapped() {
        delegate?.scrollToNextCell()
    }
    
    func animateText() {
        DispatchQueue.main.async {
            let text = self.textLabel.text ?? ""
            let words = text.components(separatedBy: " ")
            let timeInterval: Double = 2.0 / Double(words.count)
            
            var charIndex = 0.0
            self.textLabel.text = ""
            
            for word in words {
                Timer.scheduledTimer(withTimeInterval: timeInterval * charIndex, repeats: false) { (timer) in
                    self.textLabel.text?.append("\(word) ")
                }
                charIndex += 1
            }
        }
    }
}
