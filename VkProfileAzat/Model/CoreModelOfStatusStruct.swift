//
//  CoreModelOfStatusStruct.swift
//  VkProfileAzat
//
//  Created by Азат Алекбаев on 16.10.2017.
//  Copyright © 2017 Азат Алекбаев. All rights reserved.
//

import Foundation
struct CoreModelOfStatus: CoreVariables {
    var sectionType: CoreSections {
        return .status
    }
    
    var sectionName: String {
        return " "
    }
    
    var rowCount: Int {
        return 1
    }
    var status: String
}
