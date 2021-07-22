//
//  ViewController.swift
//  lesson3
//
//  Created by Veronika Shadlovskaya on 20.07.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addingResultLabel: UILabel!
    @IBOutlet weak var guessNumberLabel: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        let alertController = UIAlertController(
            title: "Привет".localized(),
            message: "Введите имя".localized(),
            preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default) { (action) in
            let name = alertController.textFields?.first?.text
            if let name = name {
                self.nameLabel.text = "\("Привет".localized()), \(name)!"
            }
        }
        
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(action)
        self.present(alertController, animated: true)
    }
    
    @IBAction func add(_ sender: Any) {
        let alertController = UIAlertController(
            title: "Сложение".localized(),
            message: "Введите два числа".localized(),
            preferredStyle: .alert)
        let action = UIAlertAction(title: "Сложить".localized(), style: .default) { (action) in
            let a = alertController.textFields?[0].text ?? ""
            let b = alertController.textFields?[1].text ?? ""
            if let firstValue = Int(a), let secondValue = Int(b) {
                self.addingResultLabel.text = "\(firstValue) + \(secondValue) = \(firstValue + secondValue)"
            }else{
                self.addingResultLabel.text = "Неверно введены числа".localized()
            }
        }
        
        alertController.addTextField(configurationHandler: nil)
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(action)
        self.present(alertController, animated: true)
    }
    

    @IBAction func guessNumber(_ sender: Any) {
        let secretNumber = Int.random(in: 0...10)
        
        let alertController = UIAlertController(
            title: "Угадай число".localized(),
            message: "Введи число от 0 до 10".localized(),
            preferredStyle: .alert)
        let action = UIAlertAction(title: "Угадал?".localized(), style: .default) { (action) in
            let guess = alertController.textFields?.first?.text ?? ""
            if let guess = Int(guess){
                if(guess == secretNumber){
                    self.guessNumberLabel.text = "\("Правильно! Загаданное число".localized()) \(secretNumber)"
                }else{
                    self.guessNumberLabel.text = "Не угадал".localized()
                }
            }else{
                self.guessNumberLabel.text = "Нужно вводить число".localized()
            }
        }
        
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(action)
        self.present(alertController, animated: true)
    }
}

extension String {
    func localized() -> String {
        return NSLocalizedString(
            self,
            tableName: "Localizable",
            bundle: .main,
            value: self,
            comment: self)
    }
}
