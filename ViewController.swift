//
//  ViewController.swift
//  PassingDataPracticeNTQ
//
//  Created by Dat, Dinh Tien on 28/09/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(notificationReceived), name: Notification.Name("name"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(notificationReceived), name: Notification.Name("age"), object: nil)
    }
    

    
    // MARK: LIFE CYCLE
    @objc func notificationReceived(_ notification: Notification) {
        if notification.name.rawValue == "name" {
            let name = notification.object as! String?
            nameLabel.text = name
        }
        if notification.name.rawValue == "age"
        {
            let age = notification.object as! String?
            ageLabel.text = age
        }
    }
    
    @IBAction func btnClick(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "second") as! SecondViewController
        vc.delegate = self
        vc.completionHandler = { [weak self]
            name, age in
            self?.ageLabel.text = age
            self?.nameLabel.text = name
        }
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        
    }
    
}

// MARK: SecondViewControllerDelegate
extension ViewController: SecondViewControllerDelegate {
    func saveData(name: String, age: String) {
        ageLabel.text = age
        nameLabel.text = name
    }
}
