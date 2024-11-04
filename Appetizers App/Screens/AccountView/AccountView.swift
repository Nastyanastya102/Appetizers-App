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
                        TextField("First Name", text: $mv.user.firstName)
                        TextField("Last Name", text: $mv.user.lastName)
                        TextField("Email", text: $mv.user.email)
                            .keyboardType(.emailAddress)
                            .autocorrectionDisabled(true)
                            .autocapitalization(.none)
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
