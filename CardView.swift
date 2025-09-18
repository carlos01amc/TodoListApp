//
//  CardView.swift
//  TodoList
//
//  Created by Carlos Costa on 17/09/2025.
//
import SwiftUI
import SwiftData

struct CardView: View{
    
    @Bindable var task: Task
    
    var body: some View {
        
        NavigationLink(value: task) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Image(systemName: "circle.fill")
                            .font(.system(size: 6))
                            .foregroundColor(.secondary)
                        
                        Text(task.title)
                            .font(.headline)
                            .foregroundStyle(.primary)
                    }
                    
                    if let description = task.taskDescription, !description.isEmpty {
                        Text(description)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .lineLimit(1)
                    }
                }
                
                Spacer()
                
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(task.isCompleted ? .green : .gray)
                    .onTapGesture {
                        task.isCompleted.toggle()
                    }
            }
            
        }
        .frame(minHeight: 80)
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
        .listRowSeparator(.hidden)
        .listRowBackground(Color.clear)
        .listRowInsets(EdgeInsets())
        .padding(.vertical,10)
        
        
    }
}


