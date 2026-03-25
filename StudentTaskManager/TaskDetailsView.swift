//
//  ContentView.swift
//  TaskDetailsView
//
//  Created by Macbook on 2026-03-24.
//

import SwiftUI

   struct AboutView: View {

          @Environment(\.dismiss) var dismiss

              var body: some View {
                  NavigationStack {
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

                         Text("About")
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

                                  VStack(spacing: 24) {
                                   Spacer()

                                  Image(systemName: "checkmark.circle")
                               .resizable()
                               .frame(width: 110, height: 110)
                               .foregroundColor(.green)

                                 Text("Student Task Manager")
                                  .font(.title)
                                  .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                    Text("This app helps students organize their academic tasks, track due dates, and manage progress in a simple way.")
                          .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 30)

                             VStack(spacing: 10) {
                          Text("Developed by:")
                            .font(.headline)

                      Text("Ebrahim Al-Serri - 101085527")
                      Text("Ahmad Ashoor -  101136881")
                    }

                            Spacer()
                          }
                         .padding()
                         }
                         }
                         }
                          }
                          }

                    #Preview {
                  AboutView()
                        }
