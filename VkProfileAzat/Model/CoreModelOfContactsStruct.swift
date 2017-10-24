//
//  CoreModelOfContactsStruct.swift
//  VkProfileAzat
//
//  Created by Азат Алекбаев on 16.10.2017.
//  Copyright © 2017 Азат Алекбаев. All rights reserved.
//

import Foundation
struct CoreModelOfContacts: CoreVariables {
    var sectionType: CoreSections {
        return .contacts
    }
    var sectionName: String {
        return "Контакты"
    }
    var contacts: [Contacts]
    
    var rowCount: Int {
        return contacts.count
    }
    
}
