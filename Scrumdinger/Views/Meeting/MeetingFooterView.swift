//
//  MeetingFooterView.swift
//  Scrumdinger
//
//  Created by Francisco Cordoba on 31/7/24.
//

import SwiftUI

struct MeetingFooterView: View {
    let speakers: [ScrumTimer.Speaker]
    var skipAction: ()->Void
    @Environment (\.dismiss) var dismiss

    private var speakerNumber: Int? {
        guard let index = speakers.firstIndex(where: { !$0.isCompleted }) else { return nil }
        return index + 1
    }
    private var isLastSpeaker: Bool {
        return speakers.dropLast().allSatisfy { $0.isCompleted }
    }

    private var speakerText: String {
        guard let speakerNumber = speakerNumber else { return "No more speakers" }
        return "Speaker \(speakerNumber) of \(speakers.count)"
    }

    var body: some View {
        VStack {
            HStack {
                if isLastSpeaker {
                    VStack {
                        Text("Last Speaker")
                        
                        Button {
                            dismiss()
                        } label: {
                            Text("Finish")
                        }
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding([.leading, .trailing])
                        .background(Color(.red))
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                        .padding(.top)
                    }

                } else {
                    Text(speakerText)
                    Spacer()
                    Button(action: skipAction) {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel("Next speaker")
                }
            }
        }
        .padding([.bottom, .horizontal])
    }
}

struct MeetingFooterView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingFooterView(speakers: DailyScrum.sampleData[0].attendees.speakers, skipAction: {})
            .previewLayout(.sizeThatFits)
    }
}
