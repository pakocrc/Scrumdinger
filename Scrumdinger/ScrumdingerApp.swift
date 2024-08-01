//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Francisco Cordoba on 24/7/24.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
                .onAppear(perform: {
                    print("Scrums view on appear!")
                })
                .onDisappear(perform: {
                    print("Scrums view on disappear!")
                })
                .task(priority: TaskPriority.high) {
                    print("Scrums view task with task priority: \(TaskPriority.high.description)")
                }
        }
    }
}
