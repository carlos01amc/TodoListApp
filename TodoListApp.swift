//
//  TodoListApp.swift
//  TodoList
//
//  Created by Carlos Costa on 15/09/2025.
//

import SwiftUI

@main
struct TodoListApp: App {
    var body: some Scene {
        WindowGroup {
            TaskListView()
        }
        .modelContainer(for: Task.self)
    }
}
