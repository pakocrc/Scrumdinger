//
//  Theme.swift
//  Scrumdinger
//
//  Created by Francisco Cordoba on 25/7/24.
//

import SwiftUI

enum Theme: String {
    case bubblegum
    case buttercup
    case indigo2
    case lavender
    case magenta2
    case navy
    case orange2
    case oxblood
    case periwinkle
    case poppy
    case purple2
    case seafoam
    case sky
    case tan
    case teal2
    case yellow2

    var accentColor: Color {
        switch self {
        case .bubblegum, .buttercup, .lavender, .orange2, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal2, .yellow2: return .black
        case .indigo2, .magenta2, .navy, .oxblood, .purple2: return .white
        }
    }

    var mainColor: Color {
        Color(rawValue)
    }

    var name: String {
        rawValue.capitalized
    }
}
