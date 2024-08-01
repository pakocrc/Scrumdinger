//
//  NewScrumSheet.swift
//  Scrumdinger
//
//  Created by Francisco Cordoba on 31/7/24.
//

import SwiftUI

struct NewScrumSheet: View {
    @Binding var isPresentingNewScrumView: Bool
    @Binding var scrums: [DailyScrum]
    @State private var newScrum = DailyScrum.emptyScrum

    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $newScrum)
                .toolbar(content: {
                    ToolbarItem(placement: .cancellationAction) {
                        Button {
                            setPresentingScrumView()
                        } label: {
                            Text("Dismiss")
                        }
                    }

                    ToolbarItem(placement: .confirmationAction) {
                        Button {
                            scrums.append(newScrum)
                            setPresentingScrumView()
                        } label: {
                            Text("Save")
                        }
                    }
                })
        }
    }

    private func setPresentingScrumView() {
        isPresentingNewScrumView = false
    }
}

#Preview {
    NewScrumSheet(isPresentingNewScrumView: .constant(true),
                  scrums: .constant(DailyScrum.sampleData))
}
