//
//  HomeView.swift
//  StudentTaskManager
//
//  Created by Group 7 on 2026-03-18.
//

import SwiftUI

struct HomeView: View {
    
    @State private var tasks: [Task] = []
    @State private var showAddTask = false
    
    var body: some View {
        NavigationStack {
            
            VStack {
                Text("All Tasks")
                    .font(.title)
                    .padding()
                
                List {
                    ForEach(tasks) { task in
                        VStack(alignment: .leading) {
                            Text(task.title)
                                .font(.headline)
                            
                            Text("Due: \(task.dueDate)")
                            Text(task.status)
                        }
                    }
                }
                
                Button(action: {
                    showAddTask = true
                }) {
                    Text("Add Task")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
            }
            .navigationBarTitle("Home")
            .sheet(isPresented: $showAddTask) {
                AddTaskView { newTask in
                    tasks.append(newTask)
                }
            }
        }
    }
}
