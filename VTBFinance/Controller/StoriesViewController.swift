//
//  StoriesViewController.swift
//  VTBFinance
//
//  Created by Артём Мурашко on 09.10.2021.
//

import UIKit

protocol StoryDelegate {
    func scrollToNextCell()
    func scrollToPreviousCell()
}

class StoriesViewController: UIViewController {
    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var storiesCollection: UICollectionView!

    var stories = [UICollectionViewCell]()
    var storyNumber = 1
    var lessonID: Int = 0
    var percent: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch lessonID {
        case 0:
            stories = [
                InflationFirstCollectionViewCell(),
                InflationSecondCollectionViewCell(),
                InflationThirdCollectionViewCell(),
                InflationFourthCollectionViewCell()
            ]
        default:
            break
        }
        
        percent = Float(1.0 / Float(stories.count))
        progress.progress = percent
        
        // Initialize the CollectionView
        storiesCollection.register(InflationFirstCollectionViewCell.nib(), forCellWithReuseIdentifier: InflationFirstCollectionViewCell.identifier)
        storiesCollection.register(InflationSecondCollectionViewCell.nib(), forCellWithReuseIdentifier: InflationSecondCollectionViewCell.identifier)
        storiesCollection.register(InflationThirdCollectionViewCell.nib(), forCellWithReuseIdentifier: InflationThirdCollectionViewCell.identifier)
        storiesCollection.register(InflationFourthCollectionViewCell.nib(), forCellWithReuseIdentifier: InflationFourthCollectionViewCell.identifier)
        
        storiesCollection.dataSource = self
        storiesCollection.delegate   = self
    }
}

// MARK: - Story Delegate

extension StoriesViewController: StoryDelegate {
    func scrollToNextCell() {
        guard storyNumber != stories.count else {
            self.dismiss(animated: true, completion: nil)
            return
        }
        
        //get cell size
        let cellSize = CGSize(width: self.view.frame.width, height: self.view.frame.height);

       //get current content Offset of the Collection view
       let contentOffset = storiesCollection.contentOffset;
        print(cellSize.width)
        print(contentOffset)
       //scroll to next cell
        storiesCollection.scrollRectToVisible(CGRect(x: contentOffset.x + cellSize.width, y: contentOffset.y, width: cellSize.width, height: cellSize.height), animated: true);

        
        progress.progress += percent
        storyNumber += 1
    }
    
    func scrollToPreviousCell() {
        guard storyNumber != 1 else { return }
        
        let cellSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
        let contentOffset = storiesCollection.contentOffset;
        storiesCollection.scrollRectToVisible(CGRect(x: contentOffset.x - cellSize.width, y: contentOffset.y, width: cellSize.width, height: cellSize.height), animated: true)
        
        progress.progress -= percent
        storyNumber -= 1
    }
}

// MARK: - CollectionViewDelegate

extension StoriesViewController: UICollectionViewDelegate {
    
}

// MARK: - CollectionViewDataSource

extension StoriesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch lessonID {
        case 0:
            if (indexPath.row == 0) {
                guard let cell = storiesCollection.dequeueReusableCell(withReuseIdentifier: InflationFirstCollectionViewCell.identifier, for: indexPath) as? InflationFirstCollectionViewCell else { return UICollectionViewCell() }
                
                cell.delegate = self
                
                return cell
            } else if (indexPath.row == 1) {
                guard let cell = storiesCollection.dequeueReusableCell(withReuseIdentifier: InflationSecondCollectionViewCell.identifier, for: indexPath) as? InflationSecondCollectionViewCell else { return UICollectionViewCell() }
                
                cell.delegate = self
                
                return cell
            } else if (indexPath.row == 2) {
                guard let cell = storiesCollection.dequeueReusableCell(withReuseIdentifier: InflationThirdCollectionViewCell.identifier, for: indexPath) as? InflationThirdCollectionViewCell else { return UICollectionViewCell() }
                
                cell.delegate = self
                
                return cell
            } else if (indexPath.row == 3) {
                guard let cell = storiesCollection.dequeueReusableCell(withReuseIdentifier: InflationFourthCollectionViewCell.identifier, for: indexPath) as? InflationFourthCollectionViewCell else { return UICollectionViewCell() }
                
                cell.delegate = self
                
                return cell
            }
        default:
            break;
        }
            
        return UICollectionViewCell()
    }
    
    
}

// MARK: - CollectionViewDelegateFlowLayout

extension StoriesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                
        return CGSize(width: self.view.frame.width, height: self.view.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
