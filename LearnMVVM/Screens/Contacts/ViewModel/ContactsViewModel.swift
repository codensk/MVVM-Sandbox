//
//  ContactsViewModel.swift
//  LearnMVVM
//
//  Created by SERGEY VOROBEV on 19.07.2021.
//
import Foundation

class ContactsViewModel {
    private var contactsService: ContactsServiceProtocol
    private var contacts: [Contact] = []
    
    var contactTableCellViewModels = [ContactTableCellViewModel]() {
        didSet {
            
        }
    }
    
    init(contactsService: ContactsServiceProtocol) {
        self.contactsService = contactsService
    }
    
    func fetchContacts() {
        contacts = contactsService.getContacts()
        
        var contactViewModels = [ContactTableCellViewModel]()
        
        contacts.forEach { contact in
            contactViewModels.append(createCellModel(contact: contact))
        }
        
        contactTableCellViewModels = contactViewModels
    }
    
    func createCellModel(contact: Contact) -> ContactTableCellViewModel {
        return ContactTableCellViewModel(fullName: "\(contact.firstName) \(contact.lastName)", age: contact.age)
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> ContactTableCellViewModel {
        return contactTableCellViewModels[indexPath.row]
    }
    
    func viewModelForSelectedContact(for indexPath: IndexPath) -> DetailsViewModel {
        return DetailsViewModel(for: contacts[indexPath.row])
    }
}
