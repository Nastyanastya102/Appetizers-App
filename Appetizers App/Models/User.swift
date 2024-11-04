//
//  User.swift
//  Appetizers App
//
//  Created by Nastya Klyashtorna on 2024-11-03.
//

import Foundation

struct User: Codable {
    var id = UUID()
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthday = Date()
    var extraNapkins = false
    var refills = false
}

