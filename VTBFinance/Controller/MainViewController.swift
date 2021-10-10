//
//  ViewController.swift
//  VTBFinance
//
//  Created by Артём Мурашко on 08.10.2021.
//

import UIKit

protocol LevelCellDelegate {
    func callSegueFromCell(id: Int)
}

protocol IntroDelegate {
    func updateBalance(newBalance: String)
}

class MainViewController: UIViewController, LevelCellDelegate {
    @IBOutlet weak var sectionsTable: UITableView!
    let defaults = UserDefaults.standard
    var balance: String = "0.0"
    var nextLesson: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Show introductery screen while first run
        if (defaults.bool(forKey: "isFirstLaunch") == false ||
            defaults.bool(forKey: "isFirstLaunch") == nil) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.performSegue(withIdentifier: "showIntro", sender: self)
            }
            defaults.set(true, forKey: "isFirstLaunch")
        }
        
        if defaults.integer(forKey: "currentLevel") == nil {
            defaults.set(1, forKey: "currentLevel")
        }
        
        // Initialize the TableView
        sectionsTable.delegate   = self
        sectionsTable.dataSource = self
        
        sectionsTable.register(BalanceTableViewCell.nib(), forCellReuseIdentifier: BalanceTableViewCell.identifier)
        sectionsTable.register(HeaderAndButtonTableViewCell.nib(), forCellReuseIdentifier: HeaderAndButtonTableViewCell.identifier)
        sectionsTable.register(LevelsTableViewCell.nib(), forCellReuseIdentifier: LevelsTableViewCell.identifier)
        sectionsTable.register(ButtonsSectionTableViewCell.nib(), forCellReuseIdentifier: ButtonsSectionTableViewCell.identifier)
    }
    
    func callSegueFromCell(id: Int) {
        nextLesson = id
        performSegue(withIdentifier: "showLevel", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextViewController = segue.destination as? IntroductionViewController {
            nextViewController.delegate = self
        } else if let nextViewController = segue.destination as? StoriesViewController {
            nextViewController.lessonID = nextLesson
        }
    }
}

extension MainViewController: IntroDelegate {
    func updateBalance(newBalance: String) {
        self.balance = newBalance
        print(newBalance)
        sectionsTable.reloadData()
    }
}

// MARK: - TableViewDataSource
extension MainViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = sectionsTable.dequeueReusableCell(withIdentifier: BalanceTableViewCell.identifier, for: indexPath) as? BalanceTableViewCell
            else { return BalanceTableViewCell() }
            
            cell.configure(balance: self.balance, profit: "0.0₽ (0.0%)")
            
            return cell
        } else if indexPath.row == 1 {
            guard let cell = sectionsTable.dequeueReusableCell(withIdentifier: HeaderAndButtonTableViewCell.identifier, for: indexPath) as? HeaderAndButtonTableViewCell
            else { return HeaderAndButtonTableViewCell() }
            
            cell.setHeaderLabel(to: "Уровни")
            
            return cell
        } else if indexPath.row == 2 {
            guard let cell = sectionsTable.dequeueReusableCell(withIdentifier: LevelsTableViewCell.identifier, for: indexPath) as? LevelsTableViewCell
            else { return LevelsTableViewCell() }
            
            cell.delegate = self
            
            return cell
        } else if indexPath.row == 3 {
            guard let cell = sectionsTable.dequeueReusableCell(withIdentifier: HeaderAndButtonTableViewCell.identifier, for: indexPath) as? HeaderAndButtonTableViewCell
            else { return HeaderAndButtonTableViewCell() }
            
            cell.setHeaderLabel(to: "Возможности")
        } else if indexPath.row == 4 {
            guard let cell = sectionsTable.dequeueReusableCell(withIdentifier: ButtonsSectionTableViewCell.identifier, for: indexPath) as? ButtonsSectionTableViewCell
            else { return ButtonsSectionTableViewCell() }
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 120
        } else if indexPath.row == 1 {
            return 44
        } else if indexPath.row == 2 {
            return view.frame.height / 2.2
        } else if indexPath.row == 3 {
            return 44
        } else if indexPath.row == 4 {
            return 150
        }
                
        return CGFloat()
    }
}

extension MainViewController : UITableViewDelegate {

}
