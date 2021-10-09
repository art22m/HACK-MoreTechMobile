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
    var stories: [Int] = [1, 2, 3]
    var storyNumber = 1
    var percent: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        percent = Float(1.0 / Float(stories.count))
        progress.progress = percent
        
        // Initialize the CollectionView
        storiesCollection.register(TextStoryCollectionViewCell.nib(), forCellWithReuseIdentifier: TextStoryCollectionViewCell.identifier)
        storiesCollection.dataSource = self
        storiesCollection.delegate   = self
    }
}

// MARK: - Story Delegate

extension StoriesViewController: StoryDelegate {
    func scrollToNextCell() {
        guard storyNumber != stories.count else { return }
        
        let cellSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
        let contentOffset = storiesCollection.contentOffset;
        storiesCollection.scrollRectToVisible(CGRect(x: contentOffset.x + cellSize.width, y: contentOffset.y, width: cellSize.width, height: cellSize.height), animated: true)
        
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
        guard let cell = storiesCollection.dequeueReusableCell(withReuseIdentifier: TextStoryCollectionViewCell.identifier, for: indexPath) as? TextStoryCollectionViewCell else { return UICollectionViewCell() }
        cell.textLabel.text = "Story num: \(indexPath.row)"
        
        cell.delegate = self
        
        return cell
    }
    
    
}

// MARK: - CollectionViewDelegateFlowLayout

extension StoriesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                
        return CGSize(width: storiesCollection.frame.width, height: storiesCollection.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
