//
//  AccountViewModel.swift
//  Appetizers App
//
//  Created by Nastya Klyashtorna on 2024-11-03.
//
import Foundation
import SwiftUI

final class AccountViewModel: ObservableObject {
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var birthday = Date()
    @Published var extraNapkins = false
    @Published var refills = true
    
    @Published var alertItem: AlertItem?
    
    var isValidForm: Bool {
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard email.validateEmail() else {
            alertItem = AlertContext.invalidEmail
            return false }
        
        return true
    }
    
    func saveChanges () {
        guard isValidForm else { return }
    }
}
