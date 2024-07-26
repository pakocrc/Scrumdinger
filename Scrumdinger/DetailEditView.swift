//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Francisco Cordoba on 26/7/24.
//

import SwiftUI

struct DetailEditView: View {
    @State private var scrum = DailyScrum.emptyScrum

    var body: some View {
        Form {
            Section {
                TextField("Title", text: $scrum.title)
            } header: {
                Text("Meeting Info")
            }

        }
    }
}

#Preview {
    DetailEditView()
}
