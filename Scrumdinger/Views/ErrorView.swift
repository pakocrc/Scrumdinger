//
//  ErrorView.swift
//  Scrumdinger
//
//  Created by Francisco Cordoba on 1/8/24.
//

import SwiftUI

struct ErrorView: View {
    @Environment(\.dismiss) private var dismiss
    let errorWrapper: ErrorWrapper

    var body: some View {
        NavigationStack {
            VStack {
                Text("An error has occurred")
                    .font(.title)
                    .padding(.bottom)

                Text(errorWrapper.error.localizedDescription)
                    .font(.headline)

                Text(errorWrapper.guidance)
                    .font(.caption)
                Spacer()
            }
            .padding()
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 16.0))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Dismiss") {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    enum SampleError: Error {
        case errorRequired
    }

    static var wrapper: ErrorWrapper {
        ErrorWrapper(error: SampleError.errorRequired,
                     guidance: "You can safely ignore this error.")
    }

    static var previews: some View {
        ErrorView(errorWrapper: wrapper)
    }
}
