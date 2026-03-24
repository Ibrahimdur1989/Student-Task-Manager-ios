//
//  ContentView.swift
//  TaskDetailsView
//
//  Created by Macbook on 2026-03-24.
//


import SwiftUI


struct TaskDetailsView: View {
    
    @Binding var task: Task
    @Environment(\.dismiss) var dismiss
    
    @State private var showEditTask = false
    
    var body: some View {
        ZStack {
            Color(red: 0.82, green: 0.90, blue: 0.97)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                // Top Bar
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    Text("Task Details")
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
                        .font(.headline)
                    
                    Text(task.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color(.systemGray5))
                        .cornerRadius(10)
                    
                    Text("Due Date")
                        .font(.headline)
                    
                    Text(task.dueDate.formatted(date: .abbreviated, time: .omitted))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color(.systemGray5))
                        .cornerRadius(10)
                    
                    Text("Status")
                        .font(.headline)
                    
                    Text(taskStatusText)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color(.systemGray5))
                        .cornerRadius(10)
                    
                    Text("Notes")
                        .font(.headline)
                    
                    Text(task.notes.isEmpty ? "No notes added." : task.notes)
                        .frame(maxWidth: .infinity, minHeight: 160, alignment: .topLeading)
                        .padding()
                        .background(Color(.systemGray5))
                        .cornerRadius(10)
                    
                    Button(action: {
                        showEditTask = true
                    }) {
                        Text("Edit Task")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color(red: 0.39, green: 0.32, blue: 0.86))
                            .cornerRadius(12)
                    }
                    .padding(.top, 10)
                    
                    Spacer()
                }
                .padding(20)
            }
        }
        .sheet(isPresented: $showEditTask) {
            EditTaskView(task: $task)
        }
    }
    
    var taskStatusText: String {
        let today = Calendar.current.startOfDay(for: Date())
        let taskDay = Calendar.current.startOfDay(for: task.dueDate)
        
        if task.status == "Completed" {
            return "Completed"
        } else if taskDay < today {
            return "Overdue"
        } else {
            return "In Progress"
        }
    }
}

#Preview {
    TaskDetailsView(
        task: .constant(
            Task(
                title: "Project UI Design - Mobile Appl.",
                dueDate: Date(),
                status: "In Progress",
                notes: "Complete the task details screen and connect it with edit task view."
            )
        )
    )
}
