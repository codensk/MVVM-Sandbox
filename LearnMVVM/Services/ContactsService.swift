//
//  ContactsService.swift
//  LearnMVVM
//
//  Created by SERGEY VOROBEV on 19.07.2021.
//

final class ContactsService: ContactsServiceProtocol {
    func getContacts() -> [Contact] {
        let demoData = [Contact(firstName: "Сергей", lastName: "Воробьев", age: 33),
                        Contact(firstName: "Вася", lastName: "Пупкин", age: 27),
                        Contact(firstName: "Джон", lastName: "Смит", age: 37),
                        Contact(firstName: "Артур", lastName: "Пирожков", age: 40)]
        
        return demoData
    }
}
