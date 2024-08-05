//
//  History.swift
//  Scrumdinger
//
//  Created by Francisco Cordoba on 31/7/24.
//

import Foundation

struct History: Identifiable, Codable {
    let id: UUID
    let date: Date
    var attendees: [DailyScrum.Attendee]
    var transcript: String?

    var attendeeString: String {
        ListFormatter.localizedString(byJoining: attendees.map { $0.name })
    }

    init(id: UUID = UUID(), date: Date = Date(), attendees: [DailyScrum.Attendee], transcript: String? = nil) {
        self.id = id
        self.date = date
        self.attendees = attendees
        self.transcript = transcript
    }
}
