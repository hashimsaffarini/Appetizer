//
//  User.swift
//  Appetizer
//
//  Created by Hashim Saffarini on 31/01/2026.
//

import Foundation

struct User : Codable {
    var firstName       = ""
    var lastName        = ""
    var email           = ""
    var date            = Date()
    var extraNapkins    = false
    var frequentRefills = false
}
