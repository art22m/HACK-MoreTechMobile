//
//  ThirdIntroViewController.swift
//  VTBFinance
//
//  Created by Артём Мурашко on 10.10.2021.
//

import UIKit

class ThirdIntroViewController: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    
    let defaults = UserDefaults.standard
    var delegate: IntroDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let name = defaults.string(forKey: "userName")
        let decision = defaults.string(forKey: "userIntroChoice")
        if let decision = decision {
            switch decision {
            case "Пойду в бар отпраздновать находку":
                textLabel.text = "Жаль, что ты потратил почти все деньги, но ничего, ты повеселился, а начать инвестировать можно и со ста рублей."
                delegate?.updateBalance(newBalance: "2000.00")
                defaults.set(2000.00, forKey: "balance")
            case "Положу под подушку":
                textLabel.text = "На душе стало спокойнее... но денег стало меньше. Давай я расскажу как сохранить и приумножить капитал."
                delegate?.updateBalance(newBalance: "4500.00")
                defaults.set(4500.00, forKey: "balance")
            case "Открою вклад в банке":
                textLabel.text = "Хороший выбор, но твоя прибыль может быть куда больше. Давай расскажу как это работает."
                delegate?.updateBalance(newBalance: "5000.00")
                defaults.set(5000.00, forKey: "balance")
            default:
                textLabel.text = "А ты любишь авантюры! Получилось очень даже неплохо, давай расскажу какие ещё есть способы увеличить капитал."
                delegate?.updateBalance(newBalance: "7000.00")
                defaults.set(7000.00, forKey: "balance")
            }
        }
    }
    
    @IBAction func startTapped(sender: UIButton) {
        view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
}
