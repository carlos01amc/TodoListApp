//
//  DetailTaskView.swift
//  TodoList
//
//  Created by Carlos Costa on 15/09/2025.
//

import SwiftUI
import SwiftData

struct DetailTaskView: View {
    
    @Bindable var task: Task
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    
    
    var body: some View {
        VStack{
            Form {
                Section(header: Text("Task Details")) {
                    TextField("Title", text: $task.title)
                    
                }
                Section(header: Text("Task Description")) {
                    TextEditor(text: Binding(
                        get: { task.taskDescription ?? "" },
                        set: { task.taskDescription = $0 }
                    ))
                    .frame(height: 400)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    do {
                        try modelContext.save()
                        dismiss()
                    } catch {
                        print("Error saving task: \(error)")
                    }
                } label: {
                    Text("Save")
                }
                
            }
            ToolbarItem(placement: .cancellationAction){
                Button("Cancel") { dismiss() }
            }
            ToolbarItem(placement: .bottomBar){
                Button(action: {
                    modelContext.delete(task)
                    dismiss()
                } ) {
                    Image(systemName: "trash")
                }
            }
        }
    }
    
}

#Preview {
    DetailTaskView(task: MockData.sampleTasks[0])
}
