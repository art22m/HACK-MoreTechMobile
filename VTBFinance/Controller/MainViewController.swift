//
//  ViewController.swift
//  VTBFinance
//
//  Created by Артём Мурашко on 08.10.2021.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var sectionsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Initialize the TableView
        sectionsTable.delegate   = self
        sectionsTable.dataSource = self
        sectionsTable.register(HeaderAndButtonTableViewCell.nib(), forCellReuseIdentifier: HeaderAndButtonTableViewCell.identifier)
        sectionsTable.register(LevelsTableViewCell.nib(), forCellReuseIdentifier: LevelsTableViewCell.identifier)
        sectionsTable.register(ButtonsSectionTableViewCell.nib(), forCellReuseIdentifier: ButtonsSectionTableViewCell.identifier)
    }
}

// MARK: - TableViewDataSource
extension MainViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            guard let cell = sectionsTable.dequeueReusableCell(withIdentifier: HeaderAndButtonTableViewCell.identifier, for: indexPath) as? HeaderAndButtonTableViewCell
            else { return HeaderAndButtonTableViewCell() }
            
            cell.setHeaderLabel(to: "Уровни")
            
            return cell
        } else if indexPath.row == 1 {
            guard let cell = sectionsTable.dequeueReusableCell(withIdentifier: LevelsTableViewCell.identifier, for: indexPath) as? LevelsTableViewCell
            else { return LevelsTableViewCell() }
            
            return cell
        } else if indexPath.row == 2 {
            guard let cell = sectionsTable.dequeueReusableCell(withIdentifier: HeaderAndButtonTableViewCell.identifier, for: indexPath) as? HeaderAndButtonTableViewCell
            else { return HeaderAndButtonTableViewCell() }
            
            cell.setHeaderLabel(to: "Возможности")
        } else if indexPath.row == 3 {
            guard let cell = sectionsTable.dequeueReusableCell(withIdentifier: ButtonsSectionTableViewCell.identifier, for: indexPath) as? ButtonsSectionTableViewCell
            else { return ButtonsSectionTableViewCell() }
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 44
        } else if indexPath.row == 1 {
            return view.frame.height / 2.5
        } else if indexPath.row == 2 {
            return 44
        } else if indexPath.row == 3 {
            return 150
        }
                
        return CGFloat()
    }
}

extension MainViewController : UITableViewDelegate {

}
