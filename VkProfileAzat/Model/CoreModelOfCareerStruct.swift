//
//  CoreModelOfCareerStruct.swift
//  VkProfileAzat
//
//  Created by Азат Алекбаев on 16.10.2017.
//  Copyright © 2017 Азат Алекбаев. All rights reserved.
//

import Foundation
struct CoreModelOfCareer: CoreVariables {
    var companyName: String
    var location: String
    var position: String
    
    var sectionType: CoreSections {
        return .career
    }
    
    var sectionName: String {
        return "Карьера"
    }
    var rowCount: Int {
        return 1
    }
}
