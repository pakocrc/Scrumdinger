//
//  ErrorWrapper.swift
//  Scrumdinger
//
//  Created by Francisco Cordoba on 1/8/24.
//

import Foundation

struct ErrorWrapper: Identifiable {
    let id: UUID
    let error: Error
    let guidance: String

    init(id: UUID = UUID(), error: Error, guidance: String) {
        self.id = id
        self.error = error
        self.guidance = guidance
    }
}
