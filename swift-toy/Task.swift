//
//  Task.swift
//  swift-toy
//
//  Created by Kevin Knight on 11/10/23.
//

import Foundation


struct Task: Identifiable, Equatable {
    let id = UUID()
    var title: String
    var copy: String
    var isCompleted: Bool
}
