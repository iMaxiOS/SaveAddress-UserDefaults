//
//  NewAddressViewController.swift
//  UserDefaults - LBTA
//
//  Created by Maxim Granchenko on 18.06.2020.
//  Copyright © 2020 Maxim Granchenko. All rights reserved.
//

import UIKit

class NewAddressViewController: UIViewController {
    
    fileprivate let userDefaults = UserDefaults.standard
    
    @IBOutlet weak var countyTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var houseTextField: UITextField!
    @IBOutlet weak var buildTextField: UITextField!
    @IBOutlet weak var apartmentTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func saveButton(sender: Any) {
        
        let country = countyTextField.text!
        let city = cityTextField.text!
        let house = houseTextField.text!
        let build = buildTextField.text!
        let apartament = apartmentTextField.text!
        
        if !country.isEmpty && !city.isEmpty && !house.isEmpty && !build.isEmpty && !apartament.isEmpty {
            Base.shared.saveAddress(country: country, city: city, house: house, build: build, apartment: apartament)
            
            let alert = UIAlertController(title: "Uhhhu", message: "You`re writting all there fields", preferredStyle: .alert)
            let Ok = UIAlertAction(title: "Ok", style: .default) { _ in
                self.navigationController?.popToRootViewController(animated: true)
            }
            alert.addAction(Ok)
            present(alert, animated: true)
        } else {
            let alert = UIAlertController(title: "Fields don`t correct", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true, completion: nil)
        }
        
        
    }
}
