//
//  AddTaskView.swift
//  StudentTaskManager
//
//  Created by Group 7 on 2026-03-18.
//

import SwiftUI

struct AddTaskView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var dueDate = Date()
    @State private var notes = ""
    
    var onSave: (Task) -> Void
    
    var body: some View {
        ZStack {
            Color(red: 0.82, green: 0.90, blue: 0.97)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    Text("Add New Task")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Menu {
                        Button("Home") { }
                        Button("About") { }
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .font(.title3)
                            .foregroundColor(.black)
                            
                    }
                }
                .padding()
                .background(Color(red: 0.39, green: 0.32, blue: 0.86))
                
                VStack(alignment: .leading, spacing: 22) {
                    Text("Task Title")
                        .font(.title3)
                    
                    TextField("Enter Task name...", text: $title)
                        .padding()
                        .background(Color(.systemGray5))
                        .cornerRadius(8)
                    
                    Text("Due Date")
                        .font(.title3)
                    
                    DatePicker("", selection: $dueDate, displayedComponents: .date)
                        .datePickerStyle(.compact)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color(.systemGray5))
                        .cornerRadius(8)
                    
                    Text("Notes")
                        .font(.title3)
                    
                    ZStack(alignment: .topLeading) {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(.systemGray5))
                            .frame(height: 180)
                        
                        TextEditor(text: $notes)
                            .scrollContentBackground(.hidden)
                            .background(Color.clear)
                            .frame(height: 160)
                            .padding(8)
                        
                        if notes.isEmpty {
                            Text("Add additional details...")
                                .foregroundColor(.gray)
                                .padding(.top, 18)
                                .padding(.leading, 14)
                        }
                    }
                    
                    Button(action: {
                        let newTask = Task(
                            title: title,
                            dueDate: dueDate,
                            status: "In Progress",
                            notes: notes
                        )
                        
                        onSave(newTask)
                        dismiss()
                    }) {
                        Text("Save Task")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 150)
                            .background(Color(red: 0.39, green: 0.32, blue: 0.86))
                            .cornerRadius(12)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 10)
                    
                    Spacer()
                }
                .padding(20)
            }
        }
    }
}

#Preview {
    AddTaskView { _ in }
}
