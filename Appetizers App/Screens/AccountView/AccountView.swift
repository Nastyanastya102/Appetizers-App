//
//  AccountView.swift
//  Appetizers App
//
//  Created by Nastya Klyashtorna on 2024-10-29.
//

import SwiftUI

struct AccountView: View {
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var birthday = Date()
    @State var extraNapkins = false
    @State var refills = true
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Personal Info")) {
                        TextField("First Name", text: $firstName)
                        TextField("Last Name", text: $lastName)
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .autocorrectionDisabled(true)
                            .autocapitalization(.none)
                        DatePicker("Birthday", selection: $birthday, displayedComponents: .date)
                    }
                    Section(header: Text("Settings")) {
                        Toggle("Extra Naplkins", isOn: $extraNapkins)
                        Toggle("Reffils", isOn: $refills)
                    }
                    .toggleStyle(SwitchToggleStyle(tint: Color.BrandPrimary))
                    Section {
                        Button("Reset All Content and Settings") {}.foregroundColor(Color.red)
                        Button("Save") {}
                    }
              
                }
            }
            .navigationTitle("Account 👑")
        }
    }
}

#Preview {
    AccountView()
}
