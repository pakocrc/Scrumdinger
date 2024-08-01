//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Francisco Cordoba on 24/7/24.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    //    @State private var scrums = DailyScrum.sampleData
    @StateObject private var scrumStore = ScrumStore()

    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrumStore.scrums, saveAction: {
                Task {
                    do {
                        try await scrumStore.save(scrums: scrumStore.scrums)
                    } catch {
                        print("[ScrumdingerApp] Exception catched while saving: \(error.localizedDescription)")
                    }
                }
            })
            .task(priority: .high) {
                print("Scrums view task with task priority: \(TaskPriority.high.description)")
                Task {
                    do {
                        try await scrumStore.load()
                    }  catch {
                        print("[ScrumdingerApp] Exception catched while loading: \(error.localizedDescription)")
                    }
                }
            }
        }
    }
}
//xcrun simctl get_app_container booted com.automata.Scrumdinger data
