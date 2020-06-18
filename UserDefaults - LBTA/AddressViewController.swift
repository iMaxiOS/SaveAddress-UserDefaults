//
//  AddressViewController.swift
//  UserDefaults - LBTA
//
//  Created by Maxim Granchenko on 18.06.2020.
//  Copyright © 2020 Maxim Granchenko. All rights reserved.
//

import UIKit

class AddressViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
}

extension AddressViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Base.shared.addresses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        if let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell") {
            cell = myCell
        } else {
            cell = UITableViewCell()
        }
        
        cell.textLabel?.text = Base.shared.addresses[indexPath.row].name
        
        return cell
    }
}
