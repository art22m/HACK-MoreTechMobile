//
//  SecondIntroViewController.swift
//  VTBFinance
//
//  Created by Артём Мурашко on 10.10.2021.
//

import UIKit

class SecondIntroViewController: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    let defaults = UserDefaults.standard
    var delegate: IntroDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Button settings
        
        button1.layer.cornerRadius = 15
        button2.layer.cornerRadius = 15
        button3.layer.cornerRadius = 15
        button4.layer.cornerRadius = 15
        
        // Label settings
        
        let name = defaults.string(forKey: "userName")
        if let name = name {
            textLabel.text = "Недавно один мой друг \(name) разбирал старые вещи и нашёл в кармане 5000 рублей."
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showThirdIntro" {
            if let nextViewController = segue.destination as? ThirdIntroViewController {
                nextViewController.delegate = self.delegate
            }
        }
    }

    @IBAction func buttonTapped(sender: UIButton) {
        defaults.set(sender.titleLabel?.text, forKey: "userIntroChoice")
        performSegue(withIdentifier: "showThirdIntro", sender: self)
    }
}
