//
//  Theme.swift
//  Scrumdinger
//
//  Created by Francisco Cordoba on 25/7/24.
//

import SwiftUI

enum Theme: String, CaseIterable, Identifiable, Codable {
    case bubblegum
    case buttercup
    case indigos
    case lavender
    case magentas
    case navy
    case oranges
    case oxblood
    case periwinkle
    case poppy
    case purples
    case seafoam
    case sky
    case tan
    case teals
    case yellows

    var accentColor: Color {
        switch self {
        case .bubblegum, .buttercup, .lavender, .oranges, .periwinkle, .poppy, .seafoam, .sky, .tan, .teals, .yellows: return .black
        case .indigos, .magentas, .navy, .oxblood, .purples: return .white
        }
    }

    var mainColor: Color {
        Color(rawValue)
    }

    var name: String {
        rawValue.capitalized
    }

    var id: String {
        name
    }
}
