//
//  ScrumView.swift
//  Scrumdinger
//
//  Created by Francisco Cordoba on 25/7/24.
//

import SwiftUI

struct ScrumsView: View {
    @Environment(\.scenePhase) private var scenePhase
    @Binding var scrums: [DailyScrum]
    @State private var isPresentingNewScrumView = false

    let saveAction: ()->Void

    var body: some View {
        NavigationStack {
            List($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button(action: { 
                    isPresentingNewScrumView = true

                    
                }) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New scrum")
            }
        }
        .sheet(isPresented: $isPresentingNewScrumView, content: {
            NewScrumSheet(isPresentingNewScrumView: $isPresentingNewScrumView, scrums: $scrums)
        })
        .onChange(of: scenePhase) {
            print("Scene phase: \(scenePhase)")

            if scenePhase == .inactive {
                saveAction()
            }
        }
    }
}

#Preview {
    ScrumsView(scrums: .constant(DailyScrum.sampleData), saveAction: {})
}
