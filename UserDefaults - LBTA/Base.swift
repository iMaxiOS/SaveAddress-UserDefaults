//
//  Base.swift
//  UserDefaults - LBTA
//
//  Created by Maxim Granchenko on 18.06.2020.
//  Copyright © 2020 Maxim Granchenko. All rights reserved.
//

import Foundation

class Base {
    
    static let shared = Base()
    let userDefault = UserDefaults.standard
    
    struct UserAddress: Codable {
        let country: String
        let city: String
        let house: String
        let build: String
        let apartment: String
        var name: String {
            return "\(country) • \(city) • \(house) • \(build) • \(apartment)"
        }
    }
    
    var addresses: [UserAddress] {
        get {
            if let data = userDefault.value(forKey: "addresses") as? Data {
                return try! PropertyListDecoder().decode([UserAddress].self, from: data)
            } else {
                return [UserAddress]()
            }
            
        } set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                userDefault.set(data, forKey: "addresses")
            }
        }
    }
    
    public func saveAddress(country: String, city: String, house: String, build: String, apartment: String) {
        let address = UserAddress(country: country, city: city, house: house, build: build, apartment: apartment)
        addresses.insert(address, at: 0)
    }
}
