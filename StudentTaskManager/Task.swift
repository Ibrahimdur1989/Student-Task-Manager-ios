//
//  Task.swift
//  StudentTaskManager
//
//  Created by Group 7 on 2026-03-18.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    var title: String
    var dueDate: Date
    var status: String
    var notes: String
}
