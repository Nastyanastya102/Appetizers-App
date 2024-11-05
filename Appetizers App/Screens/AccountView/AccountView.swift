//
//  AccountView.swift
//  Appetizers App
//
//  Created by Nastya Klyashtorna on 2024-10-29.
//

import SwiftUI
import Foundation

struct AccountView: View {
    @FocusState private var focus: FormTextField?
    @StateObject var mv = AccountViewModel()
    
    enum FormTextField {
        case firstName, lastName, email
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Personal Info")) {
                        TextField("First Name", text: $mv.user.firstName)
                            .focused($focus, equals: .firstName)
                            .onSubmit {
                                focus = .lastName
                            }
                            .submitLabel(.next)
                        TextField("Last Name", text: $mv.user.lastName)
                            .focused($focus, equals: .lastName)
                            .onSubmit {
                                focus = .email
                            }
                            .submitLabel(.next)
                        TextField("Email", text: $mv.user.email)
                            .focused($focus, equals: .email)
                            .keyboardType(.emailAddress)
                            .autocorrectionDisabled(true)
                            .autocapitalization(.none)
                            .onSubmit {
                                focus = nil
                            }
                            .submitLabel(.done)
                        DatePicker("Birthday", selection: $mv.user.birthday, displayedComponents: .date)
                    }
                    Section(header: Text("Settings")) {
                        Toggle("Extra Naplkins", isOn: $mv.user.extraNapkins)
                        Toggle("Reffils", isOn: $mv.user.refills)
                    }
                    .toggleStyle(SwitchToggleStyle(tint: Color.BrandPrimary))
                    Section {
                        Button("Reset All Content and Settings") {}.foregroundColor(Color.red)
                        Button("Save") {
                            mv.saveChanges()
                        }
                    }
                }
            }
            .navigationTitle("Account 👑")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss") {
                        focus = nil
                    }
                }
            }
        }
        .alert(item: $mv.alertItem) { alert in
            Alert(title: alert.title, message: alert.message, dismissButton: .default(Text("OK")))
        }
        .onAppear() {
            mv.retriveUser()
        }
        
    }
}

#Preview {
    AccountView()
}
