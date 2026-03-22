//
//  ContentView.swift
//  StudentTaskManager
//
//  Created by Group 7 on 2026-03-17.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showSplash = true
    
    var body: some View {
        Group {
            if showSplash {
                SplashView(showSplash: $showSplash)
            } else {
                HomeView()
            }
        }
    }
}

#Preview {
    ContentView()
}
