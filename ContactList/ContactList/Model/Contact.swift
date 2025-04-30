//
//  Contact.swift
//  ContactList
//
//  Created by Al-Amin on 2025/04/26.
//

import SwiftUI

struct Contact: Identifiable, Hashable {
    let id = UUID()
    var firstName: String
    var lastName: String
    var email: String
    
    var initials: String {
        let first = firstName.prefix(1).uppercased()
        let last = lastName.prefix(1).uppercased()
        
        return first + last
    }
}
