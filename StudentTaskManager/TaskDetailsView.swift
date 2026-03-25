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
 
                  VStack(spacing: 30) {

                  VStack(alignment: .leading, spacing: 20) {
          Text("Task: \(task.title)")
                    .font(.headline)
                    .foregroundColor(.white)

                     HStack {
            Text("Due: \(task.dueDate.formatted(date: .abbreviated, time: .omitted))")
                    .foregroundColor(.white)

             Spacer()

               Text(taskStatusText)
                      .foregroundColor(.white)
                }

              Text("Notes: \(task.notes.isEmpty ? "No notes added." : task.notes)")
                       .foregroundColor(.white)
               }
                       .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                         .background(Color.purple)
                         .cornerRadius(20)
                         .padding(.horizontal, 25)
                         .padding(.top, 50)

                  Button(action: {
                    task.status = "Completed"
               }) {
                        HStack {
                         Image(systemName: "checkmark")
            Text("Mark as Completed")
               }
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 220, height: 45)
                        .background(Color.green)
                        .cornerRadius(10)
                }

         HStack(spacing: 50) {
            Button(action: {
                 showEditTask = true
               }) {
            Text("Edit")
                       .font(.headline)
                       .foregroundColor(.white)
                       .frame(width: 80, height: 40)
                       .background(Color(red: 0.39, green: 0.32, blue: 0.86))
                       .cornerRadius(10)
                }
 
              Button(action: {
                      dismiss()
                  }) {
                  Text("Delete")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 80, height: 40)
                        .background(Color.red)
                        .cornerRadius(10)
                       }
                      }

                    Spacer()
                           }
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
                   return "âœ“ Completed"
                      } else if taskDay < today {
                         return "âš  Overdue"
                             } else {
                                return "âŒ› In Progress"
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
                      notes: "Design the main UI screens for the mobile application using Figma and submit them in PDF"
                          )
                        )
                     )
                   }
