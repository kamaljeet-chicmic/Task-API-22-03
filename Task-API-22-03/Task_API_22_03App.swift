//
//  Task_API_22_03App.swift
//  Task-API-22-03
//
//  Created by Paras  on 22/03/23.
//

import SwiftUI

@main
struct Task_API_22_03App: App {
    
    var userViewModel = UserViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userViewModel)
                
        }
    }
}
