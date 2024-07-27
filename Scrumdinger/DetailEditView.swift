//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Francisco Cordoba on 26/7/24.
//

import SwiftUI

struct DetailEditView: View {
    @Binding var scrum: DailyScrum
    @State private var newAttendeeName = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Title", text: $scrum.title)
                HStack {
                    Text("Length")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                        .font(.callout)
                        .fontWeight(.bold)
                        .accessibilityHidden(true)
                }
                Slider(value: $scrum.lengthInMinutesAsDobule, in: 5...30, step: 1) {
                    Text("Length")
                }
                .accessibilityValue("\(scrum.lengthInMinutes) minutes")

                ThemePicker(selection: $scrum.theme)
            } header: {
                Text("Meeting Info")
            }

            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete(perform: { indexSet in
                    deleteAttendee(indexSet)
                })

                HStack {
                    TextField("New Attendee", text: $newAttendeeName)
                    Button(action: {
                        withAnimation {
                            addAttendee()
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add Attendee")
                    }
                    .disabled(newAttendeeName.isEmpty)
                }
            }
        }
    }

    func addAttendee() {
        let attendee = DailyScrum.Attendee(name: newAttendeeName)
        scrum.attendees.append(attendee)
        newAttendeeName = ""
    }

    func deleteAttendee(_ indexSet: IndexSet) {
        scrum.attendees.remove(atOffsets: indexSet)
    }
}

#Preview {
    DetailEditView(scrum: .constant(DailyScrum.emptyScrum))
}
