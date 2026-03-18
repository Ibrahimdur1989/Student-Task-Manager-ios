//
//  SplashView.swift
//  StudentTaskManager
//
//  Created by Group 7 on 2026-03-18.
//

import SwiftUI

struct SplashView: View {
    
    @Binding var showSplash: Bool
    
    var body: some View {
        ZStack {
            Color(red: 0.40, green: 0.33, blue: 0.90)
                .ignoresSafeArea()
            
            VStack(spacing: 25) {
                
                Image(systemName: "checkmark.circle")
                    .resizable()
                    .frame(width: 130, height: 130)
                    .foregroundColor(.green)
                
                Text("Student Task Manager")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Stay organized with your tasks")
                    .foregroundColor(.white)
                
                Text("Ebrahim Al-Serri")
                    .foregroundColor(.white)
                
                Text("Ahmed Ashoor")
                    .foregroundColor(.white)
                
                Text("Loading...")
                    .foregroundColor(.white)
                    .padding(.top, 40)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                showSplash = false
            }
        }
    }
}

#Preview {
    SplashView(showSplash: .constant(true))
}
