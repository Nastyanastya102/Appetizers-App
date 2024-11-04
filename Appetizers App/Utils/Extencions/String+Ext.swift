//
//  String+Ext.swift
//  Appetizers App
//
//  Created by Nastya Klyashtorna on 2024-11-03.
//

import Foundation

extension String {
    func validateEmail() -> Bool {
        let emailRegEx = "^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}
