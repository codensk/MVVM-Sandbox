//
//  DetailsViewModel.swift
//  LearnMVVM
//
//  Created by SERGEY VOROBEV on 19.07.2021.
//

import Foundation

class DetailsViewModel {
    var contact: Box<Contact?> = Box(nil)
    
    init(for contact: Contact) {
        self.contact = Box(contact)
    }
}
