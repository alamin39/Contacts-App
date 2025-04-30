//
//  ContactsView.swift
//  ContactList
//
//  Created by Al-Amin on 2025/04/26.
//

import SwiftUI

struct ContactsView: View {
    @State private var searchText: String = ""
    @State private var showAddContactView = false
    @State private var viewModel = ContactsViewModel()
    
    var searchResults: [Contact] {
        viewModel.searchContact(for: searchText)
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(searchResults) { contact in
                    NavigationLink(value: contact) {
                        ContactRowView(contact: contact)
                            .swipeActions {
                                Button {
                                    withAnimation {
                                        viewModel.deleteContact(contact)
                                    }
                                } label: {
                                    Image(systemName: "trash")
                                }
                                .tint(.red)
                            }
                    }
                }
                .padding(.vertical, 4)
            }
            .navigationDestination(for: Contact.self) { contact in
                EditContactView(contact: contact)
                    .environment(viewModel)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showAddContactView.toggle()
                    }
                    label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddContactView) {
                AddContactView()
                    .presentationDetents([.height(300)])
                    .environment(viewModel)
            }
            .navigationTitle("Contacts")
            .searchable(text: $searchText)
        }
    }
}

#Preview {
    ContactsView()
}
