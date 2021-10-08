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
        sectionsTable.register(LevelsTableViewCell.nib(), forCellReuseIdentifier: LevelsTableViewCell.identifier)
    }


}

extension MainViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = sectionsTable.dequeueReusableCell(withIdentifier: LevelsTableViewCell.identifier, for: indexPath) as? LevelsTableViewCell else { return LevelsTableViewCell() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.row == 0) {
            return view.frame.height / 2.5
        }

        return CGFloat()
    }
}

extension MainViewController : UITableViewDelegate {

}
