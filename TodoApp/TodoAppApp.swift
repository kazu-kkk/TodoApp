//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by ひろせ on 2024/08/24.
//

import SwiftUI

@main
struct TodoAppApp: App {
    var body: some Scene {
        WindowGroup {
            DashboardView()
                .environmentObject(UserData())
        }
    }

}



