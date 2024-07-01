//
//  Image_AppApp.swift
//  Image_App
//
//  Created by Ambika on 6/30/24.
//

import SwiftUI

@main
struct Image_AppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
