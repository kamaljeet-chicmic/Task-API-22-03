//
//  UsersListApp.swift
//  UsersList
//
//  Created by Nitin on 3/22/23.
//

import SwiftUI

@main
struct UsersListApp: App {
    
    @StateObject private var dataModel = DataModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(DataModel())
        }
    }
}
