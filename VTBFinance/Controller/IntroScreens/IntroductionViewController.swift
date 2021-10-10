//
//  IntroductionViewController.swift
//  VTBFinance
//
//  Created by Артём Мурашко on 10.10.2021.
//

import UIKit

class IntroductionViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var nameField: UITextField!
    
    let defaults = UserDefaults.standard
    var delegate: IntroDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameField.delegate = self
    }
    
    @IBAction func skipTapped() {
//        defaults.set("Иван", forKey: "userName")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSecondIntro" {
            if let nextViewController = segue.destination as? SecondIntroViewController {
                nextViewController.delegate = self.delegate
            }
        }
    }
}

extension IntroductionViewController: UITextViewDelegate {
    // Hide key board when the user touches outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if (textField.hasText) {
            defaults.set(textField.text ?? "", forKey: "userName")
            performSegue(withIdentifier: "showSecondIntro", sender: self)
        }
        
        return true
    }
}

