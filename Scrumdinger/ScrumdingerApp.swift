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
    @State private var errorWrapper: ErrorWrapper?

    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrumStore.scrums, saveAction: {
                Task {
                    do {
                        try await scrumStore.save(scrums: scrumStore.scrums)
                    } catch {
                        print("[ScrumdingerApp] Exception catched while saving: \(error.localizedDescription)")
                        errorWrapper = ErrorWrapper(error: error, guidance: "Try again later")
                    }
                }
            })
            .task {
                do {
                    try await scrumStore.load()
                }  catch {
                    print("[ScrumdingerApp] Exception catched while loading: \(error.localizedDescription)")
                    errorWrapper = ErrorWrapper(error: error, guidance: "App will load sample data and continue")
                }
            }
            .sheet(item: $errorWrapper, onDismiss: {
                scrumStore.scrums = DailyScrum.sampleData
            }, content: { wrapper in
                ErrorView(errorWrapper: wrapper)
            })
        }
    }
}
//xcrun simctl get_app_container booted com.automata.Scrumdinger data
