//
//  CoreModelOfGiftsStruct.swift
//  VkProfileAzat
//
//  Created by Азат Алекбаев on 16.10.2017.
//  Copyright © 2017 Азат Алекбаев. All rights reserved.
//

import Foundation
struct CoreModelOfGifts: CoreVariables {
    var sectionType: CoreSections {
        return .gifts
    }
    var sectionName: String {
        return "Подарки"
    }
    
    var rowCount: Int {
        return 1
    }
    var numberOfPresets = 20
}
