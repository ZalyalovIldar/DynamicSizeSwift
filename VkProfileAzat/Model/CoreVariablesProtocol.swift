//
//  CoreVariablesProtocol.swift
//  VkProfileAzat
//
//  Created by Азат Алекбаев on 16.10.2017.
//  Copyright © 2017 Азат Алекбаев. All rights reserved.
//

import Foundation
protocol CoreVariables {
    var sectionType: CoreSections{get}
    var sectionName: String {get}
    var rowCount: Int {get}
}
