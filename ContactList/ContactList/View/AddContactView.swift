//
//  AddContactView.swift
//  ContactList
//
//  Created by Al-Amin on 2025/04/26.
//

import SwiftUI

struct AddContactView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(ContactsViewModel.self) private var viewModel
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("First name", text: $firstName)
                
                TextField("Last name", text: $lastName)
                
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
            }
            .navigationTitle("New Contact")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        addContact()
                        dismiss()
                    }
                    .font(.headline)
                }
            }
        }
    }
}

private extension AddContactView {
    func addContact() {
        viewModel.addContact(Contact(firstName: firstName, lastName: lastName, email: email))
    }
}
