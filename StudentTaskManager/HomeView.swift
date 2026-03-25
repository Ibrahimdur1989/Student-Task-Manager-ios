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
    
    var sortedTaskIndices: [Int] {
        tasks.indices.sorted { tasks[$0].dueDate < tasks[$1].dueDate }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.82, green: 0.90, blue: 0.97)
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    
                    HStack {
                        Spacer()
                        
                        Text("Student Task Manager")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .lineLimit(1).minimumScaleFactor(0.8)
                        
                        Spacer()
                        
                        Menu {
                            NavigationLink("Home", destination: HomeView())
                            NavigationLink("About", destination: AboutView())
                        } label: {
                            Image(systemName: "line.3.horizontal")
                                .font(.title3)
                                .foregroundColor(.black)
                        }
                    }
                    .padding()
                    .background(Color(red: 0.39, green: 0.32, blue: 0.86))
                    
                    VStack(alignment: .leading, spacing: 14) {
                        Text("All Tasks:")
                            .font(.title2)
                            .padding(.top, 18)
                            .padding(.horizontal, 20)
                        
                        if tasks.isEmpty {
                            Spacer()
                            
                            Text("No tasks added yet.")
                                .font(.headline)
                                .foregroundColor(.gray)
                                .frame(maxWidth: .infinity)
                            
                            Spacer()
                        } else {
                            ScrollView {
                                VStack(spacing: 14) {
                                    ForEach(sortedTaskIndices, id: \.self) { index in
                                        NavigationLink(destination: TaskDetailsView(task: $tasks[index])) {
                                            VStack(alignment: .leading, spacing: 10) {
                                                Text(tasks[index].title)
                                                    .font(.headline)
                                                    .foregroundColor(.white)
                                                
                                                HStack {
                                                    Text("Due: \(tasks[index].dueDate.formatted(date: .abbreviated, time: .omitted))")
                                                        .foregroundColor(.white)
                                                    
                                                    Spacer()
                                                    
                                                    Text(tasks[index].statusLabel)
                                                        .foregroundColor(.white)
                                                }
                                            }
                                            .padding()
                                            .frame(maxWidth: .infinity)
                                            .background(tasks[index].cardColor)
                                            .cornerRadius(18)
                                        }
                                        .buttonStyle(.plain)
                                        
                                    }
                                }
                                .padding(.horizontal, 16)
                                .padding(.top, 4)
                                .padding(.bottom, 20)
                            }
                        }
                        
                        
                        
                        Button(action: {
                            showAddTask = true
                        }) {
                            ZStack {
                                Circle()
                                    .stroke(Color.green, lineWidth: 3)
                                    .frame(width: 48, height: 48)
                                
                                Image(systemName: "plus")
                                    .font(.title2)
                                    .foregroundColor(.green)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.bottom, 18)
                    }
                }
            }
            .sheet(isPresented: $showAddTask) {
                AddTaskView { newTask in
                    tasks.append(newTask)
                    tasks.sort { $0.dueDate < $1.dueDate }
                }
            }
        }        
    }
}

extension Task {
    var isOverdue: Bool {
        let today = Calendar.current.startOfDay(for: Date())
        let taskDay = Calendar.current.startOfDay(for: dueDate)
        return status != "Completed" && taskDay < today
    }
    
    var cardColor: Color {
        if status == "Completed" {
            return .green
        } else if isOverdue {
            return .red
        } else {
            return Color.purple
        }
    }
    
    var statusLabel: String {
        if status == "Completed" {
            return "Completed"
        } else if isOverdue {
            return "Overdue"
        } else {
            return "In Progress"
        }
    }
}

#Preview {
    HomeView()
}
