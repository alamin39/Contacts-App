//
//  ContactRowView.swift
//  ContactList
//
//  Created by Al-Amin on 2025/04/26.
//

import SwiftUI

struct ContactRowView: View {
    var contact: Contact
    
    var body: some View {
        HStack(spacing: 12) {
            Text(contact.initials)
                .foregroundStyle(.white)
                .frame(width: 48, height: 48)
                .background(Color(.systemGray4))
                .clipShape(.circle)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(contact.firstName + " " + contact.lastName)
                    .font(.headline)
                
                Text(contact.email)
                    .font(.subheadline)
                    .foregroundStyle(.cyan)
            }
            
            Spacer()
        }
    }
}

#Preview {
    ContactRowView(contact:
                    Contact(firstName: "Al-Amin", lastName: "Hossain", email: "alamin@gmail.com"))
}
