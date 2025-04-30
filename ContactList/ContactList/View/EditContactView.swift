//
//  EditContactView.swift
//  ContactList
//
//  Created by Al-Amin on 2025/04/27.
//

import SwiftUI

struct EditContactView: View {
    @State private var contact: Contact
    @State private var didChangeContact = false
    @State private var showExitConfirmation = false
    @State private var showDeleteConfirmation = false
    
    @Environment(ContactsViewModel.self) private var viewModel
    @Environment(\.dismiss) private var dismiss
    
    private let originalContact: Contact
    
    init(contact: Contact) {
        _contact = State(initialValue: contact)
        originalContact = contact
    }
    
    var body: some View {
        VStack {
            Form {
                TextField("First name", text: $contact.firstName)
                
                TextField("Last name", text: $contact.lastName)
                
                TextField("Email", text: $contact.email)
                    .keyboardType(.emailAddress)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
            }
            
            Spacer()
            
            Button("Delete Contact") {
                showDeleteConfirmation.toggle()
            }
            .frame(width: 280, height: 60)
            .foregroundStyle(.white)
            .background(.blue)
            .clipShape(.capsule)
            .shadow(color: .black.opacity(0.2), radius: 4)
            .padding()
        }
        .navigationTitle("Edit Contact")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .onChange(of: contact, { oldValue, newValue in
            didChangeContact = newValue != originalContact
        })
        .alert("Unsaved Changes", isPresented: $showExitConfirmation, actions: {
            Button("Stay", role: .cancel) { }
            Button("Discard Changes", role: .destructive) {
                dismiss()
            }
        })
        .alert("Delete Contact?", isPresented: $showDeleteConfirmation, actions: {
            Button("Cancel", role: .cancel) { }
            Button("Delete", role: .destructive) {
                deleteContact()
            }
        })
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    onCancel()
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    updateContact()
                }
                .disabled(!didChangeContact)
                .opacity(didChangeContact ? 1.0 : 0.5)
                .font(.headline)
            }
        }
    }
}

private extension EditContactView {
    func deleteContact() {
        viewModel.deleteContact(contact)
        dismiss()
    }
    
    func updateContact() {
        viewModel.updateContact(contact)
        dismiss()
    }
    
    func onCancel() {
        if didChangeContact {
            showExitConfirmation = true
        } else {
            dismiss()
        }
    }
}

#Preview {
    EditContactView(contact: .init(firstName: "al", lastName: "amin", email: "alamin@gmail.com"))
        .environment(ContactsViewModel())
}
