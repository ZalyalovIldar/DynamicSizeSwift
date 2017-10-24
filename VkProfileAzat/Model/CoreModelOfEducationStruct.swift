//
//  CoreModelOfEducationStruct.swift
//  VkProfileAzat
//
//  Created by Азат Алекбаев on 16.10.2017.
//  Copyright © 2017 Азат Алекбаев. All rights reserved.
//

import Foundation
struct CoreModelOfEducation: CoreVariables {
    var sectionType: CoreSections {
        return .education
    }
    
    var sectionName: String {
        return "Образование"
    }
    var educationArray:[Education]
    
    var rowCount: Int {
        return educationArray.count
    }
}
