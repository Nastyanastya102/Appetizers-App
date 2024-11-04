//
//  AccountViewModel.swift
//  Appetizers App
//
//  Created by Nastya Klyashtorna on 2024-11-03.
//
import Foundation
import SwiftUI

final class AccountViewModel: ObservableObject {
    @AppStorage("user") private var userData: Data?
    
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard user.email.validateEmail() else {
            alertItem = AlertContext.invalidEmail
            return false }
        
        return true
    }
    
    func saveChanges () {
        guard isValidForm else { return }
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSaveSuccess
        } catch {
            alertItem = AlertContext.userSaveFailed
        }
    }
    
    func retriveUser () {
        guard let userData = userData else { return }
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            alertItem = AlertContext.invalidData
        }
    }
}
