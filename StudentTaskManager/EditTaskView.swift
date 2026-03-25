//
//  ContentView.swift
//  EditTaskView.txt
//
//  Created by Macbook on 2026-03-22.
//


import SwiftUI
struct EditTaskView: View {

    @Binding var task: Tas
    @Environment(\.dismiss) var dismiss

    @State private var showDatePicker = false

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

    Text("Edit Tasks")
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

  ScrollView {
    VStack(alignment: .leading, spacing: 20) {

    Text("Task Title") 
        .font(.headline)

    TextField("Enter task title", text: $task.title)
      .padding()
     .background(Color(.systemGray5))
     .cornerRadius(10)

     Text("Due Date")
    .font(.headline)

      Button(action: {
      showDatePicker.toggle()
     }) {
      HStack {
        Spacer()

          Text(task.dueDate.formatted(date: .abbreviated, time: .omitted))
                          .foregroundColor(.black)
                       Spacer()
                    }
                      .padding()
                      .background(Color(.systemGray5))
                      .cornerRadius(10)
                    }

                    if showDatePicker {
                        DatePicker(
                          "",
                        selection: $task.dueDate,
                       displayedComponents: .date
                           )
                     .datePickerStyle(.graphical)
                     .labelsHidden()
                    .background(Color.white)
                        .cornerRadius(12)
                      .onChange(of: task.dueDate) { _ in
                       showDatePicker = false
                           }
                           }

               Text("Priority")
                .font(.headline)

                     Picker("Priority", selection: $task.status) {
                     Text("In Progress").tag("In Progress")
                     Text("Completed").tag("Completed")
                     Text("Overdue").tag("Overdue")
                          }
                       .pickerStyle(.menu)
                       .padding()
                       .background(Color(.systemGray5))
                       .cornerRadius(10)

                Text("Notes")
                 .font(.headline)

            TextEditor(text: $task.notes)
                 .frame(height: 160)
                    .padding(8)
                    .background(Color(.systemGray5))
                    .cornerRadius(10)

            Button(action: {
              dismiss()
                        }) {
           Text("Save Changes")
             .font(.headline)
                 .foregroundColor(.white)
                 .frame(maxWidth: .infinity)
                 .frame(height: 50)
                 .background(Color(red: 0.39, green: 0.32, blue: 0.86))
                 .cornerRadius(12)
                     }
           .padding(.top, 10)
                     }
           .padding(20)
                  }
                  }
                  }
           .ignoresSafeArea(.keyboard, edges: .bottom)
                  }
                  }

            #Preview {
            EditTaskView(
            task: .constant(
                    Task(
                       title: "Project UI Design - Mobile Appl.",
                        dueDate: Date(),
                        status: "In Progress",
                         notes: "Design the main UI screens for the mobile application."
                                )
                                )
                                )
                               }

