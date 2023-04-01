//
//  workspaceApp.swift
//  workspace
//
//  Created by Vlad on 26.03.2023.
//

import SwiftUI

@main
struct workspaceApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            LoginView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
