//
//  ContentView.swift
//  EditTaskView.txt
//
//  Created by Macbook on 2026-03-23.
//

import SwiftUI

struct EditTaskView: View {
    
    @Binding var task: Task
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
       ZStack {
            Color(red: 0.84, green: 0.91, blue: 0.98)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                
                Text("Edit Task")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("Task Title")
                    .font(.headline)
                
                TextField("Enter task title", text: $task.title)
                    .textFieldStyle(.roundedBorder)
                
                Text("Due Date")
                    .font(.headline)
                
                TextField("Enter due date", text: $task.dueDate)
                    .textFieldStyle(.roundedBorder)
                
                Text("Status")
                    .font(.headline)
                
                TextField("Enter status", text: $task.status)
                    .textFieldStyle(.roundedBorder)
                
                Text("Notes")
                    .font(.headline)
                
                TextEditor(text: $task.notes)
                    .frame(height: 180)
                    .padding(6)
                    .background(Color.white)
                    .cornerRadius(10)
                
                Button(action: {
                    dismiss()
                }) {
                    Text("Save Changes")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 180, height: 45)
                        .background(Color(red: 0.39, green: 0.32, blue: 0.86))
                        .cornerRadius(12)
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 10)
                
                Spacer()
            }
            .padding(20)
        }
        .navigationTitle("Edit Task")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    EditTaskView(task: .constant(Task(title: "Assignment 1", dueDate: "Mar 25", status: "In Progress", notes: "Edit this task")))
}
