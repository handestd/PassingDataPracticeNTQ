//
//  SecondViewController.swift
//  PassingDataPracticeNTQ
//
//  Created by Dat, Dinh Tien on 28/09/2022.
//

import UIKit

protocol SecondViewControllerDelegate: NSObjectProtocol {
    func saveData(name: String, age: String)
}

class SecondViewController: UIViewController {
    var completionHandler: ((String, String) -> Void)?
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    
    
    @IBAction func didTabSave(_ sender: UIButton) {
        if let dele = self.delegate {
            dele.saveData(name: nameField.text ?? "", age: ageField.text ?? "")
            dismiss(animated: true)
        }
        
    }
    
    @IBAction func didTabClosure(_ sender: Any) {
        completionHandler?(nameField.text ?? "", ageField.text ?? "")
        dismiss(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var name: String = ""
    var age: String = ""
    var delegate: SecondViewControllerDelegate?
    
    func saveData(name: String, age: String)
    {
        self.name = name
        self.age = age
    }

    @IBAction func didTabNotificationCenter(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name("name"), object: nameField.text)
        NotificationCenter.default.post(name: Notification.Name("age"), object: ageField.text)
        dismiss(animated: true)
    }
}
