//
//  ContentView.swift
//  TodoList
//
//  Created by Carlos Costa on 15/09/2025.
//

import SwiftUI
import SwiftData

struct TaskListView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var taskList: [Task]
    @State private var navPath: [Task] = []
    
    var body: some View {
        NavigationStack(path: $navPath) {
            ZStack{
                if taskList.isEmpty {
                    Text("No tasks available")
                        .foregroundStyle(.secondary)
                        .font(.title3)
                        .padding(.bottom, 100)
                } else {
                    List {
                        ForEach(taskList) { task in
                            CardView(task: task)
                        }
                        .onDelete { indexSet in
                            for index in indexSet {
                                modelContext.delete(taskList[index])
                            }
                        }
                    }
                }
            }
            .navigationTitle("📋 Todo List")
            .navigationDestination(for: Task.self) { task in
                DetailTaskView(task: task)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        let newTask = Task(id: UUID(), title: "New Task", isCompleted: false, taskDescription: "")
                        modelContext.insert(newTask)
                        navPath.append(newTask)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    TaskListView()
        .modelContainer(for: [Task.self], inMemory: true)
}
