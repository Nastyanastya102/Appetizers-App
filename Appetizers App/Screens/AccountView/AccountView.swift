//
//  AccountView.swift
//  Appetizers App
//
//  Created by Nastya Klyashtorna on 2024-10-29.
//

import SwiftUI

struct AccountView: View {
    @StateObject var mv = AccountViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Personal Info")) {
                        TextField("First Name", text: $mv.firstName)
                        TextField("Last Name", text: $mv.lastName)
                        TextField("Email", text: $mv.email)
                            .keyboardType(.emailAddress)
                            .autocorrectionDisabled(true)
                            .autocapitalization(.none)
                        DatePicker("Birthday", selection: $mv.birthday, displayedComponents: .date)
                    }
                    Section(header: Text("Settings")) {
                        Toggle("Extra Naplkins", isOn: $mv.extraNapkins)
                        Toggle("Reffils", isOn: $mv.refills)
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
        }
        .alert(item: $mv.alertItem) { alert in
            Alert(title: alert.title, message: alert.message, dismissButton: .default(Text("OK")))
        }
        
    }
}

#Preview {
    AccountView()
}
