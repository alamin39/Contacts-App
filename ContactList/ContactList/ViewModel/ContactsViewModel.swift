//
//  ContactsViewModel.swift
//  ContactList
//
//  Created by Al-Amin on 2025/04/29.
//

import Observation

@Observable
class ContactsViewModel {
    var contacts: [Contact] = []
    
    init() {
        fetchContacts()
    }
    
    func fetchContacts() {
        contacts = [
            .init(firstName: "Al-Amin", lastName: "Hossain", email: "alamin@gmail.com"),
            .init(firstName: "Goni", lastName: "Amin", email: "Goni@gmail.com"),
            .init(firstName: "Karim", lastName: "Hossain", email: "Karim@gmail.com"),
            .init(firstName: "Rabby", lastName: "Hossain", email: "Rabby@yahoo.com"),
            .init(firstName: "Ismail", lastName: "Hossain", email: "Ismail@gmail.com"),
            .init(firstName: "Al-Amin", lastName: "Hossain", email: "alamin@gmail.com"),
            .init(firstName: "Goni", lastName: "Amin", email: "Goni@gmail.com"),
            .init(firstName: "Karim", lastName: "Hossain", email: "Karim@gmail.com"),
            .init(firstName: "Rabby", lastName: "Hossain", email: "Rabby@yahoo.com"),
            .init(firstName: "Ismail", lastName: "Hossain", email: "Ismail@gmail.com")
        ]
    }
    
    func addContact(_ contact: Contact) {
        contacts.append(contact)
    }
    
    func deleteContact(_ contact: Contact) {
        guard let index = contacts.firstIndex(where: { $0.id == contact.id }) else {
            return
        }
        contacts.remove(at: index)
    }
    
    func updateContact(_ contact: Contact) {
        guard let index = contacts.firstIndex(where: { $0.id == contact.id }) else {
            return
        }
        contacts[index] = contact
    }
    
    func searchContact(for query: String) -> [Contact] {
        guard !query.isEmpty else {
            return contacts
        }
        
        return contacts.filter {
            $0.firstName.localizedCaseInsensitiveContains(query) ||
            $0.lastName.localizedCaseInsensitiveContains(query) ||
            $0.email.localizedCaseInsensitiveContains(query)
        }
    }
}
