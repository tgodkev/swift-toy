//
//  Task.swift
//  swift-toy
//
//  Created by Kevin Knight on 11/10/23.
//

import Foundation


struct Task: Identifiable{
    var id = UUID()
    var title: String
    var isCompleted: Bool = false
}
