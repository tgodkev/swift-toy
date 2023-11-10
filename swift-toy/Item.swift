//
//  Item.swift
//  swift-toy
//
//  Created by Kevin Knight on 11/10/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    var name: String
    var age: Int
    
    init(timestamp: Date, name: String, age: Int) {
        self.timestamp = timestamp
        self.name = name
        self.age = age
    }
}
