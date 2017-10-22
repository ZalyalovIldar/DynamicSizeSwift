//
//  CoreModelOfMainInfoStruct.swift
//  VkProfileAzat
//
//  Created by Азат Алекбаев on 16.10.2017.
//  Copyright © 2017 Азат Алекбаев. All rights reserved.
//

import Foundation
struct CoreModelOfMainInfo: CoreVariables {
    var sectionType: CoreSections {
        return .mainInfo
    }
    var mainInfo:[MainInfo]
    
    var rowCount: Int {
        return mainInfo.count
    }
    
    var sectionName: String {
        return " "
        
    }
    
}
