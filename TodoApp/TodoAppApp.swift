//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by SDN SPR on 2/4/22.
//

import SwiftUI

@main
struct TodoAppApp: App {
    
   @StateObject var listViewModel: TodoViewModel = TodoViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
            ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
