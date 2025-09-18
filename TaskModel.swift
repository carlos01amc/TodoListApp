//
//  TaskModel.swift
//  TodoList
//
//  Created by Carlos Costa on 15/09/2025.
//

import Foundation
import SwiftData

@Model
final class Task: Identifiable, Hashable {
    
    @Attribute(.unique) var id: UUID
    var title: String
    var isCompleted: Bool
    var taskDescription: String?
    
    init(id: UUID = UUID(), title: String, isCompleted: Bool = false, taskDescription: String? = nil) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.taskDescription = taskDescription
    }
}

struct MockData {
    
    static let sampleTasks: [Task] = [
        Task(title: "Buy groceries", taskDescription: "Milk, Eggs, Bread"),
        Task(title: "Walk the dog",taskDescription: "Evening walk in the park"),
        Task(title: "Workout", taskDescription: "30 minutes of cardio"),
        Task(title: "Finish project report",taskDescription: "Due by end of the week"),
        Task(title: "Plan weekend trip", taskDescription: "Look for destinations and accommodations"),
        Task(title: "Read a book", taskDescription: "Start 'The Great Gatsby'"),
        Task(title: "Call mom", taskDescription: "Catch up and see how she's doing"),
    ]
}

